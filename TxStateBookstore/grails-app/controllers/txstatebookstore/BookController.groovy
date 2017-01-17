package txstatebookstore



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import java.nio.charset.Charset

@Transactional(readOnly = true)
class BookController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
		if(!session.user) redirect(controller:"User", action: "login")
        params.max = Math.min(max ?: 10, 100)
        respond Book.list(params), model:[bookInstanceCount: Book.count()]
    }

    def show(Book bookInstance) {
		if(!session.user) redirect(controller:"User", action: "login")		
        respond bookInstance
    }

    def create() { if(!session.user) redirect(controller:"User", action: "login")
        respond new Book(params)
    }

    @Transactional
    def save(Book bookInstance) { if(!session.user) redirect(controller:"User", action: "login")
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view:'create'
            return
        }
		def uploadedFile = request.getFile('bookImage')
		bookInstance.bookImage = uploadedFile.getBytes()
		bookInstance.bookImageType = uploadedFile.contentType
        bookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])
                redirect bookInstance
            }
            '*' { respond bookInstance, [status: CREATED] }
        }
    }

    def edit(Book bookInstance) { if(!session.user) redirect(controller:"User", action: "login")
        respond bookInstance
    }

    @Transactional
    def update(Book bookInstance) { if(!session.user) redirect(controller:"User", action: "login")
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view:'edit'
            return
        }
		
		def uploadedFile = request.getFile('bookImage')
		bookInstance.bookImage = uploadedFile.getBytes()		
		bookInstance.bookImageType = uploadedFile.contentType
        bookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.id])
                redirect bookInstance
            }
            '*'{ respond bookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Book bookInstance) { if(!session.user) redirect(controller:"User", action: "login")

        if (bookInstance == null) {
            notFound()
            return
        }

        bookInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() { if(!session.user) redirect(controller:"User", action: "login")
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	/**
	 * Added by SJ
	 * @return
	 */
	def search() {
		def map = [:]
		
		if(!params.keyword || !params.searchBy || params.keyword == 'Search') {
			redirect controller: "index", action: "index"
		}
		
		def searchResults
		if(params.searchBy == 'title') {
			searchResults = Book.findAllByTitleLike('%' + params.keyword + '%', [max: 50, sort: 'title', order: 'asc'])
		}
		if(params.searchBy == 'author') {
			searchResults = Book.withCriteria {
				authors{
					like("authorName",'%' + params.keyword + '%')
				}
				maxResults(50)
				order("title", "asc")
			}
		}
		if(params.searchBy == 'subject') {
			def subject = Subject.findByCourseNameLike('%'+params.keyword+'%')
			if(subject == null) {
				searchResults = null
			}
			else {
				def booklist = []
				for(bid in subject.courseBooks.split(',')) {
					def bookToAdd = Book.get(bid)
					if(bookToAdd != null)
					booklist.add(bookToAdd)
				}
				searchResults = booklist
			}
		}
		if(params.searchBy == 'isbn') {
			searchResults = Book.findAllByIsbnLike('%' + params.keyword + '%', [max: 50, sort: 'title', order: 'asc'])
		}
		if(params.searchBy == 'courseNumber') {
			def subject = Subject.findByCourseNumberLike('%'+params.keyword+'%')
			if(subject == null) {
				searchResults = null
			}
			else {
				def booklist = []
				for(bid in subject.courseBooks.split(',')) {
					def bookToAdd = Book.get(bid)
					if(bookToAdd != null)
					booklist.add(bookToAdd)
				}
				searchResults = booklist
			}
		}
		if(params.searchBy == 'professor') {
			searchResults = Book.withCriteria {
				users{
					like("firstName",'%' + params.keyword + '%')
					or {
						like("lastName",'%' + params.keyword + '%')
					}
				}
			}
			maxResults(50)
			order("title", "asc")
		}
		
		map.put("searchResults", searchResults)
		render(view: 'search', model: map)
	}
	
	def showPayload() {
		def bookInstance = Book.get(params.id)
		// write the image to the output stream		
		response.setHeader("Content-disposition", "attachment; filename=${bookInstance.id}")
		response.contentType = bookInstance.bookImageType
		response.outputStream << bookInstance.bookImage	
		response.outputStream.flush()
	}
	
	/*Functions below have been Added by Shraddha*/
	/**
	 * 
	 * @return
	 */
	def addToCart() {
		def cart
		def map = [:]
		
		if(session.myCart != null){
			cart = session.myCart
			
		}else{
			cart = [:]
			cart["subtotal"] = ["quantity": 0, "amount":0.0]
		}
		def bookId = params.id;
		if(cart.containsKey(bookId)){
			cart[bookId]["quantity"] = cart[bookId]["quantity"] + 1
		}else
		{
			def book = Book.findById(bookId)
			if(book != null){
				cart[bookId] = ["title": book.title, "price":book.price, "quantity": 1, "isbn": book.isbn]
			}
		}
		
		cart["subtotal"]["quantity"] = cart["subtotal"]["quantity"] + 1;
		cart["subtotal"]["amount"] = cart["subtotal"]["amount"] + (cart[bookId]["price"]);
		
		map.put('cart', cart)
		map.put('user', User.get(session.userId))
		
		session.myCart = cart
		render(view: 'myCart', model: map)
	}
	
	def viewCart(){
		def map = [:]	
		map.put('user', User.get(session.userId))
		render(view: 'myCart', model: map)
	}
	
	
	def addToWaitingList(Book bookInstance){
		
		
		def waitingUser = new WaitingUser(book:bookInstance, user:session.user, dateRequested:new Date());
		waitingUser.save flush:true
		flash.message = "Book added to waiting list."
		println waitingUser
		render(view:'addWaiting',model:bookInstance)
	}
	
	def deleteFromCart(){
		def cart
		if(session.myCart != null){
			cart = session.myCart
			
			//retrieve book id of book to be deleted 
			def bookId = params.id;
			def book = null;
			if(cart.containsKey(bookId)){
				book =  Book.findById(bookId);
			}
			
			//If book found in cart; and it exists in DB delete it from cart
			if(book!=null){
				cart["subtotal"]["quantity"] = cart["subtotal"]["quantity"] - cart[bookId]["quantity"];
				cart["subtotal"]["amount"] = cart["subtotal"]["amount"] - (cart[bookId]["price"]*cart[bookId]["quantity"]);
			
				cart.remove(bookId)
				
				if(cart.size() == 1 && cart.containsKey("subtotal")){
					cart["subtotal"] = ["quantity": 0, "amount":0.0]
				}	
				session.myCart = cart;
			}
		}
		render(view: 'myCart')
	}
	
	def updateCart(){
		
		def bookId = params.id;
		def quantity = params.quantity;
		System.out.println("id: "+ bookId)
		if(quantity!=null)
			quantity = Integer.valueOf(quantity);
		
		def cart = session.myCart;
		if(cart != null){
			if(quantity!=null && cart.containsKey(bookId) && quantity >= 0){
				cart["subtotal"]["quantity"] = cart["subtotal"]["quantity"] - cart[bookId]["quantity"] + quantity;
				cart["subtotal"]["amount"] = cart["subtotal"]["amount"] - (cart[bookId]["price"]*cart[bookId]["quantity"]) + (cart[bookId]["price"]*quantity);
				cart[bookId]["quantity"] = quantity;
			}
				
		}
		System.out.print("Quantity : "+ cart["subtotal"]["quantity"] +", amount="+cart["subtotal"]["amount"]+ ", book qt= "+cart[bookId]["quantity"])
		session.myCart = cart;
		def map = [:]
		map.put('user', User.get(session.userId))
		render(view: 'myCart', model:map)
	}
	
	def checkAvailability(Book book){
		if(book==null)
			return false;
			
		book = Book.findById(book.id);
		if(book==null)
				return false;
				
		if(book.quantity <= 0)
			return false;
		return true;
	}
	
	def BooksForCourseIndex() {
		
	}
}

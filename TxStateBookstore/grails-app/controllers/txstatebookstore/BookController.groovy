package txstatebookstore



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import java.nio.charset.Charset

@Transactional(readOnly = true)
class BookController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
		if(!session.userName) redirect(controller:"User", action: "login")
        params.max = Math.min(max ?: 10, 100)
        respond Book.list(params), model:[bookInstanceCount: Book.count()]
    }

    def show(Book bookInstance) {
		if(!session.userName) redirect(controller:"User", action: "login")		
        respond bookInstance
    }

    def create() { if(!session.userName) redirect(controller:"User", action: "login")
        respond new Book(params)
    }

    @Transactional
    def save(Book bookInstance) { if(!session.userName) redirect(controller:"User", action: "login")
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

    def edit(Book bookInstance) { if(!session.userName) redirect(controller:"User", action: "login")
        respond bookInstance
    }

    @Transactional
    def update(Book bookInstance) { if(!session.userName) redirect(controller:"User", action: "login")
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
    def delete(Book bookInstance) { if(!session.userName) redirect(controller:"User", action: "login")

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

    protected void notFound() { if(!session.userName) redirect(controller:"User", action: "login")
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
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
			searchResults = Book.withCriteria {
				subjects{
					like("courseName",'%' + params.keyword + '%')
				}
			}
			maxResults(50)
			order("title", "asc")
		}
		if(params.searchBy == 'isbn') {
			searchResults = Book.findAllByIsbnLike('%' + params.keyword + '%', [max: 50, sort: 'title', order: 'asc'])
		}
		if(params.searchBy == 'courseNumber') {
			searchResults = Book.withCriteria {
				subjects{
					like("courseNumber",'%' + params.keyword + '%')
				}
			}
			maxResults(50)
			order("title", "asc")
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
	
	def addToCart() {
		def cart
		def map = [:]
		
		if(session.myCart != null){
			cart = session.myCart
			
		}else{
			cart = [:]
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
		
		map.put('cart', cart)
		session.myCart = cart;
		render(view: 'myCart')
	}
	
	def viewCart(){
		def map = [:]
		render(view: 'myCart', model: map)
	}
}

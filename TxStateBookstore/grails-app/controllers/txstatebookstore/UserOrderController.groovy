package txstatebookstore



import static org.springframework.http.HttpStatus.*

import org.mozilla.javascript.ast.ForInLoop;

import grails.transaction.Transactional

@Transactional
class UserOrderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) { if(!session.user) redirect(controller:"User", action: "login")
        params.max = Math.min(max ?: 10, 100)
        respond UserOrder.list(params), model:[userOrderInstanceCount: UserOrder.count()]
    }

    def show(UserOrder userOrderInstance) { if(!session.user) redirect(controller:"User", action: "login")
        respond userOrderInstance
    }

    def create() { if(!session.user) redirect(controller:"User", action: "login")
        respond new UserOrder(params)
    }

    @Transactional
    def save(UserOrder userOrderInstance) { if(!session.user) redirect(controller:"User", action: "login")
        if (userOrderInstance == null) {
            notFound()
            return
        }

        if (userOrderInstance.hasErrors()) {
            respond userOrderInstance.errors, view:'create'
            return
        }

        userOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userOrder.label', default: 'UserOrder'), userOrderInstance.id])
                redirect userOrderInstance
            }
            '*' { respond userOrderInstance, [status: CREATED] }
        }
    }

    def edit(UserOrder userOrderInstance) { if(!session.user) redirect(controller:"User", action: "login")
        respond userOrderInstance
    }

    @Transactional
    def update(UserOrder userOrderInstance) { if(!session.user) redirect(controller:"User", action: "login")
        if (userOrderInstance == null) {
            notFound()
            return
        }

        if (userOrderInstance.hasErrors()) {
            respond userOrderInstance.errors, view:'edit'
            return
        }

        userOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserOrder.label', default: 'UserOrder'), userOrderInstance.id])
                redirect userOrderInstance
            }
            '*'{ respond userOrderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserOrder userOrderInstance) { if(!session.user) redirect(controller:"User", action: "login")

        if (userOrderInstance == null) {
            notFound()
            return
        }

        userOrderInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserOrder.label', default: 'UserOrder'), userOrderInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() { if(!session.user) redirect(controller:"User", action: "login")
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userOrder.label', default: 'UserOrder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	/*Methods added by shraddha*/
	def showOrder(UserOrder userOrderInstance) { 
		if(!session.user) redirect(controller:"User", action: "login")
		
		def map=[:]
		map.put("userOrderInstance", UserOrder.get(userOrderInstance.id))
		map.put("orderDetails", UserOrderDetail.findAllByUserOrder(userOrderInstance))
		//Calculate total
		def sum = 0;
		def cnt = 0;
		for(o in UserOrderDetail.findAllByUserOrder(userOrderInstance)){
			sum+= (o.unitPrice * o.quantity)
			cnt+=o.quantity
		}
		map.put("orderQuantity", cnt)		
		map.put("orderTotal", sum)
		render(view:'showOrder', model:map)
	}

	@Transactional
	def checkout(){
		def cart
		def totalAmount
		def quantity
		boolean isCreated = false
		def userOrderDetailsMap = [:]
		
		if(session.myCart == null) {
			flash.message = "Your cart is empty, no items available for checkout."
			redirect(controller:'Book', action:'viewCart')
			return
		}
		
		cart = session.myCart		
		Set keys = cart.keySet()
		
		for (key in keys) {
			if(!key.equals("subtotal")){
				def book = Book.get(key)
				
				if(book == null){
					flash.message = "Sorry, the book you have requested is not available!"
					redirect(controller:'Book', action:'viewCart')
					return
				}
				//check if available
				if(book.quantity <= 0){
					flash.message = "Sorry, the book '"+ book.title +"' is not available!"
					redirect(controller:'Book', action:'viewCart')
					return
				}
				if(book.quantity < cart[key]["quantity"]){
					flash.message = "Sorry, only "+book.quantity+" copy/copies are available for book '"+book.title+"'. Please modify your cart before checkout."
					redirect(controller:'Book', action:'viewCart')
					return
				}
				
				book.quantity = book.quantity - cart[key]["quantity"]
				book.save flush: true	
				userOrderDetailsMap.put(book, cart[key]["quantity"])
			}
		}
		
		if(userOrderDetailsMap.isEmpty()) {
			flash.message = "Sorry! Error processing your order, please try again."
			redirect(controller:'Book', action:'viewCart')
			return
		}

		def paymentMode = (params.paymentMode == 'Credit Card')? 'card' : 'cash'
		def userOrder = new UserOrder(user: User.get(session.userId), orderDate: new Date(), status: 'placed', paymentMode: paymentMode)
		userOrder.save flush:true
		
		for (bk in userOrderDetailsMap.keySet()) {		
			def userOrderDetail = new UserOrderDetail(userOrder:userOrder, book: bk, quantity: userOrderDetailsMap[bk], unitPrice: bk.price)
			userOrderDetail.save flush:true	
			
			if(userOrderDetail.hasErrors()){
				println "error with userOrderDetail object"
				break
			}
		}
		
		cart = [:]
		cart["subtotal"] = ["quantity": 0, "amount":0.0]
		session.myCart = cart
		flash.message = "Your order has been placed successfully!"
		showOrder(UserOrder.get(userOrder.id))
	}
	
	def report() {
		render(view: 'report')
	}
	
	def getReport() {
		def month = params.month
		def year = params.year
		if(month == null || month == '' || year == null || year == '') {
			flash.message =  "No year/month selected"
			render(view: 'report')
		}
		month = (month.size() == 1)? '0' + month : month
		
		def date1 = Date.parse("yyyy-MM-dd", year + "-" + month + "-01")
		def date2 = Date.parse("yyyy-MM-dd", year + "-" + month + "-28")
		
		def orders = UserOrder.findAllByOrderDateBetween(date1, date2)
		render(view: 'getReport', model: ['orders' : orders,'orderMonth':month, 'orderYear':year])
	}
	
	def pastOrders() { if(!session.user) redirect(controller:"User", action: "login")
		def userId = session.userId
		def userOrders = UserOrder.findAllByUser(User.get(userId))
		def map = [:]
		map.put('userOrderInstanceList', userOrders)
		render(view:'index', model:map);
	}

}

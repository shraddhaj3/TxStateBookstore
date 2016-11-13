package txstatebookstore



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserOrderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) { if(!session.userName) redirect(controller:"User", action: "login")
        params.max = Math.min(max ?: 10, 100)
        respond UserOrder.list(params), model:[userOrderInstanceCount: UserOrder.count()]
    }

    def show(UserOrder userOrderInstance) { if(!session.userName) redirect(controller:"User", action: "login")
        respond userOrderInstance
    }

    def create() { if(!session.userName) redirect(controller:"User", action: "login")
        respond new UserOrder(params)
    }

    @Transactional
    def save(UserOrder userOrderInstance) { if(!session.userName) redirect(controller:"User", action: "login")
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

    def edit(UserOrder userOrderInstance) { if(!session.userName) redirect(controller:"User", action: "login")
        respond userOrderInstance
    }

    @Transactional
    def update(UserOrder userOrderInstance) { if(!session.userName) redirect(controller:"User", action: "login")
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
    def delete(UserOrder userOrderInstance) { if(!session.userName) redirect(controller:"User", action: "login")

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

    protected void notFound() { if(!session.userName) redirect(controller:"User", action: "login")
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userOrder.label', default: 'UserOrder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

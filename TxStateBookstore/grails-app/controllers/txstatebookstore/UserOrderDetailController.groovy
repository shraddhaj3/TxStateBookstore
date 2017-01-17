package txstatebookstore



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserOrderDetailController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) { if(!session.user) redirect(controller:"User", action: "login")
        params.max = Math.min(max ?: 10, 100)
        respond UserOrderDetail.list(params), model:[userOrderDetailInstanceCount: UserOrderDetail.count()]
    }

    def show(UserOrderDetail userOrderDetailInstance) { if(!session.user) redirect(controller:"User", action: "login")
        respond userOrderDetailInstance
    }

    def create() { if(!session.user) redirect(controller:"User", action: "login")
        respond new UserOrderDetail(params)
    }

    @Transactional
    def save(UserOrderDetail userOrderDetailInstance) { if(!session.user) redirect(controller:"User", action: "login")
        if (userOrderDetailInstance == null) {
            notFound()
            return
        }

        if (userOrderDetailInstance.hasErrors()) {
            respond userOrderDetailInstance.errors, view:'create'
            return
        }

        userOrderDetailInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userOrderDetail.label', default: 'UserOrderDetail'), userOrderDetailInstance.id])
                redirect userOrderDetailInstance
            }
            '*' { respond userOrderDetailInstance, [status: CREATED] }
        }
    }

    def edit(UserOrderDetail userOrderDetailInstance) { if(!session.user) redirect(controller:"User", action: "login")
        respond userOrderDetailInstance
    }

    @Transactional
    def update(UserOrderDetail userOrderDetailInstance) { if(!session.user) redirect(controller:"User", action: "login")
        if (userOrderDetailInstance == null) {
            notFound()
            return
        }

        if (userOrderDetailInstance.hasErrors()) {
            respond userOrderDetailInstance.errors, view:'edit'
            return
        }

        userOrderDetailInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserOrderDetail.label', default: 'UserOrderDetail'), userOrderDetailInstance.id])
                redirect userOrderDetailInstance
            }
            '*'{ respond userOrderDetailInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserOrderDetail userOrderDetailInstance) { if(!session.user) redirect(controller:"User", action: "login")

        if (userOrderDetailInstance == null) {
            notFound()
            return
        }

        userOrderDetailInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserOrderDetail.label', default: 'UserOrderDetail'), userOrderDetailInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() { if(!session.user) redirect(controller:"User", action: "login")
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userOrderDetail.label', default: 'UserOrderDetail'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

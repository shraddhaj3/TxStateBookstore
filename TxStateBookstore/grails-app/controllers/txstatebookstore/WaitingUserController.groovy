package txstatebookstore



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class WaitingUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) { if(!session.user) redirect(controller:"User", action: "login")
        params.max = Math.min(max ?: 10, 100)
        respond WaitingUser.list(params), model:[waitingUserInstanceCount: WaitingUser.count()]
    }

    def show(WaitingUser waitingUserInstance) { if(!session.user) redirect(controller:"User", action: "login")
        respond waitingUserInstance
    }

    def create() { if(!session.user) redirect(controller:"User", action: "login")
        respond new WaitingUser(params)
    }

    @Transactional
    def save(WaitingUser waitingUserInstance) { if(!session.user) redirect(controller:"User", action: "login")
        if (waitingUserInstance == null) {
            notFound()
            return
        }

        if (waitingUserInstance.hasErrors()) {
            respond waitingUserInstance.errors, view:'create'
            return
        }

        waitingUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'waitingUser.label', default: 'WaitingUser'), waitingUserInstance.id])
                redirect waitingUserInstance
            }
            '*' { respond waitingUserInstance, [status: CREATED] }
        }
    }

    def edit(WaitingUser waitingUserInstance) { if(!session.user) redirect(controller:"User", action: "login")
        respond waitingUserInstance
    }

    @Transactional
    def update(WaitingUser waitingUserInstance) { if(!session.user) redirect(controller:"User", action: "login")
        if (waitingUserInstance == null) {
            notFound()
            return
        }

        if (waitingUserInstance.hasErrors()) {
            respond waitingUserInstance.errors, view:'edit'
            return
        }

        waitingUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'WaitingUser.label', default: 'WaitingUser'), waitingUserInstance.id])
                redirect waitingUserInstance
            }
            '*'{ respond waitingUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(WaitingUser waitingUserInstance) { if(!session.user) redirect(controller:"User", action: "login")

        if (waitingUserInstance == null) {
            notFound()
            return
        }

        waitingUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'WaitingUser.label', default: 'WaitingUser'), waitingUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() { if(!session.user) redirect(controller:"User", action: "login")
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'waitingUser.label', default: 'WaitingUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	/*Code added by Reena*/
	def show1(){if(!session.user) redirect(controller:"User", action: "login")
		redirect action: "index", method: "GET"
		WaitingUser U1 = new WaitingUser ()
		U1.getId()
		show(U1)
	}
}

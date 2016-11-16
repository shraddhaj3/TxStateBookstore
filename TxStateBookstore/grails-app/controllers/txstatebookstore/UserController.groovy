package txstatebookstore



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) { if(!session.userName) redirect(controller:"User", action: "login")
		if(!session.userName) redirect(controller:"User", action: "login")
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) { if(!session.userName) redirect(controller:"User", action: "login")
        respond userInstance
    }

    def create() { if(!session.userName) redirect(controller:"User", action: "login")
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) { if(!session.userName) redirect(controller:"User", action: "login")
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) { if(!session.userName) redirect(controller:"User", action: "login")
        respond userInstance
    }

    @Transactional
    def update(User userInstance) { if(!session.userName) redirect(controller:"User", action: "login")
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) { if(!session.userName) redirect(controller:"User", action: "login")

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def login() {
		clearSessionObjects()
	}
	
	def validate() {
		//either present proper credentials, or login as admin with password admin
		def user = User.findByUserNameAndPassword(params.username, params.password)
		if(user != null) {
			session.userName = user.userName
			session.role = user.role
			session.userId = user.id
			session.myCart = null
			redirect controller:'Index', action: 'index'
		}
		else{
			flash.message = "Invalid username and password."
			render view:'login'
		}
	}
	
	def logout() {
		clearSessionObjects()
		session.invalidate()
		redirect(uri:'/')
	}
	
	def clearSessionObjects(){
		session.userName = null
		session.role = null
		session.userId = null
		session.myCart = null
	}
}

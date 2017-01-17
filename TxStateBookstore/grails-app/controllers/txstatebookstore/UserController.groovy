package txstatebookstore

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) { if(!session.user) redirect(controller:"User", action: "login")
/**Tanvi
		if(!session.user) redirect(controller:"User", action: "login")
*/
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) { 
		/**Tanvi
		if(!session.user) redirect(controller:"User", action: "login")
		*/
        respond userInstance
    }

    def create() {
		/**Tanvi
		 if(!session.user) redirect(controller:"User", action: "login")
		 */
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) { 
		/**Tanvi
		if(!session.user) redirect(controller:"User", action: "login")
		*/
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

    def edit(User userInstance) { 
		/**if(!session.user) redirect(controller:"User", action: "login")*/
        respond userInstance
    }

    @Transactional
    def update(User userInstance) { 
		/*if(!session.user) redirect(controller:"User", action: "login")*/
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

		/*update user object in session*/
		if(!session.user){session.user = User.get(userInstance)}
		
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) { 
		/**if(!session.user) redirect(controller:"User", action: "login")*/

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
	
	/*Changes by SJ*/
	def login() {
		clearSessionObjects()
	}
	
	def validate() {
		
		//either present proper credentials, or login as admin with password admin
		def user = User.findByUserNameAndPassword(params.username, params.password)
		
		if(user != null) {
			session.user = user
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
		session.user = null
		session.userId = null
		session.myCart = null
	}
	/*Changes by SJ end here*/
	/*Changes below by TB*/
	def registration(){
		respond new User(params)
		/**
		render view: 'registration'
		*/
	}
	
	def changePassword(User userInstance){
		/**Tanvi-If change password should come to login page in main.gsp rather than main.gsp
		 if(!session.user) redirect(controller:"User", action: "login")
		 */
		respond userInstance
	}
	
	@Transactional
	def saveRegistration(User userInstance) {
		/**Tanvi
		if(!session.user) redirect(controller:"User", action: "login")
		*/
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
				/**respond userInstance*/
				/**redirect userInstance*/
				redirect ( controller:"Address", action: "add", params: ['user.id' : userInstance.id])
			}
			'*' { respond userInstance, [status: CREATED] }
		}
	}
	
	def address(){
		redirect (controller:"Address", action: "add", params: ['user.id' : userInstance.id])
	}
	
	@Transactional
	def updateUser(User userInstance) { 
		/*if(!session.user) redirect(controller:"User", action: "login")*/
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
				redirect ( controller:"Address", action: "edit", params: ['user.id' : userInstance.id])
			}
			'*'{ respond userInstance, [status: OK] }
		}
	}
}

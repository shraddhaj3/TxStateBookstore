package txstatebookstore



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AddressController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		if(!session.userName) redirect(controller:"User", action: "login")
        params.max = Math.min(max ?: 10, 100)
        respond Address.list(params), model:[addressInstanceCount: Address.count()]
    }

    def show(Address addressInstance) {
		if(!session.userName) redirect(controller:"User", action: "login")
        respond addressInstance
    }

    def create() {
		if(!session.userName) redirect(controller:"User", action: "login")
        respond new Address(params)
    }

    @Transactional
    def save(Address addressInstance) {
		if(!session.userName) redirect(controller:"User", action: "login")
        if (addressInstance == null) {
            notFound()
            return
        }

        if (addressInstance.hasErrors()) {
            respond addressInstance.errors, view:'create'
            return
        }

        addressInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.id])
                redirect addressInstance
            }
            '*' { respond addressInstance, [status: CREATED] }
        }
    }

    def edit(Address addressInstance) {
		if(!session.userName) redirect(controller:"User", action: "login")
        respond addressInstance
    }

    @Transactional
    def update(Address addressInstance) {
		if(!session.userName) redirect(controller:"User", action: "login")
        if (addressInstance == null) {
            notFound()
            return
        }

        if (addressInstance.hasErrors()) {
            respond addressInstance.errors, view:'edit'
            return
        }

        addressInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Address.label', default: 'Address'), addressInstance.id])
                redirect addressInstance
            }
            '*'{ respond addressInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Address addressInstance) {
		if(!session.userName) redirect(controller:"User", action: "login")

        if (addressInstance == null) {
            notFound()
            return
        }

        addressInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Address.label', default: 'Address'), addressInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
		if(!session.userName) redirect(controller:"User", action: "login")
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

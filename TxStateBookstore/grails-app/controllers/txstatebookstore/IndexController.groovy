package txstatebookstore

class IndexController {

    def index() { 
		if(!session.user) redirect(controller:"User", action: "login")
		
		render(view: "/index")
	}
	
	def contact() {
		render(view: "/contact")
	}
	
	def help() {
		render(view: "/help")
	}
}

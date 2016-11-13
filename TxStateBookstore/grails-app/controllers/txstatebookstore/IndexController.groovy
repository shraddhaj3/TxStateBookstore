package txstatebookstore

class IndexController {

    def index() { 
		if(!session.userName) redirect(controller:"User", action: "login")
		
		render(view: "/index")
	}
}

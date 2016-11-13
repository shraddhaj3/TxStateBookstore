import java.util.Date
import txstatebookstore.*

class BootStrap {

    def init = { servletContext ->
		new User(firstName: "Shraddha", lastName: "Jadhav", userName:"admin", password: "admin", email: "shraddha@txstate.edu", role:"admin").save()
		
    }
    def destroy = {
    }
}

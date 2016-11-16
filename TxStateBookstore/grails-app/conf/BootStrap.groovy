import java.util.Date
import txstatebookstore.*

class BootStrap {

    def init = { servletContext ->
		//Create Users
		new User(firstName: "Shraddha", lastName: "Jadhav", userName:"admin", password: "admin", email: "shraddha@txstate.edu", role:"admin").save()
		new User(firstName: "Student", lastName: "Student", userName:"stud", password: "stud", email: "student@txstate.edu", role:"student").save()
		new User(firstName: "Faculty", lastName: "Faculty", userName:"fact", password: "fact", email: "factulty@txstate.edu", role:"faculty").save()
		
		//Create Books
		
		//Create Authors
    }
    def destroy = {
    }
}

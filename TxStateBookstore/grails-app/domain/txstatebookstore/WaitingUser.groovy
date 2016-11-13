package txstatebookstore

class WaitingUser {

	User user
	Date dateRequested
	static belongsTo = [book: Book]
    static constraints = {
		user()
		dateRequested()
    }
	
}

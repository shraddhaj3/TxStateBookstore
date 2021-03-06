package txstatebookstore

class Subject {

	String courseName
	String courseNumber
	String courseBooks = ''
	static hasMany = [books: Book, users: User]
	static belongsTo = [Book, User]
		
    static constraints = {
		courseName(maxSize: 60)
		courseNumber(maxSize: 6)
		courseBooks(nullable: true, blank: true)
		courseNumber(unique: ['courseNumber']) 
    }


	@Override
	public String toString() {
		return "Subject [courseName=" + courseName + ", courseNumber="
				+ courseNumber + "]";
	}
	
	
}

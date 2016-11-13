package txstatebookstore

class Book {

	String title
	String isbn
	String publisher
	Integer yearOfPublication
	Float price = 0.0
	byte[] bookImage
	String bookImageType
	Integer quantity = 0

	static hasMany= [authors:Author, waitingUsers:WaitingUser, users: User, subjects: Subject]

	    static constraints = {
			title(maxSize: 60)
			isbn(maxSize: 15)
			publisher(maxSize: 60)
			yearOfPublication(nullable:true, min: 1900, max: 2050)
			isbn(unique:['isbn'])
			bookImage(nullable:true, maxSize:524880 /*5MB*/)
			bookImageType(nullable:true)
			quantity(min:0)
		}


		@Override
		public String toString() {
			return "Book [title=" + title + ", isbn=" + isbn + "]";
		}
}

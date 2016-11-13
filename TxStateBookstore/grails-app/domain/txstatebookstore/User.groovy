package txstatebookstore

class User {

	String firstName
	String lastName
	String userName
	String email
	Long phone
	String password
	String role = 'student'
	Date dateCreated = new Date()
	
	//Credit card details
	String cardType
	String cardNumber
	Integer cvv
	Date expirationDate
	String nameOnCard
	
	static hasMany = [addresses : Address, books: Book, subjects: Subject]
	static belongsTo = Book
	
    static constraints = {
		firstName(maxSize: 60)
		lastName(maxSize: 60)
		userName(maxSize: 8)
		email(maxSize: 50)
		phone(nullable: true, blank:true, min:1000000000L, max: 9999999999L)
		password(maxSize: 30, password: true)
		role(inList:['student','faculty','admin'])
		
		nameOnCard(nullable:true, blank:true, minSize: 1, maxSize: 60 )
		cardType(nullable:true, blank:true, inList:['Visa','Mastercard','Discover','American Express'])
		cardNumber(nullable:true, blank:true,maxSize: 16)
		cvv(nullable:true, blank:true,maxSize:4)
		expirationDate(nullable:true, blank:true, min: new Date())
		
		userName(unique: ['userName', 'email'])
    }


	@Override
	public String toString() {
		return userName
	}

}

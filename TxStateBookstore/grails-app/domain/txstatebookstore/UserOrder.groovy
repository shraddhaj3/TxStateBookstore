package txstatebookstore

class UserOrder {

	Date orderDate
	User user
	String paymentMode
	Date pickupDate
	String status = 'placed'
	String orderComments

	static hasMany = [userOrderDetails : UserOrderDetail]
	
	static constraints = {
		user()
		orderDate()
		paymentMode(inList:['cash','card'])
		pickupDate (nullable: true)
		status(inList : ['placed','ready to pick','completed'])
		orderComments(nullable: true, blank: true, maxSize: 100)
	}


	@Override
	public String toString() {
		return "UserOrder: " + this.id + ", [orderDate=" + orderDate + ", user=" + user + ", status=" + status + "]";
	}
	
}

package txstatebookstore

class UserOrderDetail {

	Book book
	Integer quantity
	Float unitPrice
	
	static belongsTo = [userOrder : UserOrder]
	
    static constraints = {
		book()
		quantity(min:1)
		unitPrice()
    }


	@Override
	public String toString() {
		return "UserOrderDetail [book=" + book + ", quantity=" + quantity
				+ ", unitPrice=" + unitPrice + "]";
	}
	
	
}

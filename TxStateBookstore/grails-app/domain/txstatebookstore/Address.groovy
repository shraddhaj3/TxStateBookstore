package txstatebookstore

class Address {
	String addressLine1
	String addressLine2
	String state
	Integer zipCode
	String addressType = 'mailing'
   
	 static constraints = {
		 addressLine1(maxSize: 30)
		 addressLine2(maxSize: 30)
		 state(maxSize: 20)
		 zipCode(maxSize: 5, min: 10000, max: 99999)
		 addressType(inList:['mailing','billing'])
	 }
	 
	 static belongsTo = [user:User]


	@Override
	public String toString() {
		return "addressLine1=" + addressLine1 + ", addressLine2="
				+ addressLine2 + ", state=" + state + ", zipCode=" + zipCode.toString()
				+ ", addressType=" + addressType
	}
}

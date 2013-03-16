package revlsms

class AvailLaundryService extends PersonInfo{

	String email
	String laundryStatus
	
	Package packageName
	Date availLaundryDate
	//Double price
	
	//static belongsTo = [Customer]

    static constraints = {
		email()
		availLaundryDate()
		packageName()
		//price(inList:["30", "45", "60"])
		laundryStatus(inList:["Done", "InProgress"])
    }
	
	static searchable = true
}

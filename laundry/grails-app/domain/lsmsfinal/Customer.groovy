package lsmsfinal

class Customer {

	String firstName
	String middleName
	String lastName
	String contact
	String address
	
	String email
	String laundryStatus
	
	Date availLaundryDate
	CustomPackage packageName
	
	static hasMany = [customPackage:CustomPackage]

    static constraints = {
		firstName(blank:false)
		middleName(blank:false)
		lastName(blank:false)
		contact(blank:false)
		address()
		email()
		
		availLaundryDate()
		laundryStatus(inList:["Done", "InProgress"])
		packageName()
    }
	
	static searchable = true
}

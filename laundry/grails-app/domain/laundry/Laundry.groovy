package laundry

class Laundry {
	Customer customer
	CustomPackage customPackage
	
	String laundryStatus
	Date availLaundryDate
	
	static belongsTo = [Customer]
	static hasMany = [customPackage:CustomPackage]

    static constraints = {
		customer()
		customPackage()
		
		availLaundryDate()
		laundryStatus(inList:["Done", "In Progress"])
    }
	
	static searchable = true
	
	String toString(){
		"${availLaundryDate}: Availed ${this.customPackage} Status: ${laundryStatus}"
	}
}

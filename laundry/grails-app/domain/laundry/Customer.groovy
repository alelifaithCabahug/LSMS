package laundry

class Customer {

	String firstName
	String middleName
	String lastName
	String contact
	String address
	
	String email
	
	static hasMany = [laundry:Laundry]

    static constraints = {
		firstName(blank:false)
		middleName(blank:false)
		lastName(blank:false)
		contact(blank:false)
		address()
		email()
    }
	
	static searchable = true
	
	String toString(){
		"${this.firstName}" + " ${this.middleName}" + " ${this.lastName}"
	}
}

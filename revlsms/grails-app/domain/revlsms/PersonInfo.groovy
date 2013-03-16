package revlsms

class PersonInfo {

	String firstName
	String middleName
	String lastName
	String contact
	String address
 
	static constraints = {
		firstName(blank:false)
		middleName(blank:false)
		lastName(blank:false)
		contact(blank:false)
		address()
  }
  
	static searchable = true
  
 	 String toString(){
		"${this.firstName}" + " ${this.middleName}" + " ${this.lastName}"
	}
}

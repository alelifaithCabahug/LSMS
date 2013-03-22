package lsmsfinal

class Crew {

	String firstName
	String middleName
	String lastName
	String contact
	String address
	
	Job job
	Date jobDate

    static constraints = {
		firstName(blank:false)
		middleName(blank:false)
		lastName(blank:false)
		contact(blank:false)
		address()
		
		job()
		jobDate()
    }
	
	static searchable = true
	
	String toString(){
		"${this.firstName}" + " ${this.middleName}" + " ${this.lastName}"
	}
}

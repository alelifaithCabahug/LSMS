package revlsms

class Crew extends PersonInfo{

	Job job
	Date jobDate

    static constraints = {
		job()
		jobDate()
    }
	
	 static searchable = true
	 
}


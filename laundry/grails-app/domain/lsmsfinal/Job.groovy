package lsmsfinal

class Job {

	String jobName
	
	static hasMany = [crew: Crew]

    static constraints = {
		jobName()
    }
	
	static searchable = true
	
	String toString(){
		"${this.jobName}"
	}
}
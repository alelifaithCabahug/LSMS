package revlsms

class Package {

	String packageName
	Date packageCreated
	Double packagePrice
	
	Resources name
	Integer quantityNeeded
	
	static hasMany = [resources:Resources]

    static constraints = {
		packageName(blank:false)
		packageCreated()
		packagePrice()
		name()
		quantityNeeded()
    }
	
	static searchable = true
	
	String toString(){
		"${packageName}"
	}
}

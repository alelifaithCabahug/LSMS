package laundry

class CustomPackage {

	String packageName
	Integer packagePrice
	Integer clothesKilo
	
	static hasMany = [resource:Resource]

    static constraints = {
		packageName(blank:false)
		clothesKilo(blank:false, min:1)
		packagePrice(blank:false, min:20)
    }
	
	static searchable = true
	
	String toString(){
		"${packageName}"
	}
	
}

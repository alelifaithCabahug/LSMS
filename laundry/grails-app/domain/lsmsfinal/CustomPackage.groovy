package lsmsfinal

class CustomPackage {

	String packageName
	Double packagePrice
	Double clothesKilo
	
	static hasMany = [resource:Resource]
	
	static belongsTo = [Customer]

    static constraints = {
		packageName(blank:false)
		clothesKilo(blank:false)
		packagePrice(blank:false)
    }
	
	static searchable = true
	
	String toString(){
		"${packageName}"
	}
	
}

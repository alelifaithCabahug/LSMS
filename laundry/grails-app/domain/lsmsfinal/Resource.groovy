package lsmsfinal

class Resource {

	String name
	Double quantity
	
	static belongsTo = [CustomPackage]

    static constraints = {
		name(blank:false, unique:true)
		quantity(blank:false)
    }
	
	static searchable = true
	
	String toString(){
		"${name}"
	}
}
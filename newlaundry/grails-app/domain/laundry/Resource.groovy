package laundry

class Resource {

	String name
	Integer quantity
	
	static belongsTo = [CustomPackage]

    static constraints = {
		name(blank:false, unique:true)
		quantity(blank:false, min:1)
    }
	
	static searchable = true
	
	String toString(){
		"${name}"
	}
}
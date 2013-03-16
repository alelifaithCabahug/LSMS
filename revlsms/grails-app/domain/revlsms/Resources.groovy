package revlsms

class Resources {

	String name
	Integer quantity

    static constraints = {
		name(blank:false)
		quantity(blank:false)
    }
	
	static belongsTo = [Package]
	
	String toString(){
		"${name}"
	}
	
	double getNewQuantity()
	{
		double result = 0;
		
		resources.each()
		{
			result = it.resources.quantity - it.package.quantityNeeded
		}
		return result;
	}
}
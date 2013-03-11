package lsms

class Package {

	String Pname
	Double price

    static constraints = {
		pname(blank:false)
		price(blank:false)
    }
	
	static searchable = true
	
	String toString(){
		"${Pname}"
	}
}

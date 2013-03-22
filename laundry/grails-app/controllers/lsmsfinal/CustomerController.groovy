package lsmsfinal

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class CustomerController {
	def dataSource

    static allowedMethods = [save: "POST", upavail_laundry_date: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [customerInstanceList: Customer.list(params), customerInstanceTotal: Customer.count()]
    }

    def create() {
        [customerInstance: new Customer(params)]
    }

    def save() {
        def customerInstance = new Customer(params)
        if (!customerInstance.save(flush: true)) {
            render(view: "create", model: [customerInstance: customerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])
        redirect(action: "show", id: customerInstance.id)
    }

    def show(Long id) {
        def customerInstance = Customer.get(id)
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        [customerInstance: customerInstance]
    }

    def edit(Long id) {
        def customerInstance = Customer.get(id)
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        [customerInstance: customerInstance]
    }

    def upavail_laundry_date(Long id, Long version) {
        def customerInstance = Customer.get(id)
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (customerInstance.version > version) {
                customerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customer.label', default: 'Customer')] as Object[],
                          "Another user has upavail_laundry_dated this Customer while you were editing")
                render(view: "edit", model: [customerInstance: customerInstance])
                return
            }
        }

        customerInstance.properties = params

        if (!customerInstance.save(flush: true)) {
            render(view: "edit", model: [customerInstance: customerInstance])
            return
        }

        flash.message = message(code: 'default.upavail_laundry_dated.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])
        redirect(action: "show", id: customerInstance.id)
    }

    def delete(Long id) {
        def customerInstance = Customer.get(id)
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        try {
            customerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "show", id: id)
        }
    }

		def laundryMail(){
		def customerInstance = Customer.get(params.id)
		
		if(customerInstance.email){
		sendMail {     
		  to "${customerInstance.email}"     
		 subject "LSMS Laundry Alert"     
		 html 'Hello! ' +customerInstance.firstName + ', Your laundry is now <i>done</i>.' + 
			' <br>You can now get your clothes.'+ ' <br>Thank You for your patronage!.'
			}
		}
		
	
		flash.message = "Email is now sent!"
		redirect(action:"show", id:customerInstance.id)
	
	}
	
	def searchableService
	def searchCustomer(){
		def lastName = params.lastname
		
		if(lastName){
			def srchResults = searchableService.search(lastName)
			def results = srchResults.results
			if(results)
			render(view: "list", model: [customerInstanceList: results, customerInstanceTotal: results.size()])	
			else{
				flash.message = message(code: 'Customer not found!')
				redirect(action:"list")
			}
		}else{
				flash.message = message(code: 'empty.params')
				redirect(action:"list")
			}
	}
	
	// DAILY, WEEKLY MONTHLY
	/*
	def showSales() {
	def db = new Sql(dataSource)
	def q = params.q
	def r = params.r
	def s = params.s
	
	def month

	if(r == 'Mar'){
		month = '03'
	}
	
	Date now = new Date()
	
		if(q && !r && !s){
				def resultByYear = db.rows("SELECT  * FROM customer INNER JOIN custom_package ON customer.package_name_id = custom_package.id where extract(year from customer.avail_laundry_date) = '${q}'")
				render(view:"showSales",model:[transactions:resultByYear]);
				return
		}
		
		if(q && r && !s){
				def resultByYear = db.rows("SELECT  * FROM customer INNER JOIN custom_package ON customer.package_name_id = custom_package.id where ( extract(year from customer.avail_laundry_date) = '${q}' and extract(month from customer.avail_laundry_date) = '${month}' )")
				render(view:"showSales",model:[transactions:resultByYear]);
				return
		
		}

}*/

// test

def search = {
		def db = new Sql(dataSource)
		def result, isLeapYear, i, month
		def days = []
			
		if(!params.q){
			return[:]
		}
		else{
			if(!params.r){
				return[:]
			}
			else{
				if(params.s){
					if(params.r == 'January'){
						month = 01
					}
					else if(params.r == 'February'){
						month = 02
					}
					else if(params.r == 'March'){
						month = 03
					}
					else if(params.r == 'April'){
						month = 04
					}
					else if(params.r == 'May'){
						month = 05
					}
					else if(params.r == 'June'){
						month = 06
					}
					else if(params.r == 'July'){
						month = 07
					}
					else if(params.r == 'August'){
						month = 08
					}
					else if(params.r == 'September'){
						month = 09
					}
					else if(params.r == 'October'){
						month = 10
					}
					else if(params.r == 'November'){
						month = 11
					}
					else{
						month = 12
					}
					
					result = db.rows("SELECT  * FROM customer INNER JOIN custom_package ON customer.package_name_id = customer.id WHERE extract(year from last_updated) = CAST(${params.q} as double precision) AND extract(month from last_updated) = CAST(${month} as double precision) AND extract(day from last_updated) = CAST(${params.s} as double precision)")		
					render(view: "daily", model: [searchResult: result])
				}
				else{
					if(params.r == 'January'){
						month = 01
					}
					else if(params.r == 'February'){
						month = 02
					}
					else if(params.r == 'March'){
						month = 03
					}
					else if(params.r == 'April'){
						month = 04
					}
					else if(params.r == 'May'){
						month = 05
					}
					else if(params.r == 'June'){
						month = 06
					}
					else if(params.r == 'July'){
						month = 07
					}
					else if(params.r == 'August'){
						month = 08
					}
					else if(params.r == 'September'){
						month = 09
					}
					else if(params.r == 'October'){
						month = 10
					}
					else if(params.r == 'November'){
						month = 11
					}
					else{
						month = 12
					}
					for(i=0; i < 31; i++){
						days[i] = db.rows("SELECT  * FROM customer INNER JOIN custom_package ON customer.package_name_id = customer.id WHERE extract(year from last_updated) = CAST(${params.q} as double precision) AND extract(month from last_updated) = CAST(${month} as double precision) AND extract(day from last_updated) = CAST(${i} as double precision)") 
					}
					render(view: "monthly", model: [days: days])
				}		
			}
		}
	}
	
	
	
	def annual = {}
	
	def monthly = {
	render(view:"monthly")
	}
	
	def showSales() {
		def db = new Sql(dataSource)
		def monthString = params.month
		def year = params.year
		def month
		
		
		if(monthString && year){
		
			switch(monthString){
			case 'Jan':
			month = 01;
			break;
			
			case 'Feb':
				month = 02;
				break;
			
			case 'Mar':
				month = 03;
				break;
				
			case 'Apr':
				month = 04;
				break;
				
			case 'May':
				month = 05;
				break;
				
			case 'Jun':
				month = 06;
				break;
				
			case 'Jul':
				month = 07;
				break;
				
			case 'Aug':
				month = 08;
				break;
				
			case 'Sep':
				month = 09;
				break;
				
			case 'Oct':
				month = 10;
				break;
				
			case 'Nov':
				month = 11;
				break;
				
			case 'Dec':
				month = 12;
				break;
				
		}
		
			println "year = "+ year
			println "month = " +month
			def resultByYear = db.rows("SELECT  * FROM customer INNER JOIN custom_package ON customer.package_name_id = custom_package.id where extract(year from customer.avail_laundry_date) = '${year}' and extract(month from customer.avail_laundry_date) = '${month}'")
			def total = db.rows("SELECT  sum(custom_package.package_price) FROM customer INNER JOIN custom_package ON customer.package_name_id = custom_package.id where extract(year from customer.avail_laundry_date) = '${year}' and extract(month from customer.avail_laundry_date) = '${month}'")
			render(view:"showSales",model:[transactions:resultByYear, total:total[0][0]]);
			return
		}
		
		if(year && !monthString){
			println "year = "+ year	
			def resultByYear = db.rows("SELECT  * FROM customer INNER JOIN custom_package ON customer.package_name_id = custom_package.id where extract(year from customer.avail_laundry_date) = '${year}'")
			def total = db.rows("SELECT  sum(custom_package.package_price) FROM customer INNER JOIN custom_package ON customer.package_name_id = custom_package.id where extract(year from customer.avail_laundry_date) = '${year}'")
			render(view:"showSales",model:[transactions:resultByYear, total:total[0][0]]);
			return
		}
		
		}


}

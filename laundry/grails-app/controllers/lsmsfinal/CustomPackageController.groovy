package lsmsfinal

import org.springframework.dao.DataIntegrityViolationException

class CustomPackageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [customPackageInstanceList: CustomPackage.list(params), customPackageInstanceTotal: CustomPackage.count()]
    }

    def create() {
        [customPackageInstance: new CustomPackage(params)]
    }

    def save() {
        def customPackageInstance = new CustomPackage(params)
        if (!customPackageInstance.save(flush: true)) {
            render(view: "create", model: [customPackageInstance: customPackageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'customPackage.label', default: 'CustomPackage'), customPackageInstance.id])
        redirect(action: "show", id: customPackageInstance.id)
    }

    def show(Long id) {
        def customPackageInstance = CustomPackage.get(id)
        if (!customPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customPackage.label', default: 'CustomPackage'), id])
            redirect(action: "list")
            return
        }

        [customPackageInstance: customPackageInstance]
    }

    def edit(Long id) {
        def customPackageInstance = CustomPackage.get(id)
        if (!customPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customPackage.label', default: 'CustomPackage'), id])
            redirect(action: "list")
            return
        }

        [customPackageInstance: customPackageInstance]
    }

    def update(Long id, Long version) {
        def customPackageInstance = CustomPackage.get(id)
        if (!customPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customPackage.label', default: 'CustomPackage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (customPackageInstance.version > version) {
                customPackageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customPackage.label', default: 'CustomPackage')] as Object[],
                          "Another user has updated this CustomPackage while you were editing")
                render(view: "edit", model: [customPackageInstance: customPackageInstance])
                return
            }
        }

        customPackageInstance.properties = params

        if (!customPackageInstance.save(flush: true)) {
            render(view: "edit", model: [customPackageInstance: customPackageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'customPackage.label', default: 'CustomPackage'), customPackageInstance.id])
        redirect(action: "show", id: customPackageInstance.id)
    }

    def delete(Long id) {
        def customPackageInstance = CustomPackage.get(id)
        if (!customPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customPackage.label', default: 'CustomPackage'), id])
            redirect(action: "list")
            return
        }

        try {
            customPackageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'customPackage.label', default: 'CustomPackage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customPackage.label', default: 'CustomPackage'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def searchableService
	def searchCustomPackage(){
		def packageName = params.packagename
		
		if(packageName){
			def srchResults = searchableService.search(packageName)
			def results = srchResults.results
			if(results)
			render(view: "list", model: [customPackageInstanceList: results, customPackageInstanceTotal: results.size()])	
			else{
				flash.message = message(code: 'Custom Package not found')
				redirect(action:"list")
			}
		}else{
				flash.message = message(code: 'empty.params')
				redirect(action:"list")
			}
	}
}

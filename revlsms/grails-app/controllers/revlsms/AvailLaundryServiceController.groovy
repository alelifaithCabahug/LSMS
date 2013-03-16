package revlsms

import org.springframework.dao.DataIntegrityViolationException

class AvailLaundryServiceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [availLaundryServiceInstanceList: AvailLaundryService.list(params), availLaundryServiceInstanceTotal: AvailLaundryService.count()]
    }

    def create() {
        [availLaundryServiceInstance: new AvailLaundryService(params)]
    }

    def save() {
        def availLaundryServiceInstance = new AvailLaundryService(params)
        if (!availLaundryServiceInstance.save(flush: true)) {
            render(view: "create", model: [availLaundryServiceInstance: availLaundryServiceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'availLaundryService.label', default: 'AvailLaundryService'), availLaundryServiceInstance.id])
        redirect(action: "show", id: availLaundryServiceInstance.id)
    }

    def show(Long id) {
        def availLaundryServiceInstance = AvailLaundryService.get(id)
        if (!availLaundryServiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'availLaundryService.label', default: 'AvailLaundryService'), id])
            redirect(action: "list")
            return
        }

        [availLaundryServiceInstance: availLaundryServiceInstance]
    }

    def edit(Long id) {
        def availLaundryServiceInstance = AvailLaundryService.get(id)
        if (!availLaundryServiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'availLaundryService.label', default: 'AvailLaundryService'), id])
            redirect(action: "list")
            return
        }

        [availLaundryServiceInstance: availLaundryServiceInstance]
    }

    def update(Long id, Long version) {
        def availLaundryServiceInstance = AvailLaundryService.get(id)
        if (!availLaundryServiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'availLaundryService.label', default: 'AvailLaundryService'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (availLaundryServiceInstance.version > version) {
                availLaundryServiceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'availLaundryService.label', default: 'AvailLaundryService')] as Object[],
                          "Another user has updated this AvailLaundryService while you were editing")
                render(view: "edit", model: [availLaundryServiceInstance: availLaundryServiceInstance])
                return
            }
        }

        availLaundryServiceInstance.properties = params

        if (!availLaundryServiceInstance.save(flush: true)) {
            render(view: "edit", model: [availLaundryServiceInstance: availLaundryServiceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'availLaundryService.label', default: 'AvailLaundryService'), availLaundryServiceInstance.id])
        redirect(action: "show", id: availLaundryServiceInstance.id)
    }

    def delete(Long id) {
        def availLaundryServiceInstance = AvailLaundryService.get(id)
        if (!availLaundryServiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'availLaundryService.label', default: 'AvailLaundryService'), id])
            redirect(action: "list")
            return
        }

        try {
            availLaundryServiceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'availLaundryService.label', default: 'AvailLaundryService'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'availLaundryService.label', default: 'AvailLaundryService'), id])
            redirect(action: "show", id: id)
        }
    }
}

package laundry

import org.springframework.dao.DataIntegrityViolationException

class LaundryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [laundryInstanceList: Laundry.list(params), laundryInstanceTotal: Laundry.count()]
    }

    def create() {
        [laundryInstance: new Laundry(params)]
    }

    def save() {
        def laundryInstance = new Laundry(params)
        if (!laundryInstance.save(flush: true)) {
            render(view: "create", model: [laundryInstance: laundryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'laundry.label', default: 'Laundry'), laundryInstance.id])
        redirect(action: "show", id: laundryInstance.id)
    }

    def show(Long id) {
        def laundryInstance = Laundry.get(id)
        if (!laundryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laundry.label', default: 'Laundry'), id])
            redirect(action: "list")
            return
        }

        [laundryInstance: laundryInstance]
    }

    def edit(Long id) {
        def laundryInstance = Laundry.get(id)
        if (!laundryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laundry.label', default: 'Laundry'), id])
            redirect(action: "list")
            return
        }

        [laundryInstance: laundryInstance]
    }

    def update(Long id, Long version) {
        def laundryInstance = Laundry.get(id)
        if (!laundryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laundry.label', default: 'Laundry'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (laundryInstance.version > version) {
                laundryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'laundry.label', default: 'Laundry')] as Object[],
                          "Another user has updated this Laundry while you were editing")
                render(view: "edit", model: [laundryInstance: laundryInstance])
                return
            }
        }

        laundryInstance.properties = params

        if (!laundryInstance.save(flush: true)) {
            render(view: "edit", model: [laundryInstance: laundryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'laundry.label', default: 'Laundry'), laundryInstance.id])
        redirect(action: "show", id: laundryInstance.id)
    }

    def delete(Long id) {
        def laundryInstance = Laundry.get(id)
        if (!laundryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laundry.label', default: 'Laundry'), id])
            redirect(action: "list")
            return
        }

        try {
            laundryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'laundry.label', default: 'Laundry'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'laundry.label', default: 'Laundry'), id])
            redirect(action: "show", id: id)
        }
    }
}

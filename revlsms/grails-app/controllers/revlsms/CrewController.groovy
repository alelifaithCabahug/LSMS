package revlsms

import org.springframework.dao.DataIntegrityViolationException

class CrewController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [crewInstanceList: Crew.list(params), crewInstanceTotal: Crew.count()]
    }

    def create() {
        [crewInstance: new Crew(params)]
    }

    def save() {
        def crewInstance = new Crew(params)
        if (!crewInstance.save(flush: true)) {
            render(view: "create", model: [crewInstance: crewInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'crew.label', default: 'Crew'), crewInstance.id])
        redirect(action: "show", id: crewInstance.id)
    }

    def show(Long id) {
        def crewInstance = Crew.get(id)
        if (!crewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'crew.label', default: 'Crew'), id])
            redirect(action: "list")
            return
        }

        [crewInstance: crewInstance]
    }

    def edit(Long id) {
        def crewInstance = Crew.get(id)
        if (!crewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'crew.label', default: 'Crew'), id])
            redirect(action: "list")
            return
        }

        [crewInstance: crewInstance]
    }

    def update(Long id, Long version) {
        def crewInstance = Crew.get(id)
        if (!crewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'crew.label', default: 'Crew'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (crewInstance.version > version) {
                crewInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'crew.label', default: 'Crew')] as Object[],
                          "Another user has updated this Crew while you were editing")
                render(view: "edit", model: [crewInstance: crewInstance])
                return
            }
        }

        crewInstance.properties = params

        if (!crewInstance.save(flush: true)) {
            render(view: "edit", model: [crewInstance: crewInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'crew.label', default: 'Crew'), crewInstance.id])
        redirect(action: "show", id: crewInstance.id)
    }

    def delete(Long id) {
        def crewInstance = Crew.get(id)
        if (!crewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'crew.label', default: 'Crew'), id])
            redirect(action: "list")
            return
        }

        try {
            crewInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'crew.label', default: 'Crew'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'crew.label', default: 'Crew'), id])
            redirect(action: "show", id: id)
        }
    }
}

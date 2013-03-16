package revlsms

import org.springframework.dao.DataIntegrityViolationException

class PersonInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personInfoInstanceList: PersonInfo.list(params), personInfoInstanceTotal: PersonInfo.count()]
    }

    def create() {
        [personInfoInstance: new PersonInfo(params)]
    }

    def save() {
        def personInfoInstance = new PersonInfo(params)
        if (!personInfoInstance.save(flush: true)) {
            render(view: "create", model: [personInfoInstance: personInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), personInfoInstance.id])
        redirect(action: "show", id: personInfoInstance.id)
    }

    def show(Long id) {
        def personInfoInstance = PersonInfo.get(id)
        if (!personInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), id])
            redirect(action: "list")
            return
        }

        [personInfoInstance: personInfoInstance]
    }

    def edit(Long id) {
        def personInfoInstance = PersonInfo.get(id)
        if (!personInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), id])
            redirect(action: "list")
            return
        }

        [personInfoInstance: personInfoInstance]
    }

    def update(Long id, Long version) {
        def personInfoInstance = PersonInfo.get(id)
        if (!personInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (personInfoInstance.version > version) {
                personInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'personInfo.label', default: 'PersonInfo')] as Object[],
                          "Another user has updated this PersonInfo while you were editing")
                render(view: "edit", model: [personInfoInstance: personInfoInstance])
                return
            }
        }

        personInfoInstance.properties = params

        if (!personInfoInstance.save(flush: true)) {
            render(view: "edit", model: [personInfoInstance: personInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), personInfoInstance.id])
        redirect(action: "show", id: personInfoInstance.id)
    }

    def delete(Long id) {
        def personInfoInstance = PersonInfo.get(id)
        if (!personInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            personInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'personInfo.label', default: 'PersonInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}

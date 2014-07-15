package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class DateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dateInstanceList: Date.list(params), dateInstanceTotal: Date.count()]
    }

    def create() {
        [dateInstance: new Date(params)]
    }

    def save() {
        def dateInstance = new Date(params)
        if (!dateInstance.save(flush: true)) {
            render(view: "create", model: [dateInstance: dateInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'date.label', default: 'Date'), dateInstance.id])
        redirect(action: "show", id: dateInstance.id)
    }

    def show(Long id) {
        def dateInstance = Date.get(id)
        if (!dateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'date.label', default: 'Date'), id])
            redirect(action: "list")
            return
        }

        [dateInstance: dateInstance]
    }

    def edit(Long id) {
        def dateInstance = Date.get(id)
        if (!dateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'date.label', default: 'Date'), id])
            redirect(action: "list")
            return
        }

        [dateInstance: dateInstance]
    }

    def update(Long id, Long version) {
        def dateInstance = Date.get(id)
        if (!dateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'date.label', default: 'Date'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dateInstance.version > version) {
                dateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'date.label', default: 'Date')] as Object[],
                          "Another user has updated this Date while you were editing")
                render(view: "edit", model: [dateInstance: dateInstance])
                return
            }
        }

        dateInstance.properties = params

        if (!dateInstance.save(flush: true)) {
            render(view: "edit", model: [dateInstance: dateInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'date.label', default: 'Date'), dateInstance.id])
        redirect(action: "show", id: dateInstance.id)
    }

    def delete(Long id) {
        def dateInstance = Date.get(id)
        if (!dateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'date.label', default: 'Date'), id])
            redirect(action: "list")
            return
        }

        try {
            dateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'date.label', default: 'Date'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'date.label', default: 'Date'), id])
            redirect(action: "show", id: id)
        }
    }
}

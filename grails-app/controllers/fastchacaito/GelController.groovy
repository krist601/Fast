package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class GelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [gelInstanceList: Gel.list(params), gelInstanceTotal: Gel.count()]
    }

    def create() {
        [gelInstance: new Gel(params)]
    }

    def save() {
        def gelInstance = new Gel(params)
        if (!gelInstance.save(flush: true)) {
            render(view: "create", model: [gelInstance: gelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gel.label', default: 'Gel'), gelInstance.id])
        redirect(action: "show", id: gelInstance.id)
    }

    def show(Long id) {
        def gelInstance = Gel.get(id)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }

        [gelInstance: gelInstance]
    }

    def edit(Long id) {
        def gelInstance = Gel.get(id)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }

        [gelInstance: gelInstance]
    }

    def update(Long id, Long version) {
        def gelInstance = Gel.get(id)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gelInstance.version > version) {
                gelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gel.label', default: 'Gel')] as Object[],
                          "Another user has updated this Gel while you were editing")
                render(view: "edit", model: [gelInstance: gelInstance])
                return
            }
        }

        gelInstance.properties = params

        if (!gelInstance.save(flush: true)) {
            render(view: "edit", model: [gelInstance: gelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gel.label', default: 'Gel'), gelInstance.id])
        redirect(action: "show", id: gelInstance.id)
    }

    def delete(Long id) {
        def gelInstance = Gel.get(id)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }

        try {
            gelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "show", id: id)
        }
    }
}

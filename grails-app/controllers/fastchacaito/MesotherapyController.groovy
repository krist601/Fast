package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class MesotherapyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
   

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [mesotherapyInstanceList: Mesotherapy.list(params), mesotherapyInstanceTotal: Mesotherapy.count()]
    }

    def create() {
        [mesotherapyInstance: new Mesotherapy(params)]
    }

    def save() {
        def mesotherapyInstance = new Mesotherapy(params)
        if (!mesotherapyInstance.save(flush: true)) {
            render(view: "create", model: [mesotherapyInstance: mesotherapyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mesotherapy.label', default: 'Mesotherapy'), mesotherapyInstance.id])
        redirect(action: "show", id: mesotherapyInstance.id)
    }

    def show(Long id) {
        def mesotherapyInstance = Mesotherapy.get(id)
        if (!mesotherapyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mesotherapy.label', default: 'Mesotherapy'), id])
            redirect(action: "list")
            return
        }

        [mesotherapyInstance: mesotherapyInstance]
    }

    def edit(Long id) {
        def mesotherapyInstance = Mesotherapy.get(id)
        if (!mesotherapyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mesotherapy.label', default: 'Mesotherapy'), id])
            redirect(action: "list")
            return
        }

        [mesotherapyInstance: mesotherapyInstance]
    }

    def update(Long id, Long version) {
        def mesotherapyInstance = Mesotherapy.get(id)
        if (!mesotherapyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mesotherapy.label', default: 'Mesotherapy'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mesotherapyInstance.version > version) {
                mesotherapyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'mesotherapy.label', default: 'Mesotherapy')] as Object[],
                          "Another user has updated this Mesotherapy while you were editing")
                render(view: "edit", model: [mesotherapyInstance: mesotherapyInstance])
                return
            }
        }

        mesotherapyInstance.properties = params

        if (!mesotherapyInstance.save(flush: true)) {
            render(view: "edit", model: [mesotherapyInstance: mesotherapyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mesotherapy.label', default: 'Mesotherapy'), mesotherapyInstance.id])
        redirect(action: "show", id: mesotherapyInstance.id)
    }

    def delete(Long id) {
        def mesotherapyInstance = Mesotherapy.get(id)
        if (!mesotherapyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mesotherapy.label', default: 'Mesotherapy'), id])
            redirect(action: "list")
            return
        }

        try {
            mesotherapyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mesotherapy.label', default: 'Mesotherapy'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mesotherapy.label', default: 'Mesotherapy'), id])
            redirect(action: "show", id: id)
        }
    }
}

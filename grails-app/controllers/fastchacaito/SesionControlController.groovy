package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class SesionControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [sesionControlInstanceList: SesionControl.list(params), sesionControlInstanceTotal: SesionControl.count()]
    }

    def create() {
        [sesionControlInstance: new SesionControl(params)]
    }

    def save() {
        def sesionControlInstance = new SesionControl(params)
        if (!sesionControlInstance.save(flush: true)) {
            render(view: "create", model: [sesionControlInstance: sesionControlInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sesionControl.label', default: 'SesionControl'), sesionControlInstance.id])
        redirect(action: "show", id: sesionControlInstance.id)
    }

    def show(Long id) {
        def sesionControlInstance = SesionControl.get(id)
        if (!sesionControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sesionControl.label', default: 'SesionControl'), id])
            redirect(action: "list")
            return
        }

        [sesionControlInstance: sesionControlInstance]
    }

    def edit(Long id) {
        def sesionControlInstance = SesionControl.get(id)
        if (!sesionControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sesionControl.label', default: 'SesionControl'), id])
            redirect(action: "list")
            return
        }

        [sesionControlInstance: sesionControlInstance]
    }

    def update(Long id, Long version) {
        def sesionControlInstance = SesionControl.get(id)
        if (!sesionControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sesionControl.label', default: 'SesionControl'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sesionControlInstance.version > version) {
                sesionControlInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sesionControl.label', default: 'SesionControl')] as Object[],
                          "Another user has updated this SesionControl while you were editing")
                render(view: "edit", model: [sesionControlInstance: sesionControlInstance])
                return
            }
        }

        sesionControlInstance.properties = params

        if (!sesionControlInstance.save(flush: true)) {
            render(view: "edit", model: [sesionControlInstance: sesionControlInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sesionControl.label', default: 'SesionControl'), sesionControlInstance.id])
        redirect(action: "show", id: sesionControlInstance.id)
    }

    def delete(Long id) {
        def sesionControlInstance = SesionControl.get(id)
        if (!sesionControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sesionControl.label', default: 'SesionControl'), id])
            redirect(action: "list")
            return
        }

        try {
            sesionControlInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sesionControl.label', default: 'SesionControl'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sesionControl.label', default: 'SesionControl'), id])
            redirect(action: "show", id: id)
        }
    }
}

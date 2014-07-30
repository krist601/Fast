package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class MassageControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [massageControlInstanceList: MassageControl.list(params), massageControlInstanceTotal: MassageControl.count()]
    }

    def create() {
        [massageControlInstance: new MassageControl(params)]
    }

    def save() {
        def massageControlInstance = new MassageControl(params)
        if (!massageControlInstance.save(flush: true)) {
            render(view: "create", model: [massageControlInstance: massageControlInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'massageControl.label', default: 'MassageControl'), massageControlInstance.id])
        redirect(action: "show", id: massageControlInstance.id)
    }

    def show(Long id) {
        def massageControlInstance = MassageControl.get(id)
        if (!massageControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'massageControl.label', default: 'MassageControl'), id])
            redirect(action: "list")
            return
        }

        [massageControlInstance: massageControlInstance]
    }

    def edit(Long id) {
        def massageControlInstance = MassageControl.get(id)
        if (!massageControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'massageControl.label', default: 'MassageControl'), id])
            redirect(action: "list")
            return
        }

        [massageControlInstance: massageControlInstance]
    }

    def update(Long id, Long version) {
        def massageControlInstance = MassageControl.get(id)
        if (!massageControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'massageControl.label', default: 'MassageControl'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (massageControlInstance.version > version) {
                massageControlInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'massageControl.label', default: 'MassageControl')] as Object[],
                          "Another user has updated this MassageControl while you were editing")
                render(view: "edit", model: [massageControlInstance: massageControlInstance])
                return
            }
        }

        massageControlInstance.properties = params

        if (!massageControlInstance.save(flush: true)) {
            render(view: "edit", model: [massageControlInstance: massageControlInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'massageControl.label', default: 'MassageControl'), massageControlInstance.id])
        redirect(action: "show", id: massageControlInstance.id)
    }

    def delete(Long id) {
        def massageControlInstance = MassageControl.get(id)
        if (!massageControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'massageControl.label', default: 'MassageControl'), id])
            redirect(action: "list")
            return
        }

        try {
            massageControlInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'massageControl.label', default: 'MassageControl'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'massageControl.label', default: 'MassageControl'), id])
            redirect(action: "show", id: id)
        }
    }
}

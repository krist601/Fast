package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class MachineController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [machineInstanceList: Machine.list(params), machineInstanceTotal: Machine.count()]
    }

    def create() {
        [machineInstance: new Machine(params)]
    }

    def save() {
        def machineInstance = new Machine(params)
        if (!machineInstance.save(flush: true)) {
            render(view: "create", model: [machineInstance: machineInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'machine.label', default: 'Machine'), machineInstance.id])
        redirect(action: "show", id: machineInstance.id)
    }

    def show(Long id) {
        def machineInstance = Machine.get(id)
        if (!machineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'machine.label', default: 'Machine'), id])
            redirect(action: "list")
            return
        }

        [machineInstance: machineInstance]
    }

    def edit(Long id) {
        def machineInstance = Machine.get(id)
        if (!machineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'machine.label', default: 'Machine'), id])
            redirect(action: "list")
            return
        }

        [machineInstance: machineInstance]
    }

    def update(Long id, Long version) {
        def machineInstance = Machine.get(id)
        if (!machineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'machine.label', default: 'Machine'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (machineInstance.version > version) {
                machineInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'machine.label', default: 'Machine')] as Object[],
                          "Another user has updated this Machine while you were editing")
                render(view: "edit", model: [machineInstance: machineInstance])
                return
            }
        }

        machineInstance.properties = params

        if (!machineInstance.save(flush: true)) {
            render(view: "edit", model: [machineInstance: machineInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'machine.label', default: 'Machine'), machineInstance.id])
        redirect(action: "show", id: machineInstance.id)
    }

    def delete(Long id) {
        def machineInstance = Machine.get(id)
        if (!machineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'machine.label', default: 'Machine'), id])
            redirect(action: "list")
            return
        }

        try {
            machineInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'machine.label', default: 'Machine'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'machine.label', default: 'Machine'), id])
            redirect(action: "show", id: id)
        }
    }
}

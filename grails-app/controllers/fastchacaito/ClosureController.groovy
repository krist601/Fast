package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class ClosureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [closureInstanceList: Closure.list(params), closureInstanceTotal: Closure.count()]
    }

    def create() {
        [closureInstance: new Closure(params)]
    }

    def save() {
        def closureInstance = new Closure(params)
        if (!closureInstance.save(flush: true)) {
            render(view: "create", model: [closureInstance: closureInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'closure.label', default: 'Closure'), closureInstance.id])
        redirect(action: "show", id: closureInstance.id)
    }

    def show(Long id) {
        def closureInstance = Closure.get(id)
        if (!closureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'closure.label', default: 'Closure'), id])
            redirect(action: "list")
            return
        }

        [closureInstance: closureInstance]
    }

    def edit(Long id) {
        def closureInstance = Closure.get(id)
        if (!closureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'closure.label', default: 'Closure'), id])
            redirect(action: "list")
            return
        }

        [closureInstance: closureInstance]
    }

    def update(Long id, Long version) {
        def closureInstance = Closure.get(id)
        if (!closureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'closure.label', default: 'Closure'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (closureInstance.version > version) {
                closureInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'closure.label', default: 'Closure')] as Object[],
                          "Another user has updated this Closure while you were editing")
                render(view: "edit", model: [closureInstance: closureInstance])
                return
            }
        }

        closureInstance.properties = params

        if (!closureInstance.save(flush: true)) {
            render(view: "edit", model: [closureInstance: closureInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'closure.label', default: 'Closure'), closureInstance.id])
        redirect(action: "show", id: closureInstance.id)
    }

    def delete(Long id) {
        def closureInstance = Closure.get(id)
        if (!closureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'closure.label', default: 'Closure'), id])
            redirect(action: "list")
            return
        }

        try {
            closureInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'closure.label', default: 'Closure'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'closure.label', default: 'Closure'), id])
            redirect(action: "show", id: id)
        }
    }
}

package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class VacutainerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [vacutainerInstanceList: Vacutainer.list(params), vacutainerInstanceTotal: Vacutainer.count()]
    }

    def create() {
        [vacutainerInstance: new Vacutainer(params)]
    }

    def save() {
        def vacutainerInstance = new Vacutainer(params)
        if (!vacutainerInstance.save(flush: true)) {
            render(view: "create", model: [vacutainerInstance: vacutainerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), vacutainerInstance.id])
        redirect(action: "show", id: vacutainerInstance.id)
    }

    def show(Long id) {
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        [vacutainerInstance: vacutainerInstance]
    }

    def edit(Long id) {
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        [vacutainerInstance: vacutainerInstance]
    }

    def update(Long id, Long version) {
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (vacutainerInstance.version > version) {
                vacutainerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vacutainer.label', default: 'Vacutainer')] as Object[],
                          "Another user has updated this Vacutainer while you were editing")
                render(view: "edit", model: [vacutainerInstance: vacutainerInstance])
                return
            }
        }

        vacutainerInstance.properties = params

        if (!vacutainerInstance.save(flush: true)) {
            render(view: "edit", model: [vacutainerInstance: vacutainerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), vacutainerInstance.id])
        redirect(action: "show", id: vacutainerInstance.id)
    }

    def delete(Long id) {
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        try {
            vacutainerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "show", id: id)
        }
    }
}

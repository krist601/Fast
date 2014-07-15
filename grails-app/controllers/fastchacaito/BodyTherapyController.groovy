package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class BodyTherapyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bodyTherapyInstanceList: BodyTherapy.list(params), bodyTherapyInstanceTotal: BodyTherapy.count()]
    }

    def create() {
        [bodyTherapyInstance: new BodyTherapy(params)]
    }

    def save() {
        def bodyTherapyInstance = new BodyTherapy(params)
        if (!bodyTherapyInstance.save(flush: true)) {
            render(view: "create", model: [bodyTherapyInstance: bodyTherapyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bodyTherapy.label', default: 'BodyTherapy'), bodyTherapyInstance.id])
        redirect(action: "show", id: bodyTherapyInstance.id)
    }

    def show(Long id) {
        def bodyTherapyInstance = BodyTherapy.get(id)
        if (!bodyTherapyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bodyTherapy.label', default: 'BodyTherapy'), id])
            redirect(action: "list")
            return
        }

        [bodyTherapyInstance: bodyTherapyInstance]
    }

    def edit(Long id) {
        def bodyTherapyInstance = BodyTherapy.get(id)
        if (!bodyTherapyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bodyTherapy.label', default: 'BodyTherapy'), id])
            redirect(action: "list")
            return
        }

        [bodyTherapyInstance: bodyTherapyInstance]
    }

    def update(Long id, Long version) {
        def bodyTherapyInstance = BodyTherapy.get(id)
        if (!bodyTherapyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bodyTherapy.label', default: 'BodyTherapy'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bodyTherapyInstance.version > version) {
                bodyTherapyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bodyTherapy.label', default: 'BodyTherapy')] as Object[],
                          "Another user has updated this BodyTherapy while you were editing")
                render(view: "edit", model: [bodyTherapyInstance: bodyTherapyInstance])
                return
            }
        }

        bodyTherapyInstance.properties = params

        if (!bodyTherapyInstance.save(flush: true)) {
            render(view: "edit", model: [bodyTherapyInstance: bodyTherapyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bodyTherapy.label', default: 'BodyTherapy'), bodyTherapyInstance.id])
        redirect(action: "show", id: bodyTherapyInstance.id)
    }

    def delete(Long id) {
        def bodyTherapyInstance = BodyTherapy.get(id)
        if (!bodyTherapyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bodyTherapy.label', default: 'BodyTherapy'), id])
            redirect(action: "list")
            return
        }

        try {
            bodyTherapyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bodyTherapy.label', default: 'BodyTherapy'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bodyTherapy.label', default: 'BodyTherapy'), id])
            redirect(action: "show", id: id)
        }
    }
}

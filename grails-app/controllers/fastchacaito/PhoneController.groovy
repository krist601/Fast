package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class PhoneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [phoneInstanceList: Phone.list(params), phoneInstanceTotal: Phone.count()]
    }

    def create() {
        [phoneInstance: new Phone(params)]
    }

    def save() {
        def phoneInstance = new Phone(params)
        if (!phoneInstance.save(flush: true)) {
            render(view: "create", model: [phoneInstance: phoneInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'phone.label', default: 'Phone'), phoneInstance.id])
        redirect(action: "show", id: phoneInstance.id)
    }

    def show(Long id) {
        def phoneInstance = Phone.get(id)
        if (!phoneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phone.label', default: 'Phone'), id])
            redirect(action: "list")
            return
        }

        [phoneInstance: phoneInstance]
    }

    def edit(Long id) {
        def phoneInstance = Phone.get(id)
        if (!phoneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phone.label', default: 'Phone'), id])
            redirect(action: "list")
            return
        }

        [phoneInstance: phoneInstance]
    }

    def update(Long id, Long version) {
        def phoneInstance = Phone.get(id)
        if (!phoneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phone.label', default: 'Phone'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (phoneInstance.version > version) {
                phoneInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'phone.label', default: 'Phone')] as Object[],
                          "Another user has updated this Phone while you were editing")
                render(view: "edit", model: [phoneInstance: phoneInstance])
                return
            }
        }

        phoneInstance.properties = params

        if (!phoneInstance.save(flush: true)) {
            render(view: "edit", model: [phoneInstance: phoneInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'phone.label', default: 'Phone'), phoneInstance.id])
        redirect(action: "show", id: phoneInstance.id)
    }

    def delete(Long id) {
        def phoneInstance = Phone.get(id)
        if (!phoneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phone.label', default: 'Phone'), id])
            redirect(action: "list")
            return
        }

        try {
            phoneInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'phone.label', default: 'Phone'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'phone.label', default: 'Phone'), id])
            redirect(action: "show", id: id)
        }
    }
}

package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class PaymentMethodController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [paymentMethodInstanceList: PaymentMethod.list(params), paymentMethodInstanceTotal: PaymentMethod.count()]
    }

    def create() {
        [paymentMethodInstance: new PaymentMethod(params)]
    }

    def save() {
        def paymentMethodInstance = new PaymentMethod(params)
        if (!paymentMethodInstance.save(flush: true)) {
            render(view: "create", model: [paymentMethodInstance: paymentMethodInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'paymentMethod.label', default: 'PaymentMethod'), paymentMethodInstance.id])
        redirect(action: "show", id: paymentMethodInstance.id)
    }

    def show(Long id) {
        def paymentMethodInstance = PaymentMethod.get(id)
        if (!paymentMethodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentMethod.label', default: 'PaymentMethod'), id])
            redirect(action: "list")
            return
        }

        [paymentMethodInstance: paymentMethodInstance]
    }

    def edit(Long id) {
        def paymentMethodInstance = PaymentMethod.get(id)
        if (!paymentMethodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentMethod.label', default: 'PaymentMethod'), id])
            redirect(action: "list")
            return
        }

        [paymentMethodInstance: paymentMethodInstance]
    }

    def update(Long id, Long version) {
        def paymentMethodInstance = PaymentMethod.get(id)
        if (!paymentMethodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentMethod.label', default: 'PaymentMethod'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (paymentMethodInstance.version > version) {
                paymentMethodInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'paymentMethod.label', default: 'PaymentMethod')] as Object[],
                          "Another user has updated this PaymentMethod while you were editing")
                render(view: "edit", model: [paymentMethodInstance: paymentMethodInstance])
                return
            }
        }

        paymentMethodInstance.properties = params

        if (!paymentMethodInstance.save(flush: true)) {
            render(view: "edit", model: [paymentMethodInstance: paymentMethodInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'paymentMethod.label', default: 'PaymentMethod'), paymentMethodInstance.id])
        redirect(action: "show", id: paymentMethodInstance.id)
    }

    def delete(Long id) {
        def paymentMethodInstance = PaymentMethod.get(id)
        if (!paymentMethodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentMethod.label', default: 'PaymentMethod'), id])
            redirect(action: "list")
            return
        }

        try {
            paymentMethodInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'paymentMethod.label', default: 'PaymentMethod'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'paymentMethod.label', default: 'PaymentMethod'), id])
            redirect(action: "show", id: id)
        }
    }
}

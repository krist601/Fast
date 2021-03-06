package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class BalanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [balanceInstanceList: Balance.list(params), balanceInstanceTotal: Balance.count()]
    }

    def create() {
        [balanceInstance: new Balance(params)]
    }

    def save() {
        def balanceInstance = new Balance(params)
        if (!balanceInstance.save(flush: true)) {
            render(view: "create", model: [balanceInstance: balanceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'balance.label', default: 'Balance'), balanceInstance.id])
        redirect(action: "show", id: balanceInstance.id)
    }

    def show(Long id) {
        def balanceInstance = Balance.get(id)
        if (!balanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'balance.label', default: 'Balance'), id])
            redirect(action: "list")
            return
        }

        [balanceInstance: balanceInstance]
    }

    def edit(Long id) {
        def balanceInstance = Balance.get(id)
        if (!balanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'balance.label', default: 'Balance'), id])
            redirect(action: "list")
            return
        }

        [balanceInstance: balanceInstance]
    }

    def update(Long id, Long version) {
        def balanceInstance = Balance.get(id)
        if (!balanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'balance.label', default: 'Balance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (balanceInstance.version > version) {
                balanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'balance.label', default: 'Balance')] as Object[],
                          "Another user has updated this Balance while you were editing")
                render(view: "edit", model: [balanceInstance: balanceInstance])
                return
            }
        }

        balanceInstance.properties = params

        if (!balanceInstance.save(flush: true)) {
            render(view: "edit", model: [balanceInstance: balanceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'balance.label', default: 'Balance'), balanceInstance.id])
        redirect(action: "show", id: balanceInstance.id)
    }

    def delete(Long id) {
        def balanceInstance = Balance.get(id)
        if (!balanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'balance.label', default: 'Balance'), id])
            redirect(action: "list")
            return
        }

        try {
            balanceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'balance.label', default: 'Balance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'balance.label', default: 'Balance'), id])
            redirect(action: "show", id: id)
        }
    }
}

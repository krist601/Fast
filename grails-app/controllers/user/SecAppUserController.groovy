package user

import org.springframework.dao.DataIntegrityViolationException

class SecAppUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [secAppUserInstanceList: SecAppUser.list(params), secAppUserInstanceTotal: SecAppUser.count()]
    }

    def create() {
        [secAppUserInstance: new SecAppUser(params)]
    }

    def save() {
        def secAppUserInstance = new SecAppUser(params)
        if (!secAppUserInstance.save(flush: true)) {
            render(view: "create", model: [secAppUserInstance: secAppUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), secAppUserInstance.id])
        redirect(action: "show", id: secAppUserInstance.id)
    }

    def show(Long id) {
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }

        [secAppUserInstance: secAppUserInstance]
    }

    def edit(Long id) {
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }

        [secAppUserInstance: secAppUserInstance]
    }

    def update(Long id, Long version) {
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secAppUserInstance.version > version) {
                secAppUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'secAppUser.label', default: 'SecAppUser')] as Object[],
                          "Another user has updated this SecAppUser while you were editing")
                render(view: "edit", model: [secAppUserInstance: secAppUserInstance])
                return
            }
        }

        secAppUserInstance.properties = params

        if (!secAppUserInstance.save(flush: true)) {
            render(view: "edit", model: [secAppUserInstance: secAppUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), secAppUserInstance.id])
        redirect(action: "show", id: secAppUserInstance.id)
    }

    def delete(Long id) {
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }

        try {
            secAppUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "show", id: id)
        }
    }
}

package user

import org.springframework.dao.DataIntegrityViolationException

class SecAppUserSecAppRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [secAppUserSecAppRoleInstanceList: SecAppUserSecAppRole.list(params), secAppUserSecAppRoleInstanceTotal: SecAppUserSecAppRole.count()]
    }

    def create() {
        [secAppUserSecAppRoleInstance: new SecAppUserSecAppRole(params)]
    }

    def save() {
        def secAppUserSecAppRoleInstance = new SecAppUserSecAppRole(params)
        if (!secAppUserSecAppRoleInstance.save(flush: true)) {
            render(view: "create", model: [secAppUserSecAppRoleInstance: secAppUserSecAppRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), secAppUserSecAppRoleInstance.id])
        redirect(action: "show", id: secAppUserSecAppRoleInstance.id)
    }

    def show(Long id) {
        def secAppUserSecAppRoleInstance = SecAppUserSecAppRole.get(id)
        if (!secAppUserSecAppRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), id])
            redirect(action: "list")
            return
        }

        [secAppUserSecAppRoleInstance: secAppUserSecAppRoleInstance]
    }

    def edit(Long id) {
        def secAppUserSecAppRoleInstance = SecAppUserSecAppRole.get(id)
        if (!secAppUserSecAppRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), id])
            redirect(action: "list")
            return
        }

        [secAppUserSecAppRoleInstance: secAppUserSecAppRoleInstance]
    }

    def update(Long id, Long version) {
        def secAppUserSecAppRoleInstance = SecAppUserSecAppRole.get(id)
        if (!secAppUserSecAppRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secAppUserSecAppRoleInstance.version > version) {
                secAppUserSecAppRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole')] as Object[],
                          "Another user has updated this SecAppUserSecAppRole while you were editing")
                render(view: "edit", model: [secAppUserSecAppRoleInstance: secAppUserSecAppRoleInstance])
                return
            }
        }

        secAppUserSecAppRoleInstance.properties = params

        if (!secAppUserSecAppRoleInstance.save(flush: true)) {
            render(view: "edit", model: [secAppUserSecAppRoleInstance: secAppUserSecAppRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), secAppUserSecAppRoleInstance.id])
        redirect(action: "show", id: secAppUserSecAppRoleInstance.id)
    }

    def delete(Long id) {
        def secAppUserSecAppRoleInstance = SecAppUserSecAppRole.get(id)
        if (!secAppUserSecAppRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), id])
            redirect(action: "list")
            return
        }

        try {
            secAppUserSecAppRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), id])
            redirect(action: "show", id: id)
        }
    }
}

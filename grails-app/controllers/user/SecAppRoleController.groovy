package user

import org.springframework.dao.DataIntegrityViolationException

class SecAppRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [secAppRoleInstanceList: SecAppRole.list(params), secAppRoleInstanceTotal: SecAppRole.count()]
    }

    def create() {
        [secAppRoleInstance: new SecAppRole(params)]
    }

    def save() {
        def secAppRoleInstance = new SecAppRole(params)
        if (!secAppRoleInstance.save(flush: true)) {
            render(view: "create", model: [secAppRoleInstance: secAppRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), secAppRoleInstance.id])
        redirect(action: "show", id: secAppRoleInstance.id)
    }

    def show(Long id) {
        def secAppRoleInstance = SecAppRole.get(id)
        if (!secAppRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), id])
            redirect(action: "list")
            return
        }

        [secAppRoleInstance: secAppRoleInstance]
    }

    def edit(Long id) {
        def secAppRoleInstance = SecAppRole.get(id)
        if (!secAppRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), id])
            redirect(action: "list")
            return
        }

        [secAppRoleInstance: secAppRoleInstance]
    }

    def update(Long id, Long version) {
        def secAppRoleInstance = SecAppRole.get(id)
        if (!secAppRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secAppRoleInstance.version > version) {
                secAppRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'secAppRole.label', default: 'SecAppRole')] as Object[],
                          "Another user has updated this SecAppRole while you were editing")
                render(view: "edit", model: [secAppRoleInstance: secAppRoleInstance])
                return
            }
        }

        secAppRoleInstance.properties = params

        if (!secAppRoleInstance.save(flush: true)) {
            render(view: "edit", model: [secAppRoleInstance: secAppRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), secAppRoleInstance.id])
        redirect(action: "show", id: secAppRoleInstance.id)
    }

    def delete(Long id) {
        def secAppRoleInstance = SecAppRole.get(id)
        if (!secAppRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), id])
            redirect(action: "list")
            return
        }

        try {
            secAppRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), id])
            redirect(action: "show", id: id)
        }
    }
}

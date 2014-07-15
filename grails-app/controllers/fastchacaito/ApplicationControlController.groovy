package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class ApplicationControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [applicationControlInstanceList: ApplicationControl.list(params), applicationControlInstanceTotal: ApplicationControl.count()]
    }

    def create() {
        [applicationControlInstance: new ApplicationControl(params)]
    }

    def save() {
        def applicationControlInstance = new ApplicationControl(params)
        if (!applicationControlInstance.save(flush: true)) {
            render(view: "create", model: [applicationControlInstance: applicationControlInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), applicationControlInstance.id])
        redirect(action: "show", id: applicationControlInstance.id)
    }

    def show(Long id) {
        def applicationControlInstance = ApplicationControl.get(id)
        if (!applicationControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), id])
            redirect(action: "list")
            return
        }

        [applicationControlInstance: applicationControlInstance]
    }

    def edit(Long id) {
        def applicationControlInstance = ApplicationControl.get(id)
        if (!applicationControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), id])
            redirect(action: "list")
            return
        }

        [applicationControlInstance: applicationControlInstance]
    }

    def update(Long id, Long version) {
        def applicationControlInstance = ApplicationControl.get(id)
        if (!applicationControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (applicationControlInstance.version > version) {
                applicationControlInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'applicationControl.label', default: 'ApplicationControl')] as Object[],
                          "Another user has updated this ApplicationControl while you were editing")
                render(view: "edit", model: [applicationControlInstance: applicationControlInstance])
                return
            }
        }

        applicationControlInstance.properties = params

        if (!applicationControlInstance.save(flush: true)) {
            render(view: "edit", model: [applicationControlInstance: applicationControlInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), applicationControlInstance.id])
        redirect(action: "show", id: applicationControlInstance.id)
    }

    def delete(Long id) {
        def applicationControlInstance = ApplicationControl.get(id)
        if (!applicationControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), id])
            redirect(action: "list")
            return
        }

        try {
            applicationControlInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), id])
            redirect(action: "show", id: id)
        }
    }
}

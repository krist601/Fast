package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class MeasuresControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [measuresControlInstanceList: MeasuresControl.list(params), measuresControlInstanceTotal: MeasuresControl.count()]
    }

    def create() {
        [measuresControlInstance: new MeasuresControl(params)]
    }

    def save() {
        def measuresControlInstance = new MeasuresControl(params)
        if (!measuresControlInstance.save(flush: true)) {
            render(view: "create", model: [measuresControlInstance: measuresControlInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'measuresControl.label', default: 'MeasuresControl'), measuresControlInstance.id])
        redirect(action: "show", id: measuresControlInstance.id)
    }

    def show(Long id) {
        def measuresControlInstance = MeasuresControl.get(id)
        if (!measuresControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'measuresControl.label', default: 'MeasuresControl'), id])
            redirect(action: "list")
            return
        }

        [measuresControlInstance: measuresControlInstance]
    }

    def edit(Long id) {
        def measuresControlInstance = MeasuresControl.get(id)
        if (!measuresControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'measuresControl.label', default: 'MeasuresControl'), id])
            redirect(action: "list")
            return
        }

        [measuresControlInstance: measuresControlInstance]
    }

    def update(Long id, Long version) {
        def measuresControlInstance = MeasuresControl.get(id)
        if (!measuresControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'measuresControl.label', default: 'MeasuresControl'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (measuresControlInstance.version > version) {
                measuresControlInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'measuresControl.label', default: 'MeasuresControl')] as Object[],
                          "Another user has updated this MeasuresControl while you were editing")
                render(view: "edit", model: [measuresControlInstance: measuresControlInstance])
                return
            }
        }

        measuresControlInstance.properties = params

        if (!measuresControlInstance.save(flush: true)) {
            render(view: "edit", model: [measuresControlInstance: measuresControlInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'measuresControl.label', default: 'MeasuresControl'), measuresControlInstance.id])
        redirect(action: "show", id: measuresControlInstance.id)
    }

    def delete(Long id) {
        def measuresControlInstance = MeasuresControl.get(id)
        if (!measuresControlInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'measuresControl.label', default: 'MeasuresControl'), id])
            redirect(action: "list")
            return
        }

        try {
            measuresControlInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'measuresControl.label', default: 'MeasuresControl'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'measuresControl.label', default: 'MeasuresControl'), id])
            redirect(action: "show", id: id)
        }
    }
}

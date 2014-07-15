package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class BloodSampleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bloodSampleInstanceList: BloodSample.list(params), bloodSampleInstanceTotal: BloodSample.count()]
    }

    def create() {
        [bloodSampleInstance: new BloodSample(params)]
    }

    def save() {
        def bloodSampleInstance = new BloodSample(params)
        if (!bloodSampleInstance.save(flush: true)) {
            render(view: "create", model: [bloodSampleInstance: bloodSampleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), bloodSampleInstance.id])
        redirect(action: "show", id: bloodSampleInstance.id)
    }

    def show(Long id) {
        def bloodSampleInstance = BloodSample.get(id)
        if (!bloodSampleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), id])
            redirect(action: "list")
            return
        }

        [bloodSampleInstance: bloodSampleInstance]
    }

    def edit(Long id) {
        def bloodSampleInstance = BloodSample.get(id)
        if (!bloodSampleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), id])
            redirect(action: "list")
            return
        }

        [bloodSampleInstance: bloodSampleInstance]
    }

    def update(Long id, Long version) {
        def bloodSampleInstance = BloodSample.get(id)
        if (!bloodSampleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bloodSampleInstance.version > version) {
                bloodSampleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bloodSample.label', default: 'BloodSample')] as Object[],
                          "Another user has updated this BloodSample while you were editing")
                render(view: "edit", model: [bloodSampleInstance: bloodSampleInstance])
                return
            }
        }

        bloodSampleInstance.properties = params

        if (!bloodSampleInstance.save(flush: true)) {
            render(view: "edit", model: [bloodSampleInstance: bloodSampleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), bloodSampleInstance.id])
        redirect(action: "show", id: bloodSampleInstance.id)
    }

    def delete(Long id) {
        def bloodSampleInstance = BloodSample.get(id)
        if (!bloodSampleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), id])
            redirect(action: "list")
            return
        }

        try {
            bloodSampleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), id])
            redirect(action: "show", id: id)
        }
    }
}

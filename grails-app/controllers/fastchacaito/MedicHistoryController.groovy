package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class MedicHistoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [medicHistoryInstanceList: MedicHistory.list(params), medicHistoryInstanceTotal: MedicHistory.count()]
    }

    def create() {
        params.patient=Patient.get(params.foo)
        [medicHistoryInstance: new MedicHistory(params)]
    }

    def save() {
        params.date=new Date()
        def medicHistoryInstance = new MedicHistory(params)
        if (!medicHistoryInstance.save(flush: true)) {
            render(view: "create", model: [medicHistoryInstance: medicHistoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'medicHistory.label', default: 'MedicHistory'), medicHistoryInstance.id])
        redirect(controller: "patient", action: "show", id: medicHistoryInstance.patient.id)
    }

    def show(Long id) {
        def medicHistoryInstance = MedicHistory.get(id)
        if (!medicHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicHistory.label', default: 'MedicHistory'), id])
            redirect(action: "list")
            return
        }

        [medicHistoryInstance: medicHistoryInstance]
    }

    def edit(Long id) {
        def medicHistoryInstance = MedicHistory.get(id)
        if (!medicHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicHistory.label', default: 'MedicHistory'), id])
            redirect(action: "list")
            return
        }

        [medicHistoryInstance: medicHistoryInstance]
    }

    def update(Long id, Long version) {
        def medicHistoryInstance = MedicHistory.get(id)
        if (!medicHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicHistory.label', default: 'MedicHistory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (medicHistoryInstance.version > version) {
                medicHistoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'medicHistory.label', default: 'MedicHistory')] as Object[],
                          "Another user has updated this MedicHistory while you were editing")
                render(view: "edit", model: [medicHistoryInstance: medicHistoryInstance])
                return
            }
        }

        medicHistoryInstance.properties = params

        if (!medicHistoryInstance.save(flush: true)) {
            render(view: "edit", model: [medicHistoryInstance: medicHistoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'medicHistory.label', default: 'MedicHistory'), medicHistoryInstance.id])
        redirect(action: "show", id: medicHistoryInstance.id)
    }

    def delete(Long id) {
        def medicHistoryInstance = MedicHistory.get(id)
        if (!medicHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicHistory.label', default: 'MedicHistory'), id])
            redirect(action: "list")
            return
        }

        try {
            medicHistoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'medicHistory.label', default: 'MedicHistory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'medicHistory.label', default: 'MedicHistory'), id])
            redirect(action: "show", id: id)
        }
    }
}

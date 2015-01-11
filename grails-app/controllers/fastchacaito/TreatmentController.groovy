package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class TreatmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [treatmentInstanceList: Treatment.list(params), treatmentInstanceTotal: Treatment.count()]
    }

    def createBalance() {
        params.patient=Patient.get(params.foo)
        [treatmentInstance: new Treatment(params)]
    }

    def saveBalance() {
        params.date=new Date()
        println "los parametros son: "+params
        def pack=Package.get(params.packages.id)
        params.type=pack.packageType
        def params2=params.clone()
        params.remove('idealWeight')
        params.remove('type')
        params.totalPrice=pack.price
        def treatmentInstance = new Treatment(params)
        if (!treatmentInstance.save(flush: true)) {
            render(view: "createBalance", model: [treatmentInstance: treatmentInstance])
            return
        }
        treatmentInstance.addToBalance([idealWeight:params2.idealWeight,type:params2.type,applicationAmount:pack.sesionAmount]);
        flash.message = message(code: 'default.created.message', args: [message(code: 'treatment.label', default: 'Treatment'), treatmentInstance.id])
        redirect(controller: "patient", action: "show", id: treatmentInstance.patient.id)
    }

    def createBodyTherapy() {
        params.patient=Patient.get(params.foo)
        [treatmentInstance: new Treatment(params)]
    }

    def saveBodyTherapy() {
        params.date=new Date()
        def treatmentInstance = new Treatment(params)
        if (!treatmentInstance.save(flush: true)) {
            render(view: "createBodyTherapy", model: [treatmentInstance: treatmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'treatment.label', default: 'Treatment'), treatmentInstance.id])
        redirect(controller: "patient", action: "show", id: treatmentInstance.patient.id)
    }

    def createMachine() {
        params.patient=Patient.get(params.foo)
        [treatmentInstance: new Treatment(params)]
    }

    def saveMachine() {
        params.date=new Date()
        def treatmentInstance = new Treatment(params)
        if (!treatmentInstance.save(flush: true)) {
            render(view: "createMachine", model: [treatmentInstance: treatmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'treatment.label', default: 'Treatment'), treatmentInstance.id])
        redirect(controller: "patient", action: "show", id: treatmentInstance.patient.id)
    }

    def createMesotherapy() {
        params.patient=Patient.get(params.foo)
        [treatmentInstance: new Treatment(params)]
    }

    def saveMesotherapy() {
        params.date=new Date()
        println "los parametros son: "+params
        def pack=Package.get(params.packages.id)
        params.type=pack.packageType
        def params2=params.clone()
        params.remove('method')
        params.remove('ploblemCauses')
        params.remove('previousAttempts')
        params.remove('treatAreas')
        params.totalPrice=pack.price
        def treatmentInstance = new Treatment(params)
        if (!treatmentInstance.save(flush: true)) {
            render(view: "createMesotherapy", model: [treatmentInstance: treatmentInstance])
            return
        }
        treatmentInstance.addToMesotherapy([ploblemCauses:params2.ploblemCauses,method:params2.method,previousAttempts:params2.previousAttempts,treatAreas:params2.treatAreas]);
        flash.message = message(code: 'default.created.message', args: [message(code: 'treatment.label', default: 'Treatment'), treatmentInstance.id])
        redirect(controller: "patient", action: "show", id: treatmentInstance.patient.id)
    }

    def create() {
        params.patient=Patient.get(params.foo)
        [treatmentInstance: new Treatment(params)]
    }

    def save() {
        params.date=new Date()
        def treatmentInstance = new Treatment(params)
        if (!treatmentInstance.save(flush: true)) {
            render(view: "create", model: [treatmentInstance: treatmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'treatment.label', default: 'Treatment'), treatmentInstance.id])
        redirect(controller: "patient", action: "show", id: treatmentInstance.patient.id)
    }

    def show(Long id) {
        def treatmentInstance = Treatment.get(id)
        if (!treatmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'treatment.label', default: 'Treatment'), id])
            redirect(action: "list")
            return
        }

        [treatmentInstance: treatmentInstance]
    }

    def edit(Long id) {
        def treatmentInstance = Treatment.get(id)
        if (!treatmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'treatment.label', default: 'Treatment'), id])
            redirect(action: "list")
            return
        }

        [treatmentInstance: treatmentInstance]
    }

    def update(Long id, Long version) {
        def treatmentInstance = Treatment.get(id)
        if (!treatmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'treatment.label', default: 'Treatment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (treatmentInstance.version > version) {
                treatmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'treatment.label', default: 'Treatment')] as Object[],
                          "Another user has updated this Treatment while you were editing")
                render(view: "edit", model: [treatmentInstance: treatmentInstance])
                return
            }
        }

        treatmentInstance.properties = params

        if (!treatmentInstance.save(flush: true)) {
            render(view: "edit", model: [treatmentInstance: treatmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'treatment.label', default: 'Treatment'), treatmentInstance.id])
        redirect(action: "show", id: treatmentInstance.id)
    }

    def delete(Long id) {
        def treatmentInstance = Treatment.get(id)
        if (!treatmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'treatment.label', default: 'Treatment'), id])
            redirect(action: "list")
            return
        }

        try {
            treatmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'treatment.label', default: 'Treatment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'treatment.label', default: 'Treatment'), id])
            redirect(action: "show", id: id)
        }
    }
}

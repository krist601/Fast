package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class ApplicationControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [applicationControlInstanceList: ApplicationControl.list(params), applicationControlInstanceTotal: ApplicationControl.count()]
    }

    def create() {
        params.balance=Balance.get(params.foo)
        [applicationControlInstance: new ApplicationControl(params)]
    }

    def save() {
        params.date=new Date()
        def row =ApplicationControl.executeQuery("SELECT MAX(ap.identifierNumber)+1 FROM ApplicationControl as ap WHERE ap.balance="+params.balance.id)
        if (row[0])
            params.identifierNumber=row[0]
        else
            params.identifierNumber="1"
            
        println "identifier number: "+ row[0]
        if (!params.identifierNumber.equals("1")){
            def row2;
            def aux=0;
            row = ApplicationControl.executeQuery("SELECT MAX(ap.id) FROM ApplicationControl as ap, Balance as b WHERE ap.balance=b.id AND b.id="+params.balance.id)
            if(row[0]){
                row2 = ApplicationControl.executeQuery("SELECT currentWeight FROM ApplicationControl as ap WHERE ap.id="+row[0])
                if(row2[0])
                    aux=row2[0]
            }
            String lastWeight=aux
            println "last weight: "+lastWeight
            lastWeight=lastWeight.replaceAll(",", ".")
            def lastWeightFloat=Float.parseFloat(lastWeight)

            String currentWeight=params.currentWeight
            currentWeight=currentWeight.replaceAll(",", ".")
            def currentWeightFloat=Float.parseFloat(currentWeight)

            params.differenceWeight=lastWeightFloat - currentWeightFloat

            aux=0;
            row = ApplicationControl.executeQuery("SELECT MAX(ap.id) FROM ApplicationControl as ap, Balance as b WHERE ap.balance=b.id AND b.id="+params.balance.id)
            if(row[0]){
                row2 = ApplicationControl.executeQuery("SELECT reachedWeight FROM ApplicationControl as ap WHERE ap.id="+row[0])
                if(row2[0])
                    aux=row2[0]
            }
            String lastReachedWeight=aux
            println "last reached weight: "+lastWeight
            lastReachedWeight=lastReachedWeight.replaceAll(",", ".")
            def lastReachedWeightFloat=Float.parseFloat(lastReachedWeight)

            String differenceWeight=params.differenceWeight
            differenceWeight=differenceWeight.replaceAll(",", ".")
            def differenceWeightFloat=Float.parseFloat(differenceWeight)

            params.reachedWeight=lastReachedWeightFloat + differenceWeightFloat
        }
        else{
            params.differenceWeight=0
            params.reachedWeight=0
        }
        def applicationControlInstance = new ApplicationControl(params)
        if (!applicationControlInstance.save(flush: true)) {
            render(view: "create", model: [applicationControlInstance: applicationControlInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), applicationControlInstance.id])
        def balance= Balance.get(params.balance.id)
        println "el tratamiento es numero: "+balance.treatment.patient.id
        redirect(controller: "patient", action: "show", id: balance.treatment.patient.id)
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

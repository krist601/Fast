package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class MeasuresControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [measuresControlInstanceList: MeasuresControl.list(params), measuresControlInstanceTotal: MeasuresControl.count()]
    }

    def create() {
        
        def type = params.type
        
        if (type == '1')
        {
            params.balance=Balance.get(params.foo)  
        }
        else if (type == '2')
        {
            params.mesotherapy=Mesotherapy.get(params.foo)
        }
        [measuresControlInstance: new MeasuresControl(params)]
    }

    def save() {
        def user = springSecurityService.currentUser
        params.secAppUser=user
        params.date=new Date()
        def pacient 
        println params
        println "balance"+params.balance.id 
        println "mesotherapy"+params.mesotherapy.id 
        if (params.balance.id != '')
        {
            def balanc =Balance.get(params.balance.id)
            pacient =  balanc.treatment.patient
        }  
        else if   (params.mesotherapy.id != '')
        {
            def meso =Mesotherapy.get(params.mesotherapy.id)
            pacient =  meso.treatment.patient
        }
        println " paciente"+pacient
        println " medidas paciente" + pacient.getMeasuresControl(pacient.id)
        def medidas =  pacient.getMeasuresControl(pacient.id)
        def identifier
        def medidas_id = new ArrayList()
        
        if (medidas){
            medidas.each(){
                m -> medidas_id.add(m.id)
            }
            identifier= MeasuresControl.executeQuery("select max(identifierNumber)+1 from MeasuresControl where id IN ("
                +medidas_id.join(",")+")") [0]
        }
        else identifier = 1
       
        params.identifierNumber = identifier
        def measuresControlInstance = new MeasuresControl(params)
        if (!measuresControlInstance.save(flush: true)) {
            render(view: "create", model: [measuresControlInstance: measuresControlInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'measuresControl.label', default: 'MeasuresControl'), measuresControlInstance.id])
        redirect(controller: "Patient",action: "show", id: pacient.id)
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

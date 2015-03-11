package fastchacaito

import org.springframework.dao.DataIntegrityViolationException

class GelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [gelInstanceList: Gel.findAllByShippedDate(null), gelInstanceTotal: Gel.count()]
    }

    def create() {
        [gelInstance: new Gel(params)]
    }

    def save() {
        def amount= params.amount
        if(!amount.equals(""))
            for(def i=1;i<Integer.parseInt(amount)+1;i++){
                def gelInstance = new Gel()
                def user = springSecurityService.currentUser
                
                Date now = new Date()
                Integer month = now.month
                gelInstance.receivedDate= new Date()
                gelInstance.identifier=month+"-"+i
                gelInstance.secAppUser=user
                if (!gelInstance.save(flush: true)) {
                }
            }

        flash.message = "SE HAN SALVADO LOS GELES CON EXITO"
        redirect(action: "list")
    }

    def show(Long id) {
        def gelInstance = Gel.get(id)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }

        [gelInstance: gelInstance]
    }

    def edit(Long id) {
        def gelInstance = Gel.get(id)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }

        [gelInstance: gelInstance]
    }

    def update(Long id, Long version) {
        def gelInstance = Gel.get(id)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gelInstance.version > version) {
                gelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gel.label', default: 'Gel')] as Object[],
                          "Another user has updated this Gel while you were editing")
                render(view: "edit", model: [gelInstance: gelInstance])
                return
            }
        }

        gelInstance.properties = params

        if (!gelInstance.save(flush: true)) {
            render(view: "edit", model: [gelInstance: gelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gel.label', default: 'Gel'), gelInstance.id])
        redirect(action: "show", id: gelInstance.id)
    }

    def delete(Long id) {
        def gelInstance = Gel.get(id)
        print(gelInstance)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }

        try {
            gelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "show", id: id)
        }
    }
    def changeStatus(Long id){
        def gelInstance = Gel.get(id)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }
        def user = springSecurityService.currentUser
        gelInstance.secAppUser=user
        gelInstance.shippedDate=new Date()
        gelInstance.save(flush: true)
        flash.message = "El Gel se ha marcado como vendido"
        redirect(controller:"gel", action: "list")
    }
    def deleteGel(Long id){
        def gelInstance = Gel.get(id)
        if (!gelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
            return
        }
        try {
            gelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gel.label', default: 'Gel'), id])
            redirect(action: "show", id: id)
        }
    }
    
     def listShipped(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [gelInstanceList: Gel.findAllByShippedDateIsNotNull(), gelInstanceTotal: Gel.count()]
    }
}

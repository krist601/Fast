package fastchacaito

import org.springframework.dao.DataIntegrityViolationException
import java.text.SimpleDateFormat

class BloodSampleController {

    static SimpleDateFormat theDate = new SimpleDateFormat( 'MM/dd/yyyy' ) //H:m:s
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [bloodSampleInstanceList: BloodSample.findAll("from BloodSample as b where b.shippingDate=null and b.receivedDate = null"), bloodSampleInstanceTotal: BloodSample.count()]
    }

    def listShippingDate(Integer max) {
                println "hola xxx"
        params.max = Math.min(max ?: 10000, 100000)
        [bloodSampleInstanceList: BloodSample.findAll("from BloodSample as b where b.shippingDate!=null and b.receivedDate = null"), bloodSampleInstanceTotal: BloodSample.count()]
    }

    def create() {
        params.patient=Patient.get(params.foo)
        [bloodSampleInstance: new BloodSample(params)]
    }

    def save() {
        params.receiptData = theDate.parse(params.receiptData)
        def bloodSampleInstance = new BloodSample(params)
        if (!bloodSampleInstance.save(flush: true)) {
            render(view: "create", model: [bloodSampleInstance: bloodSampleInstance])
            return
        }
      
        flash.message = message(code: 'default.created.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), bloodSampleInstance.id])
        redirect(controller:"patient" ,action: "show", id: params.patient.id)
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

    def changeStatusShipped(Long id) {
        def bloodSampleInstance = BloodSample.get(id)
        if (!bloodSampleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), id])
            redirect(action: "list")
            return
        }
        bloodSampleInstance.shippingDate = new Date()
        bloodSampleInstance.save(flush:true)
        redirect(action: "listShippingDate")
            return
    }
    
    def changeStatusReceived(Long id) {
        def bloodSampleInstance = BloodSample.get(id)
        if (!bloodSampleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bloodSample.label', default: 'BloodSample'), id])
            redirect(action: "list")
            return
        }
        bloodSampleInstance.receivedDate = new Date()
        bloodSampleInstance.save(flush:true)
        redirect(controller:"patient", action: "show", id:bloodSampleInstance.patient.id)
            
    }
}

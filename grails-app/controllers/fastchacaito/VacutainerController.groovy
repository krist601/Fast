package fastchacaito

import org.springframework.dao.DataIntegrityViolationException
import java.text.SimpleDateFormat

class VacutainerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    static SimpleDateFormat theDate = new SimpleDateFormat( 'MM/dd/yyyy' )

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [vacutainerInstanceList: Vacutainer.list(params), vacutainerInstanceTotal: Vacutainer.count()]
    }

    def create() {
        [vacutainerInstance: new Vacutainer(params)]
    }

    def save() {
        params.identifier=params.identifier+params.unidad+"-"+params.mes
        params.arrivalDate = theDate.parse(params.arrivalDate)
        def amount= params.vacutainerAmount
        params.remove('vacutainerAmount')
        def vacutainerInstance = new Vacutainer(params)
        if (!vacutainerInstance.save(flush: true)) {
            render(view: "create", model: [vacutainerInstance: vacutainerInstance])  
            return
        }
        if(!amount.equals(""))
        for(def i=0;i<Integer.parseInt(amount);i++){
            def ident=params.identifier+"-"+(i+1)
            vacutainerInstance.addToApplication([identifier:ident, applicationType:params.vacutainerType, arrivalDate:params.arrivalDate]);
            
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), vacutainerInstance.id])
        redirect(action: "show", id: vacutainerInstance.id)
    }

    def show(Long id) {
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        [vacutainerInstance: vacutainerInstance]
    }

    def edit(Long id) {
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        [vacutainerInstance: vacutainerInstance]
    }

    def update(Long id, Long version) {
        params.arrivalDate = theDate.parse(params.arrivalDate)
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (vacutainerInstance.version > version) {
                vacutainerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vacutainer.label', default: 'Vacutainer')] as Object[],
                          "Another user has updated this Vacutainer while you were editing")
                render(view: "edit", model: [vacutainerInstance: vacutainerInstance])
                return
            }
        }

        vacutainerInstance.properties = params

        if (!vacutainerInstance.save(flush: true)) {
            render(view: "edit", model: [vacutainerInstance: vacutainerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), vacutainerInstance.id])
        redirect(action: "show", id: vacutainerInstance.id)
    }

    def delete(Long id) {
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        try {
            vacutainerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def editLostDate(Long id) {
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        [vacutainerInstance: vacutainerInstance]
    }

    def updateLostDate(Long id, Long version) {
        params.lostDate = theDate.parse(params.lostDate)
        def vacutainerInstance = Vacutainer.get(id)
        if (!vacutainerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (vacutainerInstance.version > version) {
                vacutainerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vacutainer.label', default: 'Vacutainer')] as Object[],
                          "Another user has updated this Vacutainer while you were editing")
                render(view: "editLostDate", model: [vacutainerInstance: vacutainerInstance])
                return
            }
        }

        vacutainerInstance.properties = params

        if (!vacutainerInstance.save(flush: true)) {
            render(view: "editLostDate", model: [vacutainerInstance: vacutainerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'vacutainer.label', default: 'Vacutainer'), vacutainerInstance.id])
        redirect(action: "show", id: vacutainerInstance.id)
    }
    
}

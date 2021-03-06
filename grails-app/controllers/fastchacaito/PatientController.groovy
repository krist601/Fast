package fastchacaito

import org.springframework.dao.DataIntegrityViolationException
import java.text.SimpleDateFormat
import org.compass.core.engine.SearchEngineQueryParseException

class PatientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    static SimpleDateFormat theDate = new SimpleDateFormat( 'MM/dd/yyyy' ) //H:m:s
    def searchableService
    static String WILDCARD = "*"
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [patientInstanceList: Patient.list(params), patientInstanceTotal: Patient.count()]
    }

    def create() {
        [patientInstance: new Patient(params)]
    }

    def save() {
        //println "adminisiondate:"+params.bornDate
//        print params.height
//        params.height=params.height.replaceAll(".", ",")
//        print params.height
//        params.initialWeight=params.initialWeight.replaceAll(".", ",")
//        params.height=Float.parseFloat(params.height)
        params.initialWeight=Float.parseFloat(params.initialWeight)
        params.bornDate = theDate.parse(params.bornDate)
        params.admisionDate = new Date()
        def patientInstance = new Patient(params)
        if (!patientInstance.save(flush: true)) {
            render(view: "create", model: [patientInstance: patientInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'patient.label', default: 'Patient'), patientInstance.id])
        redirect(action: "show", id: patientInstance.id)
    }

    def show(Long id) {
        def patientInstance = Patient.get(id)
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        [patientInstance: patientInstance]
    }

    def edit(Long id) {
        def patientInstance = Patient.get(id)
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        [patientInstance: patientInstance]
    }

    def update(Long id, Long version) {
        params.height=params.height.replaceAll(",", ".")
        params.initialWeight=params.initialWeight.replaceAll(",", ".")
        params.height=Float.parseFloat(params.height)
        params.initialWeight=Float.parseFloat(params.initialWeight)
        params.bornDate = theDate.parse(params.bornDate)
        def patientInstance = Patient.get(id)
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (patientInstance.version > version) {
                patientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'patient.label', default: 'Patient')] as Object[],
                          "Another user has updated this Patient while you were editing")
                render(view: "edit", model: [patientInstance: patientInstance])
                return
            }
        }

        patientInstance.properties = params

        if (!patientInstance.save(flush: true)) {
            render(view: "edit", model: [patientInstance: patientInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'patient.label', default: 'Patient'), patientInstance.id])
        redirect(action: "show", id: patientInstance.id)
    }

    def delete(Long id) {
        def patientInstance = Patient.get(id)
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        try {
            patientInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "show", id: id)
        }
    }
    
      def search = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            String searchTerm = WILDCARD+ params.q + WILDCARD
          
            return [searchResult: searchableService.search(searchTerm, params)] //searchTerm, params
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }
    
      def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }
}

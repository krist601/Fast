package fastchacaito

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException
import java.text.SimpleDateFormat

class AppointmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    static SimpleDateFormat theDate = new SimpleDateFormat( 'MM/dd/yyyy' ) //H:m:s
    static SimpleDateFormat theTime = new SimpleDateFormat( 'hh:mm aa' ) //H:m:s
    static SimpleDateFormat theDate1 = new SimpleDateFormat( 'MM/dd/yyyy H:m:s' )
    static SimpleDateFormat x = new SimpleDateFormat( 'dd/MM/yyyy' )
    def springSecurityService
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [appointmentInstanceList: Appointment.list(params), appointmentInstanceTotal: Appointment.count()]
    }

    def create() {
        def patientInstance = Patient.get(params.foo)
        [appointmentInstance: new Appointment(params),patientInstance:patientInstance]
    }

    def save() {
        
        
        def user = springSecurityService.currentUser
      
        params.date=theDate.parse(params.date) 
       
        params.time=theTime.parse(params.time)
  
        params.date.set(hourOfDay: params.time.getHours(), minute: params.time.getMinutes(), second: 0)
        params.attended = null
        params.user=user
        def appointmentInstance = new Appointment(params)
        if (!appointmentInstance.save(flush: true)) {
            render(view: "create", model: [appointmentInstance: appointmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'appointment.label', default: 'Appointment'), appointmentInstance.id])
        redirect(controller:"patient",action: "show", id: appointmentInstance.treatment.patient.id)
    }

    def show(Long id) {
        def appointmentInstance = Appointment.get(id)
        if (!appointmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), id])
            redirect(action: "list")
            return
        }

        [appointmentInstance: appointmentInstance]
    }

    def edit(Long id) {
        def appointmentInstance = Appointment.get(id)
        if (!appointmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), id])
            redirect(action: "list")
            return
        }

        [appointmentInstance: appointmentInstance]
    }

    def update(Long id, Long version) {
        def appointmentInstance = Appointment.get(id)
        if (!appointmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (appointmentInstance.version > version) {
                appointmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'appointment.label', default: 'Appointment')] as Object[],
                          "Another user has updated this Appointment while you were editing")
                render(view: "edit", model: [appointmentInstance: appointmentInstance])
                return
            }
        }

        appointmentInstance.properties = params

        if (!appointmentInstance.save(flush: true)) {
            render(view: "edit", model: [appointmentInstance: appointmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'appointment.label', default: 'Appointment'), appointmentInstance.id])
        redirect(action: "show", id: appointmentInstance.id)
    }

    def delete(Long id) {
        def appointmentInstance = Appointment.get(id)
        if (!appointmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), id])
            redirect(action: "list")
            return
        }

        try {
            appointmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'appointment.label', default: 'Appointment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'appointment.label', default: 'Appointment'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def changeAttendedStatus(Long id)
    {
        println id
        def appointmentInstance = Appointment.get(id)
        println appointmentInstance 
        if (!appointmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), id])
            redirect(action: "list")
            return
        }
        
        def status = params.foo
        if (status == '1')
        status = true
        else if (status == '2')
        status = false
        
        appointmentInstance.attended = status
        appointmentInstance.save(flush:true)
         
         redirect(controller:"patient", action: "show", id:appointmentInstance.treatment.patient.id)
    }
    
    def events()
    {
       render Appointment.list().collect {
            [
                title: it.treatment.patient.firstName + " "+it.treatment.patient.lastName+ " "+it.treatment,
                start: it.date,
                end: it.date,
                allDay:false
            ]
        } as JSON
     
    }
}

package fastchacaito

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException
import java.text.SimpleDateFormat

class AppointmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    static SimpleDateFormat theDate = new SimpleDateFormat( 'MM/dd/yyyy' ) //H:m:s
    static SimpleDateFormat theTime = new SimpleDateFormat( 'HH:mm aa' ) //H:m:s
    static SimpleDateFormat theDate1 = new SimpleDateFormat( 'MM/dd/yyyy H:m:s aa' )
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
       
        params.startTime=theTime.parse(params.startTime)
        params.endTime=theTime.parse(params.endTime)

        println params.endTime
        println params.startTime
      //  params.startTime = params.date.set(hourOfDay: params.startTime.getHours(), minute: params.startTime.getMinutes(), second: 0)
      //  params.endTime = params.date.set(hourOfDay: params.endTime.getHours(), minute: params.endTime.getMinutes(), second: 0)
        params.date.set(hourOfDay: params.startTime.getHours(), minute: params.startTime.getMinutes(), second: 0)
        params.attended = null
        params.user=user
        println params.endTime
        println params.startTime
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
        def patientInstance = Patient.get(params.foo)
        def appointmentInstance = Appointment.get(id)
        if (!appointmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), id])
            redirect(action: "list")
            return
        }

        [appointmentInstance: appointmentInstance,patientInstance: patientInstance]
    }

    def update(Long id, Long version) {
          def user = springSecurityService.currentUser
      
        params.date=theDate.parse(params.date) 
       
        params.startTime=theTime.parse(params.startTime)
        params.endTime=theTime.parse(params.endTime)

        println params.endTime
        println params.startTime
      //  params.startTime = params.date.set(hourOfDay: params.startTime.getHours(), minute: params.startTime.getMinutes(), second: 0)
      //  params.endTime = params.date.set(hourOfDay: params.endTime.getHours(), minute: params.endTime.getMinutes(), second: 0)
        params.date.set(hourOfDay: params.startTime.getHours(), minute: params.startTime.getMinutes(), second: 0)
        params.attended = null
        params.user=user
        println params.endTime
        println params.startTime
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
        redirect(controller:"patient", action: "show", id: appointmentInstance.treatment.patient.id)
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
            redirect(controller:"patient", action: "show", id: appointmentInstance.treatment.patient.id)
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
                end: it.date.set(hourOfDay: it.endTime.getHours(), minute: it.endTime.getMinutes(), second: 0),
                allDay:false
            ]
        } as JSON
     
    }
}

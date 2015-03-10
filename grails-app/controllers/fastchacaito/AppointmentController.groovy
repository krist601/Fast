package fastchacaito

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class AppointmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10000, 100000)
        [appointmentInstanceList: Appointment.list(params), appointmentInstanceTotal: Appointment.count()]
    }

    def create() {
        [appointmentInstance: new Appointment(params)]
    }

    def save() {
        def appointmentInstance = new Appointment(params)
        if (!appointmentInstance.save(flush: true)) {
            render(view: "create", model: [appointmentInstance: appointmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'appointment.label', default: 'Appointment'), appointmentInstance.id])
        redirect(action: "show", id: appointmentInstance.id)
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
    
    def events()
    {
        // response.setContentType("application/json")
//        HashMap jsonMap = new HashMap()
//        List<Appointment> citas = Appointment.list()
//
// 
//        jsonMap.citas = citas.collect {cita ->
//            return [id: cita.id, endDate: cita.endDate, beginDate: cita.beginDate]
//        }

        
        println "vino json"
        render Appointment.list().collect {
            [
                title: it.patient.firstName + " "+it.patient.lastName,
                start: it.beginDate,
                end: it.endDate,
                allDay:false
            ]
        } as JSON
       // render '[{"title":"Board Meeting","start":"Fri, 20 Aug 2015 14:00:00 CDT","end":"Fri, 20 Aug 2015 14:00:00 CDT","allDay":false}]'
    }
}

package fastchacaito

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
}

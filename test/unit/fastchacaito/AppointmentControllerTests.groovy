package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(AppointmentController)
@Mock(Appointment)
class AppointmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/appointment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.appointmentInstanceList.size() == 0
        assert model.appointmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.appointmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.appointmentInstance != null
        assert view == '/appointment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/appointment/show/1'
        assert controller.flash.message != null
        assert Appointment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/appointment/list'

        populateValidParams(params)
        def appointment = new Appointment(params)

        assert appointment.save() != null

        params.id = appointment.id

        def model = controller.show()

        assert model.appointmentInstance == appointment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/appointment/list'

        populateValidParams(params)
        def appointment = new Appointment(params)

        assert appointment.save() != null

        params.id = appointment.id

        def model = controller.edit()

        assert model.appointmentInstance == appointment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/appointment/list'

        response.reset()

        populateValidParams(params)
        def appointment = new Appointment(params)

        assert appointment.save() != null

        // test invalid parameters in update
        params.id = appointment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/appointment/edit"
        assert model.appointmentInstance != null

        appointment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/appointment/show/$appointment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        appointment.clearErrors()

        populateValidParams(params)
        params.id = appointment.id
        params.version = -1
        controller.update()

        assert view == "/appointment/edit"
        assert model.appointmentInstance != null
        assert model.appointmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/appointment/list'

        response.reset()

        populateValidParams(params)
        def appointment = new Appointment(params)

        assert appointment.save() != null
        assert Appointment.count() == 1

        params.id = appointment.id

        controller.delete()

        assert Appointment.count() == 0
        assert Appointment.get(appointment.id) == null
        assert response.redirectedUrl == '/appointment/list'
    }
}

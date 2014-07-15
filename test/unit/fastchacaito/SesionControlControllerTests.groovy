package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(SesionControlController)
@Mock(SesionControl)
class SesionControlControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sesionControl/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sesionControlInstanceList.size() == 0
        assert model.sesionControlInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.sesionControlInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sesionControlInstance != null
        assert view == '/sesionControl/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sesionControl/show/1'
        assert controller.flash.message != null
        assert SesionControl.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sesionControl/list'

        populateValidParams(params)
        def sesionControl = new SesionControl(params)

        assert sesionControl.save() != null

        params.id = sesionControl.id

        def model = controller.show()

        assert model.sesionControlInstance == sesionControl
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sesionControl/list'

        populateValidParams(params)
        def sesionControl = new SesionControl(params)

        assert sesionControl.save() != null

        params.id = sesionControl.id

        def model = controller.edit()

        assert model.sesionControlInstance == sesionControl
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sesionControl/list'

        response.reset()

        populateValidParams(params)
        def sesionControl = new SesionControl(params)

        assert sesionControl.save() != null

        // test invalid parameters in update
        params.id = sesionControl.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sesionControl/edit"
        assert model.sesionControlInstance != null

        sesionControl.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sesionControl/show/$sesionControl.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sesionControl.clearErrors()

        populateValidParams(params)
        params.id = sesionControl.id
        params.version = -1
        controller.update()

        assert view == "/sesionControl/edit"
        assert model.sesionControlInstance != null
        assert model.sesionControlInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sesionControl/list'

        response.reset()

        populateValidParams(params)
        def sesionControl = new SesionControl(params)

        assert sesionControl.save() != null
        assert SesionControl.count() == 1

        params.id = sesionControl.id

        controller.delete()

        assert SesionControl.count() == 0
        assert SesionControl.get(sesionControl.id) == null
        assert response.redirectedUrl == '/sesionControl/list'
    }
}

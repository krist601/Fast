package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(MassageControlController)
@Mock(MassageControl)
class MassageControlControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/massageControl/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.massageControlInstanceList.size() == 0
        assert model.massageControlInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.massageControlInstance != null
    }

    void testSave() {
        controller.save()

        assert model.massageControlInstance != null
        assert view == '/massageControl/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/massageControl/show/1'
        assert controller.flash.message != null
        assert MassageControl.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/massageControl/list'

        populateValidParams(params)
        def massageControl = new MassageControl(params)

        assert massageControl.save() != null

        params.id = massageControl.id

        def model = controller.show()

        assert model.massageControlInstance == massageControl
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/massageControl/list'

        populateValidParams(params)
        def massageControl = new MassageControl(params)

        assert massageControl.save() != null

        params.id = massageControl.id

        def model = controller.edit()

        assert model.massageControlInstance == massageControl
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/massageControl/list'

        response.reset()

        populateValidParams(params)
        def massageControl = new MassageControl(params)

        assert massageControl.save() != null

        // test invalid parameters in update
        params.id = massageControl.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/massageControl/edit"
        assert model.massageControlInstance != null

        massageControl.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/massageControl/show/$massageControl.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        massageControl.clearErrors()

        populateValidParams(params)
        params.id = massageControl.id
        params.version = -1
        controller.update()

        assert view == "/massageControl/edit"
        assert model.massageControlInstance != null
        assert model.massageControlInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/massageControl/list'

        response.reset()

        populateValidParams(params)
        def massageControl = new MassageControl(params)

        assert massageControl.save() != null
        assert MassageControl.count() == 1

        params.id = massageControl.id

        controller.delete()

        assert MassageControl.count() == 0
        assert MassageControl.get(massageControl.id) == null
        assert response.redirectedUrl == '/massageControl/list'
    }
}

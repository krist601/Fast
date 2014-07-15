package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(ApplicationControlController)
@Mock(ApplicationControl)
class ApplicationControlControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/applicationControl/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.applicationControlInstanceList.size() == 0
        assert model.applicationControlInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.applicationControlInstance != null
    }

    void testSave() {
        controller.save()

        assert model.applicationControlInstance != null
        assert view == '/applicationControl/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/applicationControl/show/1'
        assert controller.flash.message != null
        assert ApplicationControl.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/applicationControl/list'

        populateValidParams(params)
        def applicationControl = new ApplicationControl(params)

        assert applicationControl.save() != null

        params.id = applicationControl.id

        def model = controller.show()

        assert model.applicationControlInstance == applicationControl
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/applicationControl/list'

        populateValidParams(params)
        def applicationControl = new ApplicationControl(params)

        assert applicationControl.save() != null

        params.id = applicationControl.id

        def model = controller.edit()

        assert model.applicationControlInstance == applicationControl
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/applicationControl/list'

        response.reset()

        populateValidParams(params)
        def applicationControl = new ApplicationControl(params)

        assert applicationControl.save() != null

        // test invalid parameters in update
        params.id = applicationControl.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/applicationControl/edit"
        assert model.applicationControlInstance != null

        applicationControl.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/applicationControl/show/$applicationControl.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        applicationControl.clearErrors()

        populateValidParams(params)
        params.id = applicationControl.id
        params.version = -1
        controller.update()

        assert view == "/applicationControl/edit"
        assert model.applicationControlInstance != null
        assert model.applicationControlInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/applicationControl/list'

        response.reset()

        populateValidParams(params)
        def applicationControl = new ApplicationControl(params)

        assert applicationControl.save() != null
        assert ApplicationControl.count() == 1

        params.id = applicationControl.id

        controller.delete()

        assert ApplicationControl.count() == 0
        assert ApplicationControl.get(applicationControl.id) == null
        assert response.redirectedUrl == '/applicationControl/list'
    }
}

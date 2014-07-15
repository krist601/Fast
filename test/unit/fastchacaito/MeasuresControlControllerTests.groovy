package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(MeasuresControlController)
@Mock(MeasuresControl)
class MeasuresControlControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/measuresControl/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.measuresControlInstanceList.size() == 0
        assert model.measuresControlInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.measuresControlInstance != null
    }

    void testSave() {
        controller.save()

        assert model.measuresControlInstance != null
        assert view == '/measuresControl/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/measuresControl/show/1'
        assert controller.flash.message != null
        assert MeasuresControl.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/measuresControl/list'

        populateValidParams(params)
        def measuresControl = new MeasuresControl(params)

        assert measuresControl.save() != null

        params.id = measuresControl.id

        def model = controller.show()

        assert model.measuresControlInstance == measuresControl
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/measuresControl/list'

        populateValidParams(params)
        def measuresControl = new MeasuresControl(params)

        assert measuresControl.save() != null

        params.id = measuresControl.id

        def model = controller.edit()

        assert model.measuresControlInstance == measuresControl
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/measuresControl/list'

        response.reset()

        populateValidParams(params)
        def measuresControl = new MeasuresControl(params)

        assert measuresControl.save() != null

        // test invalid parameters in update
        params.id = measuresControl.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/measuresControl/edit"
        assert model.measuresControlInstance != null

        measuresControl.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/measuresControl/show/$measuresControl.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        measuresControl.clearErrors()

        populateValidParams(params)
        params.id = measuresControl.id
        params.version = -1
        controller.update()

        assert view == "/measuresControl/edit"
        assert model.measuresControlInstance != null
        assert model.measuresControlInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/measuresControl/list'

        response.reset()

        populateValidParams(params)
        def measuresControl = new MeasuresControl(params)

        assert measuresControl.save() != null
        assert MeasuresControl.count() == 1

        params.id = measuresControl.id

        controller.delete()

        assert MeasuresControl.count() == 0
        assert MeasuresControl.get(measuresControl.id) == null
        assert response.redirectedUrl == '/measuresControl/list'
    }
}

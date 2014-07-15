package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(BloodSampleController)
@Mock(BloodSample)
class BloodSampleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bloodSample/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.bloodSampleInstanceList.size() == 0
        assert model.bloodSampleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.bloodSampleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.bloodSampleInstance != null
        assert view == '/bloodSample/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bloodSample/show/1'
        assert controller.flash.message != null
        assert BloodSample.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bloodSample/list'

        populateValidParams(params)
        def bloodSample = new BloodSample(params)

        assert bloodSample.save() != null

        params.id = bloodSample.id

        def model = controller.show()

        assert model.bloodSampleInstance == bloodSample
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bloodSample/list'

        populateValidParams(params)
        def bloodSample = new BloodSample(params)

        assert bloodSample.save() != null

        params.id = bloodSample.id

        def model = controller.edit()

        assert model.bloodSampleInstance == bloodSample
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bloodSample/list'

        response.reset()

        populateValidParams(params)
        def bloodSample = new BloodSample(params)

        assert bloodSample.save() != null

        // test invalid parameters in update
        params.id = bloodSample.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bloodSample/edit"
        assert model.bloodSampleInstance != null

        bloodSample.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bloodSample/show/$bloodSample.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bloodSample.clearErrors()

        populateValidParams(params)
        params.id = bloodSample.id
        params.version = -1
        controller.update()

        assert view == "/bloodSample/edit"
        assert model.bloodSampleInstance != null
        assert model.bloodSampleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bloodSample/list'

        response.reset()

        populateValidParams(params)
        def bloodSample = new BloodSample(params)

        assert bloodSample.save() != null
        assert BloodSample.count() == 1

        params.id = bloodSample.id

        controller.delete()

        assert BloodSample.count() == 0
        assert BloodSample.get(bloodSample.id) == null
        assert response.redirectedUrl == '/bloodSample/list'
    }
}

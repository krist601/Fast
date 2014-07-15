package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(BodyTherapyController)
@Mock(BodyTherapy)
class BodyTherapyControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bodyTherapy/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.bodyTherapyInstanceList.size() == 0
        assert model.bodyTherapyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.bodyTherapyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.bodyTherapyInstance != null
        assert view == '/bodyTherapy/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bodyTherapy/show/1'
        assert controller.flash.message != null
        assert BodyTherapy.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bodyTherapy/list'

        populateValidParams(params)
        def bodyTherapy = new BodyTherapy(params)

        assert bodyTherapy.save() != null

        params.id = bodyTherapy.id

        def model = controller.show()

        assert model.bodyTherapyInstance == bodyTherapy
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bodyTherapy/list'

        populateValidParams(params)
        def bodyTherapy = new BodyTherapy(params)

        assert bodyTherapy.save() != null

        params.id = bodyTherapy.id

        def model = controller.edit()

        assert model.bodyTherapyInstance == bodyTherapy
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bodyTherapy/list'

        response.reset()

        populateValidParams(params)
        def bodyTherapy = new BodyTherapy(params)

        assert bodyTherapy.save() != null

        // test invalid parameters in update
        params.id = bodyTherapy.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bodyTherapy/edit"
        assert model.bodyTherapyInstance != null

        bodyTherapy.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bodyTherapy/show/$bodyTherapy.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bodyTherapy.clearErrors()

        populateValidParams(params)
        params.id = bodyTherapy.id
        params.version = -1
        controller.update()

        assert view == "/bodyTherapy/edit"
        assert model.bodyTherapyInstance != null
        assert model.bodyTherapyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bodyTherapy/list'

        response.reset()

        populateValidParams(params)
        def bodyTherapy = new BodyTherapy(params)

        assert bodyTherapy.save() != null
        assert BodyTherapy.count() == 1

        params.id = bodyTherapy.id

        controller.delete()

        assert BodyTherapy.count() == 0
        assert BodyTherapy.get(bodyTherapy.id) == null
        assert response.redirectedUrl == '/bodyTherapy/list'
    }
}

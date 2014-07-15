package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(GelController)
@Mock(Gel)
class GelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gelInstanceList.size() == 0
        assert model.gelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.gelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gelInstance != null
        assert view == '/gel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gel/show/1'
        assert controller.flash.message != null
        assert Gel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gel/list'

        populateValidParams(params)
        def gel = new Gel(params)

        assert gel.save() != null

        params.id = gel.id

        def model = controller.show()

        assert model.gelInstance == gel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gel/list'

        populateValidParams(params)
        def gel = new Gel(params)

        assert gel.save() != null

        params.id = gel.id

        def model = controller.edit()

        assert model.gelInstance == gel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gel/list'

        response.reset()

        populateValidParams(params)
        def gel = new Gel(params)

        assert gel.save() != null

        // test invalid parameters in update
        params.id = gel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gel/edit"
        assert model.gelInstance != null

        gel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gel/show/$gel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gel.clearErrors()

        populateValidParams(params)
        params.id = gel.id
        params.version = -1
        controller.update()

        assert view == "/gel/edit"
        assert model.gelInstance != null
        assert model.gelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gel/list'

        response.reset()

        populateValidParams(params)
        def gel = new Gel(params)

        assert gel.save() != null
        assert Gel.count() == 1

        params.id = gel.id

        controller.delete()

        assert Gel.count() == 0
        assert Gel.get(gel.id) == null
        assert response.redirectedUrl == '/gel/list'
    }
}

package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(MesotherapyController)
@Mock(Mesotherapy)
class MesotherapyControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mesotherapy/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mesotherapyInstanceList.size() == 0
        assert model.mesotherapyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mesotherapyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mesotherapyInstance != null
        assert view == '/mesotherapy/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mesotherapy/show/1'
        assert controller.flash.message != null
        assert Mesotherapy.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mesotherapy/list'

        populateValidParams(params)
        def mesotherapy = new Mesotherapy(params)

        assert mesotherapy.save() != null

        params.id = mesotherapy.id

        def model = controller.show()

        assert model.mesotherapyInstance == mesotherapy
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mesotherapy/list'

        populateValidParams(params)
        def mesotherapy = new Mesotherapy(params)

        assert mesotherapy.save() != null

        params.id = mesotherapy.id

        def model = controller.edit()

        assert model.mesotherapyInstance == mesotherapy
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mesotherapy/list'

        response.reset()

        populateValidParams(params)
        def mesotherapy = new Mesotherapy(params)

        assert mesotherapy.save() != null

        // test invalid parameters in update
        params.id = mesotherapy.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mesotherapy/edit"
        assert model.mesotherapyInstance != null

        mesotherapy.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mesotherapy/show/$mesotherapy.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mesotherapy.clearErrors()

        populateValidParams(params)
        params.id = mesotherapy.id
        params.version = -1
        controller.update()

        assert view == "/mesotherapy/edit"
        assert model.mesotherapyInstance != null
        assert model.mesotherapyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mesotherapy/list'

        response.reset()

        populateValidParams(params)
        def mesotherapy = new Mesotherapy(params)

        assert mesotherapy.save() != null
        assert Mesotherapy.count() == 1

        params.id = mesotherapy.id

        controller.delete()

        assert Mesotherapy.count() == 0
        assert Mesotherapy.get(mesotherapy.id) == null
        assert response.redirectedUrl == '/mesotherapy/list'
    }
}

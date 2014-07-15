package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(VacutainerController)
@Mock(Vacutainer)
class VacutainerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/vacutainer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.vacutainerInstanceList.size() == 0
        assert model.vacutainerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.vacutainerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.vacutainerInstance != null
        assert view == '/vacutainer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/vacutainer/show/1'
        assert controller.flash.message != null
        assert Vacutainer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/vacutainer/list'

        populateValidParams(params)
        def vacutainer = new Vacutainer(params)

        assert vacutainer.save() != null

        params.id = vacutainer.id

        def model = controller.show()

        assert model.vacutainerInstance == vacutainer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/vacutainer/list'

        populateValidParams(params)
        def vacutainer = new Vacutainer(params)

        assert vacutainer.save() != null

        params.id = vacutainer.id

        def model = controller.edit()

        assert model.vacutainerInstance == vacutainer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/vacutainer/list'

        response.reset()

        populateValidParams(params)
        def vacutainer = new Vacutainer(params)

        assert vacutainer.save() != null

        // test invalid parameters in update
        params.id = vacutainer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/vacutainer/edit"
        assert model.vacutainerInstance != null

        vacutainer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/vacutainer/show/$vacutainer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        vacutainer.clearErrors()

        populateValidParams(params)
        params.id = vacutainer.id
        params.version = -1
        controller.update()

        assert view == "/vacutainer/edit"
        assert model.vacutainerInstance != null
        assert model.vacutainerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/vacutainer/list'

        response.reset()

        populateValidParams(params)
        def vacutainer = new Vacutainer(params)

        assert vacutainer.save() != null
        assert Vacutainer.count() == 1

        params.id = vacutainer.id

        controller.delete()

        assert Vacutainer.count() == 0
        assert Vacutainer.get(vacutainer.id) == null
        assert response.redirectedUrl == '/vacutainer/list'
    }
}

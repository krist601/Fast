package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(ClosureController)
@Mock(Closure)
class ClosureControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/closure/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.closureInstanceList.size() == 0
        assert model.closureInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.closureInstance != null
    }

    void testSave() {
        controller.save()

        assert model.closureInstance != null
        assert view == '/closure/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/closure/show/1'
        assert controller.flash.message != null
        assert Closure.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/closure/list'

        populateValidParams(params)
        def closure = new Closure(params)

        assert closure.save() != null

        params.id = closure.id

        def model = controller.show()

        assert model.closureInstance == closure
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/closure/list'

        populateValidParams(params)
        def closure = new Closure(params)

        assert closure.save() != null

        params.id = closure.id

        def model = controller.edit()

        assert model.closureInstance == closure
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/closure/list'

        response.reset()

        populateValidParams(params)
        def closure = new Closure(params)

        assert closure.save() != null

        // test invalid parameters in update
        params.id = closure.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/closure/edit"
        assert model.closureInstance != null

        closure.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/closure/show/$closure.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        closure.clearErrors()

        populateValidParams(params)
        params.id = closure.id
        params.version = -1
        controller.update()

        assert view == "/closure/edit"
        assert model.closureInstance != null
        assert model.closureInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/closure/list'

        response.reset()

        populateValidParams(params)
        def closure = new Closure(params)

        assert closure.save() != null
        assert Closure.count() == 1

        params.id = closure.id

        controller.delete()

        assert Closure.count() == 0
        assert Closure.get(closure.id) == null
        assert response.redirectedUrl == '/closure/list'
    }
}

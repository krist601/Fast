package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(MachineController)
@Mock(Machine)
class MachineControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/machine/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.machineInstanceList.size() == 0
        assert model.machineInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.machineInstance != null
    }

    void testSave() {
        controller.save()

        assert model.machineInstance != null
        assert view == '/machine/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/machine/show/1'
        assert controller.flash.message != null
        assert Machine.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/machine/list'

        populateValidParams(params)
        def machine = new Machine(params)

        assert machine.save() != null

        params.id = machine.id

        def model = controller.show()

        assert model.machineInstance == machine
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/machine/list'

        populateValidParams(params)
        def machine = new Machine(params)

        assert machine.save() != null

        params.id = machine.id

        def model = controller.edit()

        assert model.machineInstance == machine
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/machine/list'

        response.reset()

        populateValidParams(params)
        def machine = new Machine(params)

        assert machine.save() != null

        // test invalid parameters in update
        params.id = machine.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/machine/edit"
        assert model.machineInstance != null

        machine.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/machine/show/$machine.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        machine.clearErrors()

        populateValidParams(params)
        params.id = machine.id
        params.version = -1
        controller.update()

        assert view == "/machine/edit"
        assert model.machineInstance != null
        assert model.machineInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/machine/list'

        response.reset()

        populateValidParams(params)
        def machine = new Machine(params)

        assert machine.save() != null
        assert Machine.count() == 1

        params.id = machine.id

        controller.delete()

        assert Machine.count() == 0
        assert Machine.get(machine.id) == null
        assert response.redirectedUrl == '/machine/list'
    }
}

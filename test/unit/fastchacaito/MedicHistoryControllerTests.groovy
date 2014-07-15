package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(MedicHistoryController)
@Mock(MedicHistory)
class MedicHistoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/medicHistory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.medicHistoryInstanceList.size() == 0
        assert model.medicHistoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.medicHistoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.medicHistoryInstance != null
        assert view == '/medicHistory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/medicHistory/show/1'
        assert controller.flash.message != null
        assert MedicHistory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/medicHistory/list'

        populateValidParams(params)
        def medicHistory = new MedicHistory(params)

        assert medicHistory.save() != null

        params.id = medicHistory.id

        def model = controller.show()

        assert model.medicHistoryInstance == medicHistory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/medicHistory/list'

        populateValidParams(params)
        def medicHistory = new MedicHistory(params)

        assert medicHistory.save() != null

        params.id = medicHistory.id

        def model = controller.edit()

        assert model.medicHistoryInstance == medicHistory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/medicHistory/list'

        response.reset()

        populateValidParams(params)
        def medicHistory = new MedicHistory(params)

        assert medicHistory.save() != null

        // test invalid parameters in update
        params.id = medicHistory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/medicHistory/edit"
        assert model.medicHistoryInstance != null

        medicHistory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/medicHistory/show/$medicHistory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        medicHistory.clearErrors()

        populateValidParams(params)
        params.id = medicHistory.id
        params.version = -1
        controller.update()

        assert view == "/medicHistory/edit"
        assert model.medicHistoryInstance != null
        assert model.medicHistoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/medicHistory/list'

        response.reset()

        populateValidParams(params)
        def medicHistory = new MedicHistory(params)

        assert medicHistory.save() != null
        assert MedicHistory.count() == 1

        params.id = medicHistory.id

        controller.delete()

        assert MedicHistory.count() == 0
        assert MedicHistory.get(medicHistory.id) == null
        assert response.redirectedUrl == '/medicHistory/list'
    }
}

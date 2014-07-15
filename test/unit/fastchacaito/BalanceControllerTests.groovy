package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(BalanceController)
@Mock(Balance)
class BalanceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/balance/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.balanceInstanceList.size() == 0
        assert model.balanceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.balanceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.balanceInstance != null
        assert view == '/balance/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/balance/show/1'
        assert controller.flash.message != null
        assert Balance.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/balance/list'

        populateValidParams(params)
        def balance = new Balance(params)

        assert balance.save() != null

        params.id = balance.id

        def model = controller.show()

        assert model.balanceInstance == balance
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/balance/list'

        populateValidParams(params)
        def balance = new Balance(params)

        assert balance.save() != null

        params.id = balance.id

        def model = controller.edit()

        assert model.balanceInstance == balance
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/balance/list'

        response.reset()

        populateValidParams(params)
        def balance = new Balance(params)

        assert balance.save() != null

        // test invalid parameters in update
        params.id = balance.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/balance/edit"
        assert model.balanceInstance != null

        balance.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/balance/show/$balance.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        balance.clearErrors()

        populateValidParams(params)
        params.id = balance.id
        params.version = -1
        controller.update()

        assert view == "/balance/edit"
        assert model.balanceInstance != null
        assert model.balanceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/balance/list'

        response.reset()

        populateValidParams(params)
        def balance = new Balance(params)

        assert balance.save() != null
        assert Balance.count() == 1

        params.id = balance.id

        controller.delete()

        assert Balance.count() == 0
        assert Balance.get(balance.id) == null
        assert response.redirectedUrl == '/balance/list'
    }
}

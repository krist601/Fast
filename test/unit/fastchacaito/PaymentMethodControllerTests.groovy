package fastchacaito



import org.junit.*
import grails.test.mixin.*

@TestFor(PaymentMethodController)
@Mock(PaymentMethod)
class PaymentMethodControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/paymentMethod/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.paymentMethodInstanceList.size() == 0
        assert model.paymentMethodInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.paymentMethodInstance != null
    }

    void testSave() {
        controller.save()

        assert model.paymentMethodInstance != null
        assert view == '/paymentMethod/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/paymentMethod/show/1'
        assert controller.flash.message != null
        assert PaymentMethod.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentMethod/list'

        populateValidParams(params)
        def paymentMethod = new PaymentMethod(params)

        assert paymentMethod.save() != null

        params.id = paymentMethod.id

        def model = controller.show()

        assert model.paymentMethodInstance == paymentMethod
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentMethod/list'

        populateValidParams(params)
        def paymentMethod = new PaymentMethod(params)

        assert paymentMethod.save() != null

        params.id = paymentMethod.id

        def model = controller.edit()

        assert model.paymentMethodInstance == paymentMethod
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentMethod/list'

        response.reset()

        populateValidParams(params)
        def paymentMethod = new PaymentMethod(params)

        assert paymentMethod.save() != null

        // test invalid parameters in update
        params.id = paymentMethod.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/paymentMethod/edit"
        assert model.paymentMethodInstance != null

        paymentMethod.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/paymentMethod/show/$paymentMethod.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        paymentMethod.clearErrors()

        populateValidParams(params)
        params.id = paymentMethod.id
        params.version = -1
        controller.update()

        assert view == "/paymentMethod/edit"
        assert model.paymentMethodInstance != null
        assert model.paymentMethodInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/paymentMethod/list'

        response.reset()

        populateValidParams(params)
        def paymentMethod = new PaymentMethod(params)

        assert paymentMethod.save() != null
        assert PaymentMethod.count() == 1

        params.id = paymentMethod.id

        controller.delete()

        assert PaymentMethod.count() == 0
        assert PaymentMethod.get(paymentMethod.id) == null
        assert response.redirectedUrl == '/paymentMethod/list'
    }
}

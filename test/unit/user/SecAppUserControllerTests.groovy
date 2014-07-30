package user



import org.junit.*
import grails.test.mixin.*

@TestFor(SecAppUserController)
@Mock(SecAppUser)
class SecAppUserControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/secAppUser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.secAppUserInstanceList.size() == 0
        assert model.secAppUserInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.secAppUserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.secAppUserInstance != null
        assert view == '/secAppUser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/secAppUser/show/1'
        assert controller.flash.message != null
        assert SecAppUser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/secAppUser/list'

        populateValidParams(params)
        def secAppUser = new SecAppUser(params)

        assert secAppUser.save() != null

        params.id = secAppUser.id

        def model = controller.show()

        assert model.secAppUserInstance == secAppUser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/secAppUser/list'

        populateValidParams(params)
        def secAppUser = new SecAppUser(params)

        assert secAppUser.save() != null

        params.id = secAppUser.id

        def model = controller.edit()

        assert model.secAppUserInstance == secAppUser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/secAppUser/list'

        response.reset()

        populateValidParams(params)
        def secAppUser = new SecAppUser(params)

        assert secAppUser.save() != null

        // test invalid parameters in update
        params.id = secAppUser.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/secAppUser/edit"
        assert model.secAppUserInstance != null

        secAppUser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/secAppUser/show/$secAppUser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        secAppUser.clearErrors()

        populateValidParams(params)
        params.id = secAppUser.id
        params.version = -1
        controller.update()

        assert view == "/secAppUser/edit"
        assert model.secAppUserInstance != null
        assert model.secAppUserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/secAppUser/list'

        response.reset()

        populateValidParams(params)
        def secAppUser = new SecAppUser(params)

        assert secAppUser.save() != null
        assert SecAppUser.count() == 1

        params.id = secAppUser.id

        controller.delete()

        assert SecAppUser.count() == 0
        assert SecAppUser.get(secAppUser.id) == null
        assert response.redirectedUrl == '/secAppUser/list'
    }
}

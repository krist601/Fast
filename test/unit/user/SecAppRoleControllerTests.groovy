package user



import org.junit.*
import grails.test.mixin.*

@TestFor(SecAppRoleController)
@Mock(SecAppRole)
class SecAppRoleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/secAppRole/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.secAppRoleInstanceList.size() == 0
        assert model.secAppRoleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.secAppRoleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.secAppRoleInstance != null
        assert view == '/secAppRole/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/secAppRole/show/1'
        assert controller.flash.message != null
        assert SecAppRole.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/secAppRole/list'

        populateValidParams(params)
        def secAppRole = new SecAppRole(params)

        assert secAppRole.save() != null

        params.id = secAppRole.id

        def model = controller.show()

        assert model.secAppRoleInstance == secAppRole
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/secAppRole/list'

        populateValidParams(params)
        def secAppRole = new SecAppRole(params)

        assert secAppRole.save() != null

        params.id = secAppRole.id

        def model = controller.edit()

        assert model.secAppRoleInstance == secAppRole
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/secAppRole/list'

        response.reset()

        populateValidParams(params)
        def secAppRole = new SecAppRole(params)

        assert secAppRole.save() != null

        // test invalid parameters in update
        params.id = secAppRole.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/secAppRole/edit"
        assert model.secAppRoleInstance != null

        secAppRole.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/secAppRole/show/$secAppRole.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        secAppRole.clearErrors()

        populateValidParams(params)
        params.id = secAppRole.id
        params.version = -1
        controller.update()

        assert view == "/secAppRole/edit"
        assert model.secAppRoleInstance != null
        assert model.secAppRoleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/secAppRole/list'

        response.reset()

        populateValidParams(params)
        def secAppRole = new SecAppRole(params)

        assert secAppRole.save() != null
        assert SecAppRole.count() == 1

        params.id = secAppRole.id

        controller.delete()

        assert SecAppRole.count() == 0
        assert SecAppRole.get(secAppRole.id) == null
        assert response.redirectedUrl == '/secAppRole/list'
    }
}

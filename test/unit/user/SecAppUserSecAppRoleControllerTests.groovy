package user



import org.junit.*
import grails.test.mixin.*

@TestFor(SecAppUserSecAppRoleController)
@Mock(SecAppUserSecAppRole)
class SecAppUserSecAppRoleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/secAppUserSecAppRole/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.secAppUserSecAppRoleInstanceList.size() == 0
        assert model.secAppUserSecAppRoleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.secAppUserSecAppRoleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.secAppUserSecAppRoleInstance != null
        assert view == '/secAppUserSecAppRole/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/secAppUserSecAppRole/show/1'
        assert controller.flash.message != null
        assert SecAppUserSecAppRole.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/secAppUserSecAppRole/list'

        populateValidParams(params)
        def secAppUserSecAppRole = new SecAppUserSecAppRole(params)

        assert secAppUserSecAppRole.save() != null

        params.id = secAppUserSecAppRole.id

        def model = controller.show()

        assert model.secAppUserSecAppRoleInstance == secAppUserSecAppRole
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/secAppUserSecAppRole/list'

        populateValidParams(params)
        def secAppUserSecAppRole = new SecAppUserSecAppRole(params)

        assert secAppUserSecAppRole.save() != null

        params.id = secAppUserSecAppRole.id

        def model = controller.edit()

        assert model.secAppUserSecAppRoleInstance == secAppUserSecAppRole
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/secAppUserSecAppRole/list'

        response.reset()

        populateValidParams(params)
        def secAppUserSecAppRole = new SecAppUserSecAppRole(params)

        assert secAppUserSecAppRole.save() != null

        // test invalid parameters in update
        params.id = secAppUserSecAppRole.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/secAppUserSecAppRole/edit"
        assert model.secAppUserSecAppRoleInstance != null

        secAppUserSecAppRole.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/secAppUserSecAppRole/show/$secAppUserSecAppRole.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        secAppUserSecAppRole.clearErrors()

        populateValidParams(params)
        params.id = secAppUserSecAppRole.id
        params.version = -1
        controller.update()

        assert view == "/secAppUserSecAppRole/edit"
        assert model.secAppUserSecAppRoleInstance != null
        assert model.secAppUserSecAppRoleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/secAppUserSecAppRole/list'

        response.reset()

        populateValidParams(params)
        def secAppUserSecAppRole = new SecAppUserSecAppRole(params)

        assert secAppUserSecAppRole.save() != null
        assert SecAppUserSecAppRole.count() == 1

        params.id = secAppUserSecAppRole.id

        controller.delete()

        assert SecAppUserSecAppRole.count() == 0
        assert SecAppUserSecAppRole.get(secAppUserSecAppRole.id) == null
        assert response.redirectedUrl == '/secAppUserSecAppRole/list'
    }
}

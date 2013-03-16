package revlsms



import org.junit.*
import grails.test.mixin.*

@TestFor(ResourcesController)
@Mock(Resources)
class ResourcesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/resources/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.resourcesInstanceList.size() == 0
        assert model.resourcesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.resourcesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.resourcesInstance != null
        assert view == '/resources/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/resources/show/1'
        assert controller.flash.message != null
        assert Resources.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/resources/list'

        populateValidParams(params)
        def resources = new Resources(params)

        assert resources.save() != null

        params.id = resources.id

        def model = controller.show()

        assert model.resourcesInstance == resources
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/resources/list'

        populateValidParams(params)
        def resources = new Resources(params)

        assert resources.save() != null

        params.id = resources.id

        def model = controller.edit()

        assert model.resourcesInstance == resources
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/resources/list'

        response.reset()

        populateValidParams(params)
        def resources = new Resources(params)

        assert resources.save() != null

        // test invalid parameters in update
        params.id = resources.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/resources/edit"
        assert model.resourcesInstance != null

        resources.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/resources/show/$resources.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        resources.clearErrors()

        populateValidParams(params)
        params.id = resources.id
        params.version = -1
        controller.update()

        assert view == "/resources/edit"
        assert model.resourcesInstance != null
        assert model.resourcesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/resources/list'

        response.reset()

        populateValidParams(params)
        def resources = new Resources(params)

        assert resources.save() != null
        assert Resources.count() == 1

        params.id = resources.id

        controller.delete()

        assert Resources.count() == 0
        assert Resources.get(resources.id) == null
        assert response.redirectedUrl == '/resources/list'
    }
}

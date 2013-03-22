package lsmsfinal



import org.junit.*
import grails.test.mixin.*

@TestFor(PackagesController)
@Mock(Packages)
class PackagesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/packages/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.packagesInstanceList.size() == 0
        assert model.packagesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.packagesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.packagesInstance != null
        assert view == '/packages/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/packages/show/1'
        assert controller.flash.message != null
        assert Packages.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/packages/list'

        populateValidParams(params)
        def packages = new Packages(params)

        assert packages.save() != null

        params.id = packages.id

        def model = controller.show()

        assert model.packagesInstance == packages
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/packages/list'

        populateValidParams(params)
        def packages = new Packages(params)

        assert packages.save() != null

        params.id = packages.id

        def model = controller.edit()

        assert model.packagesInstance == packages
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/packages/list'

        response.reset()

        populateValidParams(params)
        def packages = new Packages(params)

        assert packages.save() != null

        // test invalid parameters in update
        params.id = packages.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/packages/edit"
        assert model.packagesInstance != null

        packages.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/packages/show/$packages.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        packages.clearErrors()

        populateValidParams(params)
        params.id = packages.id
        params.version = -1
        controller.update()

        assert view == "/packages/edit"
        assert model.packagesInstance != null
        assert model.packagesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/packages/list'

        response.reset()

        populateValidParams(params)
        def packages = new Packages(params)

        assert packages.save() != null
        assert Packages.count() == 1

        params.id = packages.id

        controller.delete()

        assert Packages.count() == 0
        assert Packages.get(packages.id) == null
        assert response.redirectedUrl == '/packages/list'
    }
}

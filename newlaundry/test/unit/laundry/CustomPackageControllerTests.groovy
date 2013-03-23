package laundry



import org.junit.*
import grails.test.mixin.*

@TestFor(CustomPackageController)
@Mock(CustomPackage)
class CustomPackageControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/customPackage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.customPackageInstanceList.size() == 0
        assert model.customPackageInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.customPackageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.customPackageInstance != null
        assert view == '/customPackage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/customPackage/show/1'
        assert controller.flash.message != null
        assert CustomPackage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/customPackage/list'

        populateValidParams(params)
        def customPackage = new CustomPackage(params)

        assert customPackage.save() != null

        params.id = customPackage.id

        def model = controller.show()

        assert model.customPackageInstance == customPackage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/customPackage/list'

        populateValidParams(params)
        def customPackage = new CustomPackage(params)

        assert customPackage.save() != null

        params.id = customPackage.id

        def model = controller.edit()

        assert model.customPackageInstance == customPackage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/customPackage/list'

        response.reset()

        populateValidParams(params)
        def customPackage = new CustomPackage(params)

        assert customPackage.save() != null

        // test invalid parameters in update
        params.id = customPackage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/customPackage/edit"
        assert model.customPackageInstance != null

        customPackage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/customPackage/show/$customPackage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        customPackage.clearErrors()

        populateValidParams(params)
        params.id = customPackage.id
        params.version = -1
        controller.update()

        assert view == "/customPackage/edit"
        assert model.customPackageInstance != null
        assert model.customPackageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/customPackage/list'

        response.reset()

        populateValidParams(params)
        def customPackage = new CustomPackage(params)

        assert customPackage.save() != null
        assert CustomPackage.count() == 1

        params.id = customPackage.id

        controller.delete()

        assert CustomPackage.count() == 0
        assert CustomPackage.get(customPackage.id) == null
        assert response.redirectedUrl == '/customPackage/list'
    }
}

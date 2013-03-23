package laundry



import org.junit.*
import grails.test.mixin.*

@TestFor(LaundryController)
@Mock(Laundry)
class LaundryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/laundry/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.laundryInstanceList.size() == 0
        assert model.laundryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.laundryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.laundryInstance != null
        assert view == '/laundry/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/laundry/show/1'
        assert controller.flash.message != null
        assert Laundry.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/laundry/list'

        populateValidParams(params)
        def laundry = new Laundry(params)

        assert laundry.save() != null

        params.id = laundry.id

        def model = controller.show()

        assert model.laundryInstance == laundry
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/laundry/list'

        populateValidParams(params)
        def laundry = new Laundry(params)

        assert laundry.save() != null

        params.id = laundry.id

        def model = controller.edit()

        assert model.laundryInstance == laundry
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/laundry/list'

        response.reset()

        populateValidParams(params)
        def laundry = new Laundry(params)

        assert laundry.save() != null

        // test invalid parameters in update
        params.id = laundry.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/laundry/edit"
        assert model.laundryInstance != null

        laundry.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/laundry/show/$laundry.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        laundry.clearErrors()

        populateValidParams(params)
        params.id = laundry.id
        params.version = -1
        controller.update()

        assert view == "/laundry/edit"
        assert model.laundryInstance != null
        assert model.laundryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/laundry/list'

        response.reset()

        populateValidParams(params)
        def laundry = new Laundry(params)

        assert laundry.save() != null
        assert Laundry.count() == 1

        params.id = laundry.id

        controller.delete()

        assert Laundry.count() == 0
        assert Laundry.get(laundry.id) == null
        assert response.redirectedUrl == '/laundry/list'
    }
}

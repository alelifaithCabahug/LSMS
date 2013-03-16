package revlsms



import org.junit.*
import grails.test.mixin.*

@TestFor(AvailLaundryServiceController)
@Mock(AvailLaundryService)
class AvailLaundryServiceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/availLaundryService/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.availLaundryServiceInstanceList.size() == 0
        assert model.availLaundryServiceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.availLaundryServiceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.availLaundryServiceInstance != null
        assert view == '/availLaundryService/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/availLaundryService/show/1'
        assert controller.flash.message != null
        assert AvailLaundryService.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/availLaundryService/list'

        populateValidParams(params)
        def availLaundryService = new AvailLaundryService(params)

        assert availLaundryService.save() != null

        params.id = availLaundryService.id

        def model = controller.show()

        assert model.availLaundryServiceInstance == availLaundryService
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/availLaundryService/list'

        populateValidParams(params)
        def availLaundryService = new AvailLaundryService(params)

        assert availLaundryService.save() != null

        params.id = availLaundryService.id

        def model = controller.edit()

        assert model.availLaundryServiceInstance == availLaundryService
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/availLaundryService/list'

        response.reset()

        populateValidParams(params)
        def availLaundryService = new AvailLaundryService(params)

        assert availLaundryService.save() != null

        // test invalid parameters in update
        params.id = availLaundryService.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/availLaundryService/edit"
        assert model.availLaundryServiceInstance != null

        availLaundryService.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/availLaundryService/show/$availLaundryService.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        availLaundryService.clearErrors()

        populateValidParams(params)
        params.id = availLaundryService.id
        params.version = -1
        controller.update()

        assert view == "/availLaundryService/edit"
        assert model.availLaundryServiceInstance != null
        assert model.availLaundryServiceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/availLaundryService/list'

        response.reset()

        populateValidParams(params)
        def availLaundryService = new AvailLaundryService(params)

        assert availLaundryService.save() != null
        assert AvailLaundryService.count() == 1

        params.id = availLaundryService.id

        controller.delete()

        assert AvailLaundryService.count() == 0
        assert AvailLaundryService.get(availLaundryService.id) == null
        assert response.redirectedUrl == '/availLaundryService/list'
    }
}

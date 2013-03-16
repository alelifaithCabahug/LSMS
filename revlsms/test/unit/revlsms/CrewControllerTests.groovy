package revlsms



import org.junit.*
import grails.test.mixin.*

@TestFor(CrewController)
@Mock(Crew)
class CrewControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/crew/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.crewInstanceList.size() == 0
        assert model.crewInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.crewInstance != null
    }

    void testSave() {
        controller.save()

        assert model.crewInstance != null
        assert view == '/crew/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/crew/show/1'
        assert controller.flash.message != null
        assert Crew.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/crew/list'

        populateValidParams(params)
        def crew = new Crew(params)

        assert crew.save() != null

        params.id = crew.id

        def model = controller.show()

        assert model.crewInstance == crew
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/crew/list'

        populateValidParams(params)
        def crew = new Crew(params)

        assert crew.save() != null

        params.id = crew.id

        def model = controller.edit()

        assert model.crewInstance == crew
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/crew/list'

        response.reset()

        populateValidParams(params)
        def crew = new Crew(params)

        assert crew.save() != null

        // test invalid parameters in update
        params.id = crew.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/crew/edit"
        assert model.crewInstance != null

        crew.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/crew/show/$crew.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        crew.clearErrors()

        populateValidParams(params)
        params.id = crew.id
        params.version = -1
        controller.update()

        assert view == "/crew/edit"
        assert model.crewInstance != null
        assert model.crewInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/crew/list'

        response.reset()

        populateValidParams(params)
        def crew = new Crew(params)

        assert crew.save() != null
        assert Crew.count() == 1

        params.id = crew.id

        controller.delete()

        assert Crew.count() == 0
        assert Crew.get(crew.id) == null
        assert response.redirectedUrl == '/crew/list'
    }
}

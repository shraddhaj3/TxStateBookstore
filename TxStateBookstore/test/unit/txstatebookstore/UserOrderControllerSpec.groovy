package txstatebookstore



import grails.test.mixin.*
import spock.lang.*

@TestFor(UserOrderController)
@Mock(UserOrder)
class UserOrderControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.userOrderInstanceList
            model.userOrderInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.userOrderInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def userOrder = new UserOrder()
            userOrder.validate()
            controller.save(userOrder)

        then:"The create view is rendered again with the correct model"
            model.userOrderInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            userOrder = new UserOrder(params)

            controller.save(userOrder)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/userOrder/show/1'
            controller.flash.message != null
            UserOrder.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def userOrder = new UserOrder(params)
            controller.show(userOrder)

        then:"A model is populated containing the domain instance"
            model.userOrderInstance == userOrder
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def userOrder = new UserOrder(params)
            controller.edit(userOrder)

        then:"A model is populated containing the domain instance"
            model.userOrderInstance == userOrder
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/userOrder/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def userOrder = new UserOrder()
            userOrder.validate()
            controller.update(userOrder)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.userOrderInstance == userOrder

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            userOrder = new UserOrder(params).save(flush: true)
            controller.update(userOrder)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/userOrder/show/$userOrder.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/userOrder/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def userOrder = new UserOrder(params).save(flush: true)

        then:"It exists"
            UserOrder.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(userOrder)

        then:"The instance is deleted"
            UserOrder.count() == 0
            response.redirectedUrl == '/userOrder/index'
            flash.message != null
    }
}

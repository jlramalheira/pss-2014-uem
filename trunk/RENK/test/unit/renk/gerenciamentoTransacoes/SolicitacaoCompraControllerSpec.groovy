package renk.gerenciamentoTransacoes



import grails.test.mixin.*
import spock.lang.*

@TestFor(SolicitacaoCompraController)
@Mock(SolicitacaoCompra)
class SolicitacaoCompraControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.solicitacaoCompraInstanceList
            model.solicitacaoCompraInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.solicitacaoCompraInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def solicitacaoCompra = new SolicitacaoCompra()
            solicitacaoCompra.validate()
            controller.save(solicitacaoCompra)

        then:"The create view is rendered again with the correct model"
            model.solicitacaoCompraInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            solicitacaoCompra = new SolicitacaoCompra(params)

            controller.save(solicitacaoCompra)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/solicitacaoCompra/show/1'
            controller.flash.message != null
            SolicitacaoCompra.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def solicitacaoCompra = new SolicitacaoCompra(params)
            controller.show(solicitacaoCompra)

        then:"A model is populated containing the domain instance"
            model.solicitacaoCompraInstance == solicitacaoCompra
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def solicitacaoCompra = new SolicitacaoCompra(params)
            controller.edit(solicitacaoCompra)

        then:"A model is populated containing the domain instance"
            model.solicitacaoCompraInstance == solicitacaoCompra
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/solicitacaoCompra/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def solicitacaoCompra = new SolicitacaoCompra()
            solicitacaoCompra.validate()
            controller.update(solicitacaoCompra)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.solicitacaoCompraInstance == solicitacaoCompra

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            solicitacaoCompra = new SolicitacaoCompra(params).save(flush: true)
            controller.update(solicitacaoCompra)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/solicitacaoCompra/show/$solicitacaoCompra.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/solicitacaoCompra/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def solicitacaoCompra = new SolicitacaoCompra(params).save(flush: true)

        then:"It exists"
            SolicitacaoCompra.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(solicitacaoCompra)

        then:"The instance is deleted"
            SolicitacaoCompra.count() == 0
            response.redirectedUrl == '/solicitacaoCompra/index'
            flash.message != null
    }
}

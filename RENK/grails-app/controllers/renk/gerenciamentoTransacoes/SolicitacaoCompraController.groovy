package renk.gerenciamentoTransacoes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SolicitacaoCompraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SolicitacaoCompra.list(params), model:[solicitacaoCompraInstanceCount: SolicitacaoCompra.count()]
    }

    def show(SolicitacaoCompra solicitacaoCompraInstance) {
        respond solicitacaoCompraInstance
    }

    def create() {
        respond new SolicitacaoCompra(params)
    }

    @Transactional
    def save(SolicitacaoCompra solicitacaoCompraInstance) {
        if (solicitacaoCompraInstance == null) {
            notFound()
            return
        }

        if (solicitacaoCompraInstance.hasErrors()) {
            respond solicitacaoCompraInstance.errors, view:'create'
            return
        }

        solicitacaoCompraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitacaoCompraInstance.label', default: 'SolicitacaoCompra'), solicitacaoCompraInstance.id])
                redirect solicitacaoCompraInstance
            }
            '*' { respond solicitacaoCompraInstance, [status: CREATED] }
        }
    }

    def edit(SolicitacaoCompra solicitacaoCompraInstance) {
        respond solicitacaoCompraInstance
    }

    @Transactional
    def update(SolicitacaoCompra solicitacaoCompraInstance) {
        if (solicitacaoCompraInstance == null) {
            notFound()
            return
        }

        if (solicitacaoCompraInstance.hasErrors()) {
            respond solicitacaoCompraInstance.errors, view:'edit'
            return
        }

        solicitacaoCompraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SolicitacaoCompra.label', default: 'SolicitacaoCompra'), solicitacaoCompraInstance.id])
                redirect solicitacaoCompraInstance
            }
            '*'{ respond solicitacaoCompraInstance, [status: OK] }
        }
    }

    @Transactional
    def complete(SolicitacaoCompra solicitacaoCompraInstance) {

        if (solicitacaoCompraInstance == null) {
            notFound()
            return
        }
        
        solicitacaoCompraInstance.setConcluida()
        
        solicitacaoCompraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Solicitacao concluida', args: [message(code: 'SolicitacaoCompra.label', default: 'SolicitacaoCompra'), solicitacaoCompraInstance.id])
                redirect solicitacaoCompraInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def cancel(SolicitacaoCompra solicitacaoCompraInstance) {

        if (solicitacaoCompraInstance == null) {
            notFound()
            return
        }

        solicitacaoCompraInstance.setCancelada()
        
        solicitacaoCompraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Solicitacao cancelada', args: [message(code: 'SolicitacaoCompra.label', default: 'SolicitacaoCompra'), solicitacaoCompraInstance.id])
                redirect solicitacaoCompraInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitacaoCompraInstance.label', default: 'SolicitacaoCompra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

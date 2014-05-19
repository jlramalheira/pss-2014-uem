package renk.gerenciamentoTransacoes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VendaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Venda.list(params), model:[vendaInstanceCount: Venda.count()]
    }

    def show(Venda vendaInstance) {
        respond vendaInstance
    }

    def create() {
        respond new Venda(params)
    }

    @Transactional
    def save(Venda vendaInstance) {
        if (vendaInstance == null) {
            notFound()
            return
        }

        if (vendaInstance.hasErrors()) {
            respond vendaInstance.errors, view:'create'
            return
        }

        vendaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vendaInstance.label', default: 'Venda'), vendaInstance.id])
                redirect vendaInstance
            }
            '*' { respond vendaInstance, [status: CREATED] }
        }
    }

    def edit(Venda vendaInstance) {
        respond vendaInstance
    }

    @Transactional
    def update(Venda vendaInstance) {
        if (vendaInstance == null) {
            notFound()
            return
        }

        if (vendaInstance.hasErrors()) {
            respond vendaInstance.errors, view:'edit'
            return
        }

        vendaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Venda.label', default: 'Venda'), vendaInstance.id])
                redirect vendaInstance
            }
            '*'{ respond vendaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Venda vendaInstance) {

        if (vendaInstance == null) {
            notFound()
            return
        }

        vendaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Venda.label', default: 'Venda'), vendaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    
    @Transactional
    def finalizer(Venda vendaInstance) {

        if (vendaInstance == null) {
            notFound()
            return
        }
        
        vendaInstance.setFinalizada()
        
        vendaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Venda finalizada', args: [message(code: 'compra.label', default: 'compra'), vendaInstance.id])
                redirect vendaInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def cancel(Venda vendaInstance) {

        if (vendaInstance == null) {
            notFound()
            return
        }

        vendaInstance.setCancelada()
        
        vendaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Venda cancelada', args: [message(code: 'compra.label', default: 'compra'), vendaInstance.id])
                redirect vendaInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendaInstance.label', default: 'Venda'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

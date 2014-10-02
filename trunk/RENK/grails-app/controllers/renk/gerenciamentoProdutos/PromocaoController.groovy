package renk.gerenciamentoProdutos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import renk.gerenciamentoProdutos.*;

@Transactional(readOnly = true)
class PromocaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Promocao.list(params), model:[promocaoInstanceCount: Promocao.count()]
    }

    def show(Promocao promocaoInstance) {
        respond promocaoInstance
    }

    def create() {
        respond new Promocao(params)
    }

    @Transactional
    def save(Promocao promocaoInstance) {
        if (promocaoInstance == null) {
            notFound()
            return
        }

        if (promocaoInstance.hasErrors()) {
            respond promocaoInstance.errors, view:'create'
            return
        }

        promocaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'promocaoInstance.label', default: 'Promocao'), promocaoInstance.id])
                redirect promocaoInstance
            }
            '*' { respond promocaoInstance, [status: CREATED] }
        }
    }

    def edit(Promocao promocaoInstance) {
        def produtos = Produto.findAllByAtivo(true)
        respond promocaoInstance, model:[produtos: produtos]
    }

    @Transactional
    def update(Promocao promocaoInstance) {
        if (promocaoInstance == null) {
            notFound()
            return
        }

        if (promocaoInstance.hasErrors()) {
            respond promocaoInstance.errors, view:'edit'
            return
        }

        promocaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Promocao.label', default: 'Promocao'), promocaoInstance.id])
                redirect promocaoInstance
            }
            '*'{ respond promocaoInstance, [status: OK] }
        }
    }

    @Transactional
    def finish(Promocao promocaoInstance) {

        if (promocaoInstance == null) {
            notFound()
            return
        }

        promocaoInstance.finish()
        promocaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Promocao finalizada', args: [message(code: 'Promocao.label', default: 'Promocao'), promocaoInstance.id])
                redirect promocaoInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    def addProduct(Promocao promocaoInstance){
        if (promocaoInstance == null){
            notFound()
            return
        }        
        
        Produto produto = Produto.get(params.produto.id)
        def desconto = 10
        
        promocaoInstance.addProduto(produto,desconto)
        
        promocaoInstance.save flush:true
        
        //TODO ir para o edit com o promocaoInstance por parametro
        redirect(action:"edit", model:[promocaoInstance: promocaoInstance])
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'promocaoInstance.label', default: 'Promocao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

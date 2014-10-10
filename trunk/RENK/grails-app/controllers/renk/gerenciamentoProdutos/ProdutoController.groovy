package renk.gerenciamentoProdutos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProdutoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def c = Produto.createCriteria()
        def results = c.list {
            if (params.codigoBarras){
                like("codigoBarras", "%"+params.codigoBarras+"%")
            }
            if(params.nome){
                like("nome", "%"+params.nome+"%")
            }
            
            if(params.descricao){
                like("descricao", "%"+params.descricao+"%")   
            }
            if(params.status?.equalsIgnoreCase("Ativo")){
                eq("ativo", true)    
            }
            if(params.status?.equalsIgnoreCase("Inativo")){
                eq("ativo",false)    
            }
        }
        
        if(results.size() == 0){
            request.message_info = message(code: 'default.search.notfound.message', default: 'Nada encontrado')
        }
        
        respond results, model:[produtoInstanceCount: Produto.count()]
    }

    def show(Produto produtoInstance) {
        respond produtoInstance
    }

    def create() {
        respond new Produto(params)
    }

    @Transactional
    def save(Produto produtoInstance) {
        if (produtoInstance == null) {
            notFound()
            return
        }

        if (produtoInstance.hasErrors()) {
            respond produtoInstance.errors, view:'create'
            return
        }

        produtoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'produtoInstance.label', default: 'Produto'), produtoInstance.id])
                redirect produtoInstance
            }
            '*' { respond produtoInstance, [status: CREATED] }
        }
    }

    def edit(Produto produtoInstance) {
        respond produtoInstance
    }

    @Transactional
    def update(Produto produtoInstance) {
        if (produtoInstance == null) {
            notFound()
            return
        }

        if (produtoInstance.hasErrors()) {
            respond produtoInstance.errors, view:'edit'
            return
        }

        produtoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Produto.label', default: 'Produto'), produtoInstance.id])
                redirect produtoInstance
            }
            '*'{ respond produtoInstance, [status: OK] }
        }
    }

    @Transactional
    def inactivate(Produto produtoInstance) {

        if (produtoInstance == null) {
            notFound()
            return
        }
        
        produtoInstance.setInativo()
        produtoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'produto.inactivate.message', args: [message(code: 'Produto.label', default: 'Produto'), produtoInstance.id])
                redirect produtoInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def activate(Produto produtoInstance) {

        if (produtoInstance == null) {
            notFound()
            return
        }
        
        produtoInstance.setAtivo()
        produtoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'produto.activate.message', args: [message(code: 'Produto.label', default: 'Produto'), produtoInstance.id])
                redirect produtoInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'produtoInstance.label', default: 'Produto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

package renk.gerenciamentoTransacoes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import renk.gerenciamentoProdutos.Produto

@Transactional(readOnly = true)
class CompraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Compra.list(params), model:[compraInstanceCount: Compra.count()]
    }

    def show(Compra compraInstance) {
        respond compraInstance
    }

    def create() {    
        def compra = new Compra(params)
        def produtos = Produto.findAll()
        respond compra,model:[produtos: produtos]
    }

    @Transactional
    def save(Compra compraInstance) {
        if (compraInstance == null) {
            notFound()
            return
        }

        if (compraInstance.hasErrors()) {
            respond compraInstance.errors, view:'create'
            return
        }

        compraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'compraInstance.label', default: 'Compra'), compraInstance.id])
                redirect(action:"edit", id: compraInstance.id)
            }
            '*' { respond compraInstance, [status: CREATED] }
        }
    }

    def edit(Compra compraInstance) {
        def produtos = Produto.findAllByAtivo(true)
        respond compraInstance,model:[produtos: produtos]
    }

    @Transactional
    def update(Compra compraInstance) {
        if (compraInstance == null) {
            notFound()
            return
        }

        if (compraInstance.hasErrors()) {
            respond compraInstance.errors, view:'edit'
            return
        }

        compraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Compra.label', default: 'Compra'), compraInstance.id])
                redirect compraInstance
            }
            '*'{ respond compraInstance, [status: OK] }
        }
    }
    
    @Transactional
    def addProduct(Compra compraInstance){
        if (compraInstance == null){
            notFound()
            return
        }
        
        Produto produto = Produto.get(params.produto.id)
        int quantidade = Integer.parseInt(params.quantidade)
        
        
        if(!compraInstance.addItemProduto(produto,quantidade)){
            flash.message = message(code: 'compra.erro.item')
        }
        
        compraInstance.save flush:true
        
        redirect(action:"edit", id: compraInstance.id)
    }
    
    @Transactional
    def removeProduct(Compra compraInstance){
        if (compraInstance == null){
            notFound()
            return
        }
        
        ItemCompra item = ItemCompra.findById(params.itemId)
        compraInstance.removeItemProduto(item)
        
        if(item){
            item.delete flush:true
        }
        
        compraInstance.save flush:true
        
        redirect(action:"edit", id: compraInstance.id)
    }

    @Transactional
    def delete(Compra compraInstance) {

        if (compraInstance == null) {
            notFound()
            return
        }

        compraInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Compra.label', default: 'Compra'), compraInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def finalizer(Compra compraInstance) {

        if (compraInstance == null) {
            notFound()
            return
        }
        
        compraInstance.setFinalizada()
        
        compraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Compra finalizada', args: [message(code: 'compra.label', default: 'compra'), compraInstance.id])
                redirect compraInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def cancel(Compra compraInstance) {

        if (compraInstance == null) {
            notFound()
            return
        }

        compraInstance.setCancelada()
        
        compraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Compra cancelada', args: [message(code: 'compra.label', default: 'compra'), compraInstance.id])
                redirect compraInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def receive(Compra compraInstance) {

        if (compraInstance == null) {
            notFound()
            return
        }

        compraInstance.setRecebida()
        
        compraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Compra recebida', args: [message(code: 'compra.label', default: 'compra'), compraInstance.id])
                redirect compraInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'compraInstance.label', default: 'Compra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

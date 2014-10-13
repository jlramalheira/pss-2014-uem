package renk.gerenciamentoTransacoes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import renk.gerenciamentoProdutos.Produto
import renk.gerenciamentoServicos.Servico

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
                redirect(action:"edit", id: vendaInstance.id)
            }
            '*' { respond vendaInstance, [status: CREATED] }
        }
    }

    def edit(Venda vendaInstance) {
        def produtos = Produto.findAllByAtivo(true)
        def servicos = Servico.findAllByAtivo(true)
        respond vendaInstance,model:[produtos: produtos,servicos: servicos]
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
    def addProduct(Venda vendaInstance){
        if (vendaInstance == null){
            notFound()
            return
        }
        
        Produto produto = Produto.get(params.produto.id)
        int quantidade = Integer.parseInt(params.quantidade)
        
        if(quantidade > produto.saldo ){
            flash.message = message(code: 'compra.erro.item.semestoque')
        }else{
            if(!vendaInstance.addItemProduto(produto,quantidade)){
                flash.message = message(code: 'compra.erro.item')
            }
            vendaInstance.save flush:true
        }
        
        redirect(action:"edit", id: vendaInstance.id)
    }
    
    @Transactional
    def removeProduct(Venda vendaInstance){
        if (vendaInstance == null){
            notFound()
            return
        }
        
        ItemVendaProduto item = ItemVendaProduto.findById(params.itemId)
        vendaInstance.removeItemProduto(item)
        
        if(item){
            item.delete flush:true
        }
        
        vendaInstance.save flush:true
        
        redirect(action:"edit", id: vendaInstance.id)
    }
    
    @Transactional
    def addService(Venda vendaInstance){
        if (vendaInstance == null){
            notFound()
            return
        }
        
        Servico servico = Servico.get(params.servico.id)
        int quantidade = Integer.parseInt(params.quantidade)
        
        
        if(!vendaInstance.addItemServico(servico,quantidade)){
            flash.message = message(code: 'compra.erro.item')
        }
        
        vendaInstance.save flush:true
        
        redirect(action:"edit", id: vendaInstance.id)
    }
    
    @Transactional
    def removeService(Venda vendaInstance){
        if (vendaInstance == null){
            notFound()
            return
        }
        
        ItemVendaServico item = ItemVendaServico.findById(params.itemId)
        vendaInstance.removeItemServico(item)
        
        if(item){
            item.delete flush:true
        }
        
        vendaInstance.save flush:true
        
        redirect(action:"edit", id: vendaInstance.id)
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
        
        for(item in vendaInstance.itensProduto){
            Produto p = item.produto
            p.saldo -= item.quantidade
            p.quantidadeVendido += item.quantidade
            p.save()
        }
        
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

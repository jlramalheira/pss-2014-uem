package renk.gerenciamentoTransacoes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import renk.gerenciamentoProdutos.*
import renk.gerenciamentoPessoas.*

@Transactional(readOnly = true)
class SolicitacaoCompraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SolicitacaoCompra.list(params), model:[solicitacaoCompraInstanceCount: SolicitacaoCompra.count()]
    }

    def show(SolicitacaoCompra solicitacaoCompraInstance) {
        def fornecedores = Fornecedor.findAllByAtivo(true)
        respond solicitacaoCompraInstance, model:[fornecedores: fornecedores]
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
                redirect(action:"edit", id: solicitacaoCompraInstance.id)
                //redirect solicitacaoCompraInstance
            }
            '*' { respond solicitacaoCompraInstance, [status: CREATED] }
        }
    }

    def edit(SolicitacaoCompra solicitacaoCompraInstance) {
        def produtos = Produto.findAllByAtivo(true)
        respond solicitacaoCompraInstance, model:[produtos: produtos]
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
        
        Compra compra = solicitacaoCompraInstance.transformeCompra()
        if (compra){
            solicitacaoCompraInstance.setConcluida()
            solicitacaoCompraInstance.save flush:true
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'Solicitacao concluida', args: [message(code: 'SolicitacaoCompra.label', default: 'SolicitacaoCompra'), solicitacaoCompraInstance.id])
                    redirect(controller:"compra",action:"edit", id: compra.id)
                }
            '*'{ render status: NO_CONTENT }
            }
        } else {
            flash.message = message(code: 'Falha ao concluir solicitacao', args: [message(code: 'SolicitacaoCompra.label', default: 'SolicitacaoCompra'), solicitacaoCompraInstance.id])
            redirect(action:"show", id: solicitacaoCompraInstance.id)
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
    
    @Transactional
    def addProduct(SolicitacaoCompra solicitacaoCompraInstance){
        if (solicitacaoCompraInstance == null){
            notFound()
            return
        }
        
        Produto produto = Produto.get(params.produto.id)
        int quantidade = Integer.parseInt(params.quantidade)
        double valor = Double.parseDouble(params.preco)
        
        
        if(solicitacaoCompraInstance.addProduto(produto,quantidade,valor)){
            flash.message = message(code: 'Produto adicionado', args: [message(code: 'solicitacaoCompraInstance.label', default: 'Solicitacao de Compra'), solicitacaoCompraInstance.id])
            solicitacaoCompraInstance.save flush:true
        } else {
            flash.message = message(code: 'Falha ao adicionar produto', args: [message(code: 'solicitacaoCompraInstance.label', default: 'Solicitacao de Compra'), solicitacaoCompraInstance.id])
        }       
        
        redirect(action:"edit", id: solicitacaoCompraInstance.id)
    }
    
    @Transactional
    def removeProduct(SolicitacaoCompra solicitacaoCompraInstance){
        if (solicitacaoCompraInstance == null){
            notFound()
            return
        }        
        
        ItemSolicitacao item = ItemSolicitacao.get(params.itemId)
        
        if (solicitacaoCompraInstance.removeProduto(item)){
            flash.message = message(code: 'Produto removido', args: [message(code: 'solicitacaoCompraInstance.label', default: 'Solicitacao de Compra'), solicitacaoCompraInstance.id])
            solicitacaoCompraInstance.save flush:true
        }else {
            flash.message = message(code: 'Falha ao remover produto', args: [message(code: 'solicitacaoCompraInstance.label', default: 'Solicitacao de Compra'), solicitacaoCompraInstance.id])
        }        
        
        solicitacaoCompraInstance.save flush:true
        
        redirect(action:"edit", id: solicitacaoCompraInstance.id)
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

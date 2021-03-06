package renk.gerenciamentoProdutos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import renk.gerenciamentoProdutos.*;

@Transactional(readOnly = true)
class PromocaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        
        def promocoes = Promocao.list(params)
        if (params.nome != null){
            promocoes = Promocao.findAllByNomeLikeAndDataInicioGreaterThanEqualsAndDataFimLessThanEquals("%"+params.nome+"%",params.dataInicio,params.dataFim)
        }
        if(promocoes.size() == 0){
            request.message_info = message(code: 'default.search.notfound.message', default: 'Nada encontrado')
        }
        respond promocoes, model:[promocaoInstanceCount: Promocao.count()]
    }

    def show(Promocao promocaoInstance) {
        respond promocaoInstance
    }

    def create() {
        respond new Promocao(params)
    }
    
    def help(){
        render view: 'promocaoHelp'
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
                //redirect promocaoInstance
                redirect(action:"edit", id: promocaoInstance.id)
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

        promocaoInstance.restaureAllValuesOfProducts()
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
    
    @Transactional
    def addProduct(Promocao promocaoInstance){
        if (promocaoInstance == null){
            notFound()
            return
        }        
        
        Produto produto = Produto.get(params.produto.id)
        def desconto = Double.parseDouble(params.desconto)
        
        if (promocaoInstance.addProduto(produto,desconto)){
            if (promocaoInstance.checkValues(produto)){
                flash.message = message(code: 'Produto adicionado    ATENÇÃO: Valor do produto abaixo do preco de custo', args: [message(code: 'promocaoInstance.label', default: 'Promocao'), promocaoInstance.id])
            } else {
                flash.message = message(code: 'Produto adicionado', args: [message(code: 'promocaoInstance.label', default: 'Promocao'), promocaoInstance.id])
            }
            promocaoInstance.save flush:true
        } else {
            flash.message = message(code: 'Produto já consta nesta promocao', args: [message(code: 'promocaoInstance.label', default: 'Promocao'), promocaoInstance.id])
        }
        
        
        
        redirect(action:"edit", id: promocaoInstance.id)
    }
    
    @Transactional
    def removeProduct(Promocao promocaoInstance){
        if (promocaoInstance == null){
            notFound()
            return
        }        
        
        ItemPromocao item = ItemPromocao.get(params.itemId)
        
        if (promocaoInstance.removeProduto(item)){
            flash.message = message(code: 'Produto removido', args: [message(code: 'promocaoInstance.label', default: 'Promocao'), promocaoInstance.id])
            promocaoInstance.save flush:true
        }else {
            flash.message = message(code: 'Falha ao remover produto', args: [message(code: 'promocaoInstance.label', default: 'Promocao'), promocaoInstance.id])
        }        
        
        promocaoInstance.save flush:true
        
        redirect(action:"edit", id: promocaoInstance.id)
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

package renk.gerenciamentoRelatorios

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import renk.gerenciamentoProdutos.*;

@Transactional(readOnly = true)
class RelatorioController {
    
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        
    }
    
    @Transactional
    def gerencial(){
        def produtos = null
        if (params.entidade == "Produto"){
            produtos = Produto.executeQuery("select p.nome from Produto p , Venda v where p.nome like \'% %\'")
            
        }
        redirect(action: "index",params: [produtos: produtos])
    }
    
    def operacional(){
        
    }
    
    
}

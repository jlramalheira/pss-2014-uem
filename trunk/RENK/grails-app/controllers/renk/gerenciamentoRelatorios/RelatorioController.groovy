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
        def valores = new ArrayList()
        def dados = new ArrayList()
        if (params.entidade == "Produto"){
            if (params.modelo == "mais-comprado"){
                produtos = Produto.findAll("from Produto p where p.ativo = 1 order by p.quantidadeComprado DESC LIMIT 5",
                    [max: 5, offset: 0])
                for (Produto produto: produtos){
                    dados.add(produto.nome)
                    valores.add(produto.quantidadeComprado)
                }                
            }            
        }
        redirect(action: "index",params: [relatorio: true, dados: dados, valores: valores, texto: "Relatorio de produto mais comprado", titulo: "Grafico de compra de produtos"])
    }
    
    def operacional(){
        
    }
    
    
}

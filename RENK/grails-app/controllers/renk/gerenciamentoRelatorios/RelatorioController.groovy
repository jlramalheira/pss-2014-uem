package renk.gerenciamentoRelatorios

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import renk.gerenciamentoProdutos.*;
import renk.gerenciamentoTransacoes.*;
import renk.gerenciamentoServicos.*;
import java.text.SimpleDateFormat
import java.text.DateFormat

@Transactional(readOnly = true)
class RelatorioController {
    
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        
    }
    
    @Transactional
    def gerencial(){
        Double[] valores = new Double[5]
        String[] dados = new String[5]
        double total = 0
        String texto;
        String titulo;
        if (params.entidade == "Produto"){
            def produtos = null
            if (params.modelo == "mais-comprado"){
                produtos = Produto.findAll("from Produto p where p.ativo = 1 order by p.quantidadeComprado DESC LIMIT 5",
                    [max: 5, offset: 0])
                for (int i = 0; i < produtos.size() ; i++){
                    dados[i] = produtos.get(i).nome
                    valores[i] = produtos.get(i).quantidadeComprado
                    total += valores[i]
                }      
                texto = "Relatório de produto mais comprado"
                titulo = "Grafico de compra"
            } else if (params.modelo == "menos-comprado"){
                produtos = Produto.findAll("from Produto p where p.ativo = 1 order by p.quantidadeComprado ASC LIMIT 5",
                    [max: 5, offset: 0])
                for (int i = 0; i < produtos.size() ; i++){
                    dados[i] = produtos.get(i).nome
                    valores[i] = produtos.get(i).quantidadeComprado
                    total += valores[i]
                }               
                texto = "Relatório de produto menos comprado"
                titulo = "Grafico de compra"
            } else if (params.modelo == "menos-vendido"){
                produtos = Produto.findAll("from Produto p where p.ativo = 1 order by p.quantidadeVendido ASC LIMIT 5",
                    [max: 5, offset: 0])
                for (int i = 0; i < produtos.size() ; i++){
                    dados[i] = produtos.get(i).nome
                    valores[i] = produtos.get(i).quantidadeVendido
                    total += valores[i]
                }      
                texto = "Relatório de produto menos vendido"
                titulo = "Grafico de venda"
            } else if (params.modelo == "mais-vendido"){
                produtos = Produto.findAll("from Produto p where p.ativo = 1 order by p.quantidadeVendido DESC LIMIT 5",
                    [max: 5, offset: 0])
                for (int i = 0; i < produtos.size() ; i++){
                    dados[i] = produtos.get(i).nome
                    valores[i] = produtos.get(i).quantidadeVendido
                    total += valores[i]
                }       
                texto = "Relatório de produto mais vendido"
                titulo = "Grafico de venda"
            }             
        } else if (params.entidade == "Servico"){
            def servicos = null
            if (params.modelo == "mais-realizado"){
                servicos = Servico.findAll("from Servico s where s.ativo = 1 order by s.quantidadeRealizado DESC LIMIT 5",
                    [max: 5, offset: 0])
                for (int i = 0; i < servicos.size() ; i++){
                    dados[i] = servicos.get(i).nome
                    valores[i] = servicos.get(i).quantidadeRealizado
                    total += valores[i]
                }      
                texto = "Relatório de servico mais realizado"
                titulo = "Grafico de servico"
            } else if (params.modelo == "menos-realizado"){
                servicos = Servico.findAll("from Servico s where s.ativo = 1 order by s.quantidadeRealizado ASC LIMIT 5",
                    [max: 5, offset: 0])
                for (int i = 0; i < servicos.size() ; i++){
                    dados[i] = servicos.get(i).nome
                    valores[i] = servicos.get(i).quantidadeRealizado
                    total += valores[i]
                }      
                texto = "Relatório de servico menos realizado"
                titulo = "Grafico de servico"
            }
        }else if (params.entidade == "Venda"){
            def vendas = Venda.findAllByDataTransacaoBetween(params.dataInicio, params.dataFim)
            DateFormat dfp = new SimpleDateFormat("dd/MM/yyyy")
            for (int i = 0; i < vendas.size() ; i++){
                dados[i] = dfp.format(vendas.get(i).dataTransacao)
                valores[i] = vendas.get(i).valorTotal
                total += valores[i]
            }
            texto = "Relatório vendas"
            titulo = "Grafico de vendas"
        }else if (params.entidade == "Compra"){
            def compras = Compra.findAllByDataTransacaoBetween(params.dataInicio, params.dataFim)
            DateFormat dfp = new SimpleDateFormat("dd/MM/yyyy")
            for (int i = 0; i < compras.size() ; i++){
                dados[i] = dfp.format(compras.get(i).dataTransacao)
                valores[i] = compras.get(i).valorTotal
                total += valores[i]
            }
            texto = "Relatório compras"
            titulo = "Grafico de compras"            
        }
        redirect(action: "index",params: [relatorio: true, valores: valores, dados: dados, total: total.round(2), entidade: params.entidade, texto: texto, titulo: titulo])
    }
    
    def operacional(){
        
    }
    
    
}

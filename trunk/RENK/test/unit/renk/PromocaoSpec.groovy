package renk

import grails.test.*
import spock.lang.Specification
import renk.gerenciamentoProdutos.*


class PromocaoSpec extends GrailsUnitTestCase {

    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    void testeConstraints() {
        mockDomain Promocao
        def promocaoFail = new Promocao()
        assertFalse promocaoFail.validate()
        
        def promocaoTrue = new Promocao()
        promocaoTrue.nome = "Mes de aniversario"
        promocaoTrue.dataInicio = new Date()
        promocaoTrue.dataFim = new Date().plus(7)
        assertTrue promocaoTrue.validate()        
    }
    
    void testeFinish() {
        mockDomain Promocao
        
        def promocao = new Promocao()
        promocao.nome = "Mes de aniversario"
        promocao.dataInicio = new Date()
        promocao.dataFim = new Date().plus(7)
        promocao.finish()
        assertTrue promocao.ativa == false        
    }
    
    void testeAddProduto() {
        mockDomain Promocao
        mockDomain Produto
        mockDomain ItemPromocao
        
        def promocao = new Promocao()
        promocao.nome = "Mes de aniversario"
        promocao.dataInicio = new Date()
        promocao.dataFim = new Date().plus(7)
        
        def produto = new Produto(codigoBarras: '7897725632514', nome: 'Monitor AOC 19.5', descricao: 'Monitor full HD', estoqueMinimo: 1, estoqueDesejavel: 3, valorCusto: 350.00, valorVenda: 399.90, valor: 399.90, ativo: true, saldo: 2, quantidadeComprado : 2, quantidadeVendido: 0)
        assertTrue produto.validate()

        //testando que não tem nenhum item na lista
        assertTrue promocao.itens.size() == 0
        
        def desconto = -10
        
        assertFalse promocao.addProduto(produto,desconto)
        
        desconto = 10
        assertTrue promocao.addProduto(produto,desconto)
        assertTrue promocao.itens.size() == 1
        
        assertFalse promocao.addProduto(produto, desconto)
    }
    
    void testeRemoveProduto(){
        mockDomain Promocao
        mockDomain Produto
        mockDomain ItemPromocao
        
        //adicionando um produto
        def promocao = new Promocao()
        promocao.nome = "Mes de aniversario"
        promocao.dataInicio = new Date()
        promocao.dataFim = new Date().plus(7)
        
        def produto = new Produto(codigoBarras: '7897725632514', nome: 'Monitor AOC 19.5', descricao: 'Monitor full HD', estoqueMinimo: 1, estoqueDesejavel: 3, valorCusto: 350.00, valorVenda: 399.90, valor: 399.90, ativo: true, saldo: 2, quantidadeComprado : 2, quantidadeVendido: 0)
        assertTrue produto.validate()

        //testando que não tem nenhum item na lista
        assertTrue promocao.itens.size() == 0
        
        def desconto = -10
        
        assertFalse promocao.addProduto(produto,desconto)
        
        desconto = 10
        assertTrue promocao.addProduto(produto,desconto)
        assertTrue promocao.itens.size() == 1
        
        //pegando o item inserido
        def item = promocao.itens.get(0)
        
        //removendo um cara inserido
        assertTrue promocao.removeProduto(item)
        assertTrue promocao.itens.size() == 0
    }
    
    void testeCheckValues(){
        mockDomain Promocao
        mockDomain Produto
        mockDomain ItemPromocao
        
        //adicionando um produto
        def promocao = new Promocao()
        promocao.nome = "Mes de aniversario"
        promocao.dataInicio = new Date()
        promocao.dataFim = new Date().plus(7)
        
        def produto = new Produto(codigoBarras: '7897725632514', nome: 'Monitor AOC 19.5', descricao: 'Monitor full HD', estoqueMinimo: 1, estoqueDesejavel: 3, valorCusto: 350.00, valorVenda: 399.90, valor: 399.90, ativo: true, saldo: 2, quantidadeComprado : 2, quantidadeVendido: 0)
        assertTrue produto.validate()

        //testando que não tem nenhum item na lista
        assertTrue promocao.itens.size() == 0
        
        def desconto = -10
        
        assertFalse promocao.addProduto(produto,desconto)
        
        desconto = 80
        assertTrue promocao.addProduto(produto,desconto)
        assertTrue promocao.itens.size() == 1
        
        assertTrue promocao.checkValues(produto)
    }
}

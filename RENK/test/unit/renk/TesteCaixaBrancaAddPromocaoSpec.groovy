package renk

import grails.test.*
import spock.lang.Specification
import renk.gerenciamentoProdutos.*

class TesteCaixaBrancaAddPromocaoSpec extends GrailsUnitTestCase {

    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    void testeCaminho1() {
        mockDomain Promocao
        mockDomain Produto
        mockDomain ItemPromocao
        
        def promocao = new Promocao()
        promocao.nome = "Mes de aniversario"
        promocao.dataInicio = new Date()
        promocao.dataFim = new Date().plus(7)
        assertTrue promocao.validate() 
        
        def produto = new Produto(codigoBarras: '7897725632514', nome: 'Monitor AOC 19.5', descricao: 'Monitor full HD', estoqueMinimo: 1, estoqueDesejavel: 3, valorCusto: 350.00, valorVenda: 399.90, valor: 399.90, ativo: true, saldo: 2, quantidadeComprado : 2, quantidadeVendido: 0)
        assertTrue produto.validate()
        
        def desconto = 10
        //no primeiro addProduto não realiza o caminho 1 porque não existe este produto
        assertTrue promocao.addProduto(produto,desconto)
        
        //adicionando o mesmo produto na mesma promoção ela retorna falso por falhar no if da linha 4
        assertFalse promocao.addProduto(produto,desconto)
    }
    
    void testeCaminho3() {
        mockDomain Promocao
        mockDomain Produto
        mockDomain ItemPromocao
        
        def promocao = new Promocao()
        promocao.nome = "Mes de aniversario"
        promocao.dataInicio = new Date()
        promocao.dataFim = new Date().plus(7)
        assertTrue promocao.validate() 
        
        def produto = new Produto(codigoBarras: '7897725632514', nome: 'Monitor AOC 19.5', descricao: 'Monitor full HD', estoqueMinimo: 1, estoqueDesejavel: 3, valorCusto: 350.00, valorVenda: 399.90, valor: 399.90, ativo: true, saldo: 2, quantidadeComprado : 2, quantidadeVendido: 0)
        assertTrue produto.validate()
        
        def desconto = 10
        
        assertTrue promocao.itens.size() == 0
        assertTrue promocao.addProduto(produto,desconto)
        assertTrue promocao.itens.size() == 1
    }
    
    void testeCaminho4() {
        mockDomain Promocao
        mockDomain Produto
        mockDomain ItemPromocao
        
        def promocao = new Promocao()
        promocao.nome = "Mes de aniversario"
        promocao.dataInicio = new Date()
        promocao.dataFim = new Date().plus(7)
        assertTrue promocao.validate() 
        
        def produto = new Produto(codigoBarras: '7897725632514', nome: 'Monitor AOC 19.5', descricao: 'Monitor full HD', estoqueMinimo: 1, estoqueDesejavel: 3, valorCusto: 350.00, valorVenda: 399.90, valor: 399.90, ativo: true, saldo: 2, quantidadeComprado : 2, quantidadeVendido: 0)
        assertTrue produto.validate()
        
        def desconto = -10        
        assertFalse promocao.addProduto(produto,desconto)
        
        desconto = 101
        assertFalse promocao.addProduto(produto,desconto)
    }
}

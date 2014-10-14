package renk

import grails.test.*
import renk.gerenciamentoProdutos.Produto
import renk.gerenciamentoServicos.Servico
import renk.gerenciamentoTransacoes.*
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
class VendaSpec extends GrailsUnitTestCase {
    protected void setUp() {super.setUp()}
 
    protected void tearDown() {super.tearDown()}
    
    void testConstraints() {
        mockDomain Venda
        def venda_fail = new Venda(dataTransacao: new Date(), quantidadeTotal: -1, valorTotal: -4)
        assertFalse venda_fail.validate()
        def venda_ok = new Venda(dataTransacao: new Date(), quantidadeTotal: 1, valorTotal: 0)
        assertTrue venda_ok.validate()
    }
    
    void testAddItemProduto(){
        mockDomain Venda
        mockDomain Produto
        mockDomain ItemVendaProduto
        
        Produto prod = new Produto(codigoBarras: '7897725632514', nome: 'Monitor AOC 19.5', descricao: 'Monitor full HD', estoqueMinimo: 1, estoqueDesejavel: 3, valorCusto: 350.00, valorVenda: 399.90, valor: 399.90, ativo: true, saldo: 2, quantidadeComprado : 2, quantidadeVendido: 0)
        int quantidade_ok = 2;
        Venda venda_ok = new Venda(dataTransacao: new Date())        
        assertTrue venda_ok.addItemProduto(prod,quantidade_ok)
        assertFalse venda_ok.addItemProduto(prod,quantidade_ok)
        
        Venda venda_fail = new Venda(dataTransacao: new Date())
        int quantidade_fail = -2;
        assertFalse venda_fail.addItemProduto(prod,quantidade_fail)
    }
    
    void testRemoveItemProduto(){
        mockDomain Venda
        mockDomain Produto
        mockDomain ItemVendaProduto
        
        Produto produto = new Produto(codigoBarras: '7897725632514', nome: 'Monitor AOC 19.5', descricao: 'Monitor full HD', estoqueMinimo: 1, estoqueDesejavel: 3, valorCusto: 350.00, valorVenda: 399.90, valor: 399.90, ativo: true, saldo: 2, quantidadeComprado : 2, quantidadeVendido: 0)
        int quantidade = 2;
        Venda venda = new Venda(dataTransacao: new Date())
        
        venda.addItemProduto(produto,quantidade)
        ItemVendaProduto item = venda.itensProduto.get(0)
        
        assertTrue venda.removeItemProduto(item)
        assertFalse venda.removeItemProduto(item)
    }
    
    void testAddItemServico(){
        mockDomain Venda
        mockDomain Servico
        mockDomain ItemVendaServico
        
        Servico servico = new Servico(nome: 'Formatar c/ backup', descricao: 'Instalar Linux', hora: 2, minutos: 0, valor: 50.00, quantidadeRealizado: 10)
        int quantidade_ok = 2;
        Venda venda_ok = new Venda(dataTransacao: new Date())        
        assertTrue venda_ok.addItemServico(servico,quantidade_ok)
        assertFalse venda_ok.addItemServico(servico,quantidade_ok)
        
        Venda venda_fail = new Venda(dataTransacao: new Date())
        int quantidade_fail = -2;
        assertFalse venda_fail.addItemServico(servico,quantidade_fail)
    }
    
    void testRemoveItemServico(){
        mockDomain Venda
        mockDomain Servico
        mockDomain ItemVendaServico
        
        Servico servico = new Servico(nome: 'Formatar c/ backup', descricao: 'Instalar Linux', hora: 2, minutos: 0, valor: 50.00, quantidadeRealizado: 10)
        int quantidade = 2;
        Venda venda = new Venda(dataTransacao: new Date())       
        
        venda.addItemServico(servico,quantidade)
        ItemVendaServico item = venda.itensServico.get(0)
        
        assertTrue venda.removeItemServico(item)
        assertFalse venda.removeItemServico(item)
    }
    
    
}

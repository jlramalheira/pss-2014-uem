package renk

import grails.test.*
import renk.gerenciamentoServicos.*
import renk.gerenciamentoTransacoes.*


class TesteCaixaBrancaAddServicoSpec extends GrailsUnitTestCase {

    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    void testeCaminho1() {
        mockDomain Venda
        mockDomain Servico
        mockDomain ItemVendaServico
                
        Venda venda = new Venda(dataTransacao: new Date())
        Servico servico = new Servico(nome: 'Formatar c/ backup', descricao: 'Instalar Linux', hora: 2, minutos: 0, valor: 50.00, quantidadeRealizado: 10)
        int quantidade = 2
               
        assertTrue venda.addItemServico(servico,quantidade)
    }
    
    void testeCaminho2() {
        mockDomain Venda
        mockDomain Servico
        mockDomain ItemVendaServico
                
        Venda venda = new Venda(dataTransacao: new Date())
        Servico servico = new Servico(nome: 'Formatar c/ backup', descricao: 'Instalar Linux', hora: 2, minutos: 0, valor: 50.00, quantidadeRealizado: 10)
        int quantidade1 = 2
        int quantidade2 = 3
               
        assertTrue venda.addItemServico(servico,quantidade1)
        assertFalse venda.addItemServico(servico,quantidade2)
    }
    
    void testeCaminho3() {
        mockDomain Venda
        mockDomain Servico
        mockDomain ItemVendaServico
                
        Venda venda = new Venda(dataTransacao: new Date())
        Servico servico = new Servico(nome: 'Formatar c/ backup', descricao: 'Instalar Linux', hora: 2, minutos: 0, valor: 50.00, quantidadeRealizado: 10)
        int quantidadeok = 2
        int quantidadefail = -2
               
        assertFalse venda.addItemServico(servico,quantidadefail)
        assertTrue venda.addItemServico(servico,quantidadeok)
    }
}


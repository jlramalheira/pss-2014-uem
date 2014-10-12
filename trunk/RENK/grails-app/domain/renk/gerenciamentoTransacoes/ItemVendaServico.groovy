package renk.gerenciamentoTransacoes

import renk.gerenciamentoServicos.Servico

class ItemVendaServico {
    static belongsTo = [Venda,Servico]
    Venda venda
    Servico servico
    int quantidade
    double total
    
    static constraints = {
        quantidade(min:0)
    }
    
    ItemVendaServico(Servico servico, Venda venda, int quantidade){
        this.venda = venda
        this.servico = servico
        this.quantidade = quantidade
        this.total = servico.valor * quantidade
    }
}

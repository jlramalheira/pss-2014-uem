package renk.gerenciamentoTransacoes

import renk.gerenciamentoServicos.Servico

class ItemTransacaoServico {
    static belongsTo = [Transacao,Servico]
    Transacao transacao
    Servico servico
    int quantidade
    double total
    
    static constraints = {
        quantidade(min:0)
    }
    
    ItemTransacaoServico(Servico servico, Transacao transacao, int quantidade){
        this.transacao = transacao
        this.produto = produto
        this.quantidade = quantidade
        this.total = produto.valorCusto * quantidade
    }
}

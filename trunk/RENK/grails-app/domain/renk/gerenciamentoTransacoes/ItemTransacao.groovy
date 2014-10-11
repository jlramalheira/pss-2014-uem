package renk.gerenciamentoTransacoes

import renk.gerenciamentoProdutos.Produto

class ItemTransacao {
    static belongsTo = [Transacao,Produto]
    Transacao transacao
    Produto produto
    int quantidade
    double valor
    double total
    
    static constraints = {
        quantidade(min:0)
    }
    
    ItemTransacao(Produto produto, Transacao transacao, int quantidade, double valor){
        this.transacao = transacao
        this.produto = produto
        this.quantidade = quantidade
        this.valor = valor
        this.total = valor * quantidade
    }
}

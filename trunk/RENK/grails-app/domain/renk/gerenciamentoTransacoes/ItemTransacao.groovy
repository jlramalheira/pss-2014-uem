package renk.gerenciamentoTransacoes

import renk.gerenciamentoProdutos.Produto

class ItemTransacao {
    static belongsTo = [Transacao,Produto]
    Transacao transacao
    Produto produto
    int quantidade
    double total
    
    static constraints = {
        quantidade(min:0)
    }
    
    ItemTransacao(Produto produto, Transacao transacao, int quantidade){
        this.transacao = transacao
        this.produto = produto
        this.quantidade = quantidade
        this.total = produto.valorCusto * quantidade
    }
}

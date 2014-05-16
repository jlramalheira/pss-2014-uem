package renk.gerenciamentoTransacoes

import renk.gerenciamentoProdutos.Produto

class ItemSolicitacao {
    static belongsTo = [SolicitacaoCompra,Produto]
    SolicitacaoCompra solicitacaoCompra
    Produto produto
    int quantidade
    static constraints = {
        quantidade(min: 0)
    }
}

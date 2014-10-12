package renk.gerenciamentoTransacoes

import renk.gerenciamentoProdutos.Produto

class ItemCompra {
    static belongsTo = [Compra,Produto]
    Compra compra
    Produto produto
    int quantidade
    double total
    
    static constraints = {
        quantidade(min:0)
    }
  
    
    ItemCompra(Produto produto, Compra compra, int quantidade){
        this.compra = compra
        this.produto = produto
        this.quantidade = quantidade
        this.total = produto.valorCusto * quantidade
    }
}

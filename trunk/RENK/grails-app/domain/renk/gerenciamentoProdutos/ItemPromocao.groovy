package renk.gerenciamentoProdutos

class ItemPromocao {
    static belongsTo = [Promocao,Produto]
    Promocao promocao
    Produto produto
    double desconto
    double valorOriginal
    
    static constraints = {

    }
    
    double valorComDesconto(){
        return (this.produto.valor).round(2)
    }
}

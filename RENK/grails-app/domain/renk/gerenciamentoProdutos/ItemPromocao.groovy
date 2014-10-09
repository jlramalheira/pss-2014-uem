package renk.gerenciamentoProdutos

class ItemPromocao {
    static belongsTo = [Promocao,Produto]
    Promocao promocao
    Produto produto
    double desconto
    static constraints = {

    }
    
    double valorComDesconto(){
        return (this.produto.valor - this.produto.valor*(this.desconto/100)).round(2)
    }
}

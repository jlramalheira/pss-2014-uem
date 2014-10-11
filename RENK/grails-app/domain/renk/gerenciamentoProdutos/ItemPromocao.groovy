package renk.gerenciamentoProdutos

class ItemPromocao {
    static belongsTo = [Promocao,Produto]
    Promocao promocao
    Produto produto
    double desconto
    
    static constraints = {

    }
}

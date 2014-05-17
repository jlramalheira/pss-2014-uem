package renk.gerenciamentoProdutos

class Produto {
    
    String nome
    String descricao
    int estoqueMinimo
    int estoqueDesejavel
    double valor
    boolean ativo = true
    int saldo
    
    static constraints = {
        nome(blank: false)
        descricao(widget: 'textarea')
        estoqueMinimo(min: 0)
        estoqueDesejavel(min: 0)
        valor(min: 0d, scale: 2)
        ativo(display: false)
        saldo()
    }
    
    void setInativo(){
        ativo = false
    }
    
    void setAtivo(){
        ativo = true
    }
}

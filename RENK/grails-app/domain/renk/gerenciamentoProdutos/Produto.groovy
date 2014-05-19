package renk.gerenciamentoProdutos

class Produto {
    
    String nome
    String descricao
    int estoqueMinimo
    int estoqueDesejavel
    double valor
    boolean ativo = true
    int saldo = 0
    
    static constraints = {
        nome(blank: false)
        descricao(nullable: true,widget: 'textarea')
        estoqueMinimo(min: 0)
        estoqueDesejavel(min: 0)
        valor(min: 0d, scale: 2)
        ativo(display: false)
        saldo(display: false)
    }
    
    void setInativo(){
        ativo = false
    }
    
    void setAtivo(){
        ativo = true
    }
    
    String toString(){
        return nome
    }
}
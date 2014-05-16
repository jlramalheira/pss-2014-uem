package renk.gerenciamentoProdutos

enum Status{
    ATIVO, INATIVO
}

class Produto {
    
    String nome
    String descricao
    int estoqueMinimo
    int estoqueDesejavel
    double valor
    Status status = Status.ATIVO
    
    static int saldo
    
    static constraints = {
        nome(blank: false)
        descricao(widget: 'textarea')
        estoqueMinimo(min: 0)
        estoqueDesejavel(min: 0)
        valor(min: 0d, scale: 2)
        status(display: false)
        saldo(display:false)
    }
    
    void setInativo(){
        this.status = Status.INATIVO
    }
    
    void setInativo(){
        this.status = Status.ATIVO
    }
}

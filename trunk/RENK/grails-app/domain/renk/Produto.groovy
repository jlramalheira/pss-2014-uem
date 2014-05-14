package renk

enum Status{
    ativo, inativo
}

class Produto {
    
    String nome
    String descricao
    int estoqueMinimo
    int estoqueDesejavel
    double valor
    Status status = Status.ativo
    
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
}

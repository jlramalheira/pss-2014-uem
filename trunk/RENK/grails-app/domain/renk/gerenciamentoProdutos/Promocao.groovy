package renk.gerenciamentoProdutos

class Promocao {
    String nome
    Date dataInicio
    Date dataFim

    static constraints = {
        nome(blank: false)
        dataInicio()
        dataFim()
    }
}

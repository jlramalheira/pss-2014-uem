package renk.gerenciamentoProdutos

class Promocao {
    String nome
    Date dataInicio = new Date()
    Date dataFim = new Date()

    static constraints = {
        nome(blank: false)
        dataInicio()
        dataFim()
    }
    
    void finish(){
        dataFim = new Date()
    }
    
    boolean isFinalizada(){
        if (dataFim.getDate() > new Date().getDate()){
            return true
        }
        return false
    }
}

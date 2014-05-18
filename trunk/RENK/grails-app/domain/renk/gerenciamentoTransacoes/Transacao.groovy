package renk.gerenciamentoTransacoes

abstract class Transacao {
    Date dataTransacao = new Date()
    int quantidadeTotal = 0
    double valorTotal = 0
    
    static constraints = {
        dataTransacao()
        quantidadeTotal(editable: false)
        valorTotal(editable: false)
    }
    
    private void solicitarCompra(){
        
    }
    
    void cancelar(){
        
    }    
}

package renk.gerenciamentoTransacoes

enum Status{
    CONCLUIDA, ANDAMENTO, CANCELADA
}
abstract class Transacao {
    Date dataTransacao = new Date()
    int quantidadeTotal
    double valorTotal
    Status status = Status.ANDAMENTO
    
    static constraints = {
        dataTransacao(display: false)
        quantidadeTotal(editable: false)
        valorTotal(editable: false)
        status(display: false)
    }
    
    void solicitarCompra(){
        
    }
    
    void cancelar(){
        
    }
    
}

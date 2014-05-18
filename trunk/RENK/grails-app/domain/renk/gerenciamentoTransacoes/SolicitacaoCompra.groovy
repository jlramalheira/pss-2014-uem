package renk.gerenciamentoTransacoes

class SolicitacaoCompra {
    enum Status{
        EM_ABERTO, CANCELADA, CONCLUIDA
    }
    
    Date dataSolicitacao = new Date()
    Status status = Status.EM_ABERTO
    

    static constraints = {
        dataSolicitacao(nullable: true)
        status(nullable: true)
    }
    
    String getStatusStr(){
        if (status == Status.EM_ABERTO){
            return "Em Aberto"
        } else if (status == Status.CANCELADA){
            return "Cancelada"
        } else {
            return "Concluida"
        }
    }
    
    boolean isEmAberto(){
        if (status == Status.EM_ABERTO){
            return true
        }
    }
    
    boolean isCancelada(){
        if (status == Status.CANCELADA){
            return true
        }
    }
    
    boolean isConcluida(){
        if (status == Status.CONCLUIDA){
            return true
        }
    }
    
    void setConcluida(){
        status = Status.CONCLUIDA
    }
    
    void setCancelada(){
        status = Status.CANCELADA
    }
}

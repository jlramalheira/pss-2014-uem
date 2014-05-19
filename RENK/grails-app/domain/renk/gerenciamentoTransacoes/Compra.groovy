package renk.gerenciamentoTransacoes

class Compra extends Transacao{
    enum Status{
        EM_ABERTO, FINALIZADA, RECEBIDA, CANCELADA
    }
    Status status = Status.EM_ABERTO

    static constraints = {
    }
    
    String getStatusStr(){
        if (status == Status.EM_ABERTO){
            return "Em Aberto"
        } else if (status == Status.FINALIZADA){
            return "Finalizada"
        } else if (status == Status.RECEBIDA){
            return "Recebida"
        } else {
            return "Cancelada"
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
    
    boolean isFinalizada(){
        if (status == Status.FINALIZADA){
            return true
        }
    }
    
    boolean isRecebida(){
        if (status == Status.RECEBIDA){
            return true
        }
    }
    
    void setEmAberto(){
        status = Status.EM_ABERTO
    }
    
    void setCancelada(){
        status = Status.CANCELADA
    }
    
    void setFinalizada(){
        status = Status.FINALIZADA
    }
    
    void setRecebida(){
        status = Status.RECEBIDA
    }
}

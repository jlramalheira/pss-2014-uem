package renk.gerenciamentoTransacoes

class Compra extends Transacao{
    enum Status{
        ABERTA, FINALIZADA, RECEBIDA, CANCELADA
    }
    Status status = Status.ABERTA

    static constraints = {
    }
    
    void setAberta(){
        this.status = Status.ABERTA
    }
}

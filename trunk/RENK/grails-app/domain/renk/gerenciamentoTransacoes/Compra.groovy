package renk.gerenciamentoTransacoes

enum Status{
    ABERTA, FINALIZADA, RECEBIDA, CANCELADA
}

class Compra extends Transacao{
    
    Status status

    static constraints = {
    }
}

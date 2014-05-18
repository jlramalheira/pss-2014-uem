package renk.gerenciamentoTransacoes

class Compra extends Transacao{
    enum Status{
        ABERTA, FINALIZADA, RECEBIDA, CANCELADA
    }
    Status status

    static constraints = {
    }
}

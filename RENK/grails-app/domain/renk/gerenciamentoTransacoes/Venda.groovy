package renk.gerenciamentoTransacoes


class Venda extends Transacao{
    enum Status{
        ABERTA, CANCELADA, FINALIZADA
    }
    
    Status status

    static constraints = {
    }
}

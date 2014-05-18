package renk.gerenciamentoTransacoes


class Venda extends Transacao{
    enum Status{
        ABERTA, CANCELADA, FINALIZADA
    }
    
    StatusVenda status

    static constraints = {
    }
}

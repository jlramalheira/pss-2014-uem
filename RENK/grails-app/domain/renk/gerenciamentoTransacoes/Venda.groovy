package renk.gerenciamentoTransacoes

enum Status{
    ABERTA, CANCELADA, FINALIZADA
}

class Venda extends Transacao{
    
    Status status

    static constraints = {
    }
}

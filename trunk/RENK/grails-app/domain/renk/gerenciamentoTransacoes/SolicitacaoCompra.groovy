package renk.gerenciamentoTransacoes

class SolicitacaoCompra {
    enum Status{
        EM_ABERTO, CANCELADA, CONCLUIDA
    }
    Date dataSolicitacao
    Status status = Status.EM_ABERTO
    

    static constraints = {
        dataSolicitacao()
        status()
    }
}

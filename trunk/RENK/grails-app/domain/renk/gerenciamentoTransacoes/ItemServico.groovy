package renk.gerenciamentoTransacoes

import renk.gerenciamentoServicos.Servico

class ItemServico {
    static belongsTo = [Servico,Venda]
    Servico servico
    Venda venda
    int quantidade
    
    static constraints = {
        quantidade(min: 0)
    }
}

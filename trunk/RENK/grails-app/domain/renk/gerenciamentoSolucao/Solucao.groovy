package renk.gerenciamentoSolucao

import renk.gerenciamentoServicos.OrdemServico

class Solucao {
    String descricao
    OrdemServico ordemServico
    
    static constraints = {
        descricao(widget: 'textarea')
    }
}

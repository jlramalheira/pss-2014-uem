package renk.gerenciamentoSolucao

import renk.gerenciamentoServicos.OrdemServico

class Solucao {
    String descricao
    OrdemServico ordemSevico
    
    static constraints = {
        descricao(format: 'textarea')
        ordemServico(display: false)
    }
}

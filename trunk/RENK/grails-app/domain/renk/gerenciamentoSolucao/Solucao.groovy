package renk.gerenciamentoSolucao

import renk.gerenciamentoServicos.OrdemServico

class Solucao {
    OrdemServico ordemServico
    String descricao
    
    static constraints = {
        ordemServico(nullable: true, blank: true)
        descricao(widget: 'textarea')
    }
    
    void setOrdemServico(OrdemServico os){
        ordemServico = os
    }
}

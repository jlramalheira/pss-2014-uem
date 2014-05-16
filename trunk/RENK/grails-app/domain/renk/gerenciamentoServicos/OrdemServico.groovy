package renk.gerenciamentoServicos

class OrdemServico {
    Date dataEmissao
    Date dataPrevisao
    Date dataConclusao
    Servico servico
    
    static constraints = {
        servico()
        dataEmissao(display: false)
        dataPrevisao(editable: false)
        dataConclusao(display: false)
    }
    
    def escalonarTecnico(){
        
    }
}

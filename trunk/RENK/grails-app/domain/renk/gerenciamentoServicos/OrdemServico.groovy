package renk.gerenciamentoServicos

import renk.gerenciamentoAutenticacao.Funcionario
class OrdemServico {
    Funcionario funcionario
    Date dataEmissao = new Date()
    Date dataPrevisao
    Date dataConclusao
    Servico servico
    boolean cancelada = false
    
    static constraints = {
        funcionario(nullable: true)
        servico()
        dataEmissao()
        dataPrevisao(nullable: true, display: false)
        dataConclusao(nullable: true, display: false)
    }
    
    void escalonarTecnico(){
        
    }
    
    void concluir(){
        dataConclusao = new Date()
    }
    
    void cancelar(){
        cancelada = true
    }
    
    boolean isConcluida(){
        if (dataConclusao != null){
            return true
        }
        return false
    }
    
    boolean isAtrasada(){
        //pog
        Date dia = new Date()
        dia.setHours(0)
        dia.setMinutes(0)
        dia.setSeconds(0)
        int valor1 = (int) dataPrevisao.getTime() / 1000
        int valor2 = (int) dia.getTime() / 1000
        if (valor1 < valor2){
            return true
        }
        return false
    }
    
    String toString(){
        return this.id + " - Servico: " + this.servico?.nome
    }
}

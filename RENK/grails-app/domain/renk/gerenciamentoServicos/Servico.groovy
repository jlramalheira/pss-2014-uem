package renk.gerenciamentoServicos

import groovy.time.Duration


class Servico {
        String nome
        String descricao
        int hora
        int minutos
        double valor
        boolean ativo = true
        
    static constraints = {
        nome(blank: false)
        descricao(widget: 'textarea')
        hora(min: 0)
        minutos(min: 0)
        ativo(display:false)
    }
    
    void setAtivar(){
        ativo = true
    }
    
    void setInativar(){
        ativo = false
    }
    
    boolean isAtivo(){
        return ativo
    }
}
package renk.gerenciamentoServicos

import groovy.time.Duration

enum Status {
    ATIVO, INATIVO
}

class Servico {
        String nome
        String descricao
        int hora
        int minutos
        double valor
        Status status = Status.ATIVO
        
    static constraints = {
        nome(blank: false)
        descricao(widget: 'textarea')
        hora(min: 0)
        minutos(min: 0)
        status(display:false)
    }
}

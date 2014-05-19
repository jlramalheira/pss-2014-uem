package renk.gerenciamentoPessoas

class Endereco {
    enum TipoEndereco {
        RESIDENCIAL,
        COMERCIAL,
        ENTREGA,
        COBRANCA,
        FERIAS
    }
    static belongsTo = [Cidade, Pessoa]
    String logradouro
    String numero
    String complemento
    String bairro
    String cep
    Cidade cidade
    Pessoa pessoa
    TipoEndereco tipo = TipoEndereco.RESIDENCIAL
    static constraints = {
        tipo()
        logradouro()
        numero(maxSize: 10)
        complemento(nullable: true, blank: true)
        bairro()        
        cep()
        pessoa(nullable: true, display: false)
    }
    
    String toString(){
        if (!complemento) { complemento = "" } else { complemento += ',' }
        "${logradouro}, ${numero}, ${complemento} ${bairro} - \n ${cep}, ${cidade}"
    }
    
}

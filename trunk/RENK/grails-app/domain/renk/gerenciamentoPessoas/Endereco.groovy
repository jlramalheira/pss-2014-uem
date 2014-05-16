package renk.gerenciamentoPessoas
enum TipoEndereco {
    RESIDENCIAL,
    COMERCIAL,
    ENTREGA,
    COBRANCA,
    FERIAS
}
class Endereco {
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
        pessoa(nullable: true)
    }
}

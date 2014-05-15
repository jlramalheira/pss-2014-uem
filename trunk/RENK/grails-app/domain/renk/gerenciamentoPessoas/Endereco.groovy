package renk.gerenciamentoPessoas

class Endereco {
    static belongsTo = [cidade: Cidade]
    String logradouro
    String numero
    String complemento
    String bairro
    String cep
    String tipo
    static constraints = {
        tipo(nullable: true, blank: true)
        logradouro()
        numero(maxSize: 10)
        complemento(nullable: true, blank: true)
        bairro()        
        cep()
    }
}

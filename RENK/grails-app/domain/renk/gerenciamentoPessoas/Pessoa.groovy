package renk.gerenciamentoPessoas

abstract class Pessoa {
    
    static hasMany = [enderecos: Endereco]
    
    TipoPessoa tipoPessoa        
    String nome
    String email
    String telefone
    String celular
    
    
    static constraints = {
        tipoPessoa()
        nome()
        email()
        telefone()
        celular()    
        enderecos()
    }
}
package renk.gerenciamentoPessoas
enum Status {
    ATIVA, 
    INATIVA
}
abstract class Pessoa {
    
    static hasMany = [enderecos: Endereco]
    
    TipoPessoa tipoPessoa        
    String nome
    String email
    String telefone
    String celular
    Status status = Status.ATIVA
    
    static constraints = {
        tipoPessoa()
        nome(blank: false)
        email(email: true)
        telefone(maxSize: 15)
        celular(maxSize: 15)
        enderecos()
        status(display: false)
    }
    
    void setInativa() {
        this.status = Status.INATIVA
    }
    
    void setAtiva() {
        this.status = Status.ATIVA
    }
}
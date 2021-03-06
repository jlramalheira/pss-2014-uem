package renk.gerenciamentoPessoas
import java.util.ArrayList
import java.util.List
class Pessoa {
    
    static hasMany = [enderecos: Endereco]
    List<Endereco> enderecos = new ArrayList<Endereco>()
    String nome
    String email
    String telefone
    String celular
    boolean ativo = true
    
    static constraints = {
        nome(blank: false, minSize: 3)
        email(nullable:true, email: true)
        telefone(nullable:true, maxSize: 15)
        celular(maxSize: 15, blank: true)
        enderecos()
        ativo(display: false)
    }
    
    void setInativa() {
        this.ativo = false
    }
    
    void setAtiva() {
        this.ativo = true
    }
}
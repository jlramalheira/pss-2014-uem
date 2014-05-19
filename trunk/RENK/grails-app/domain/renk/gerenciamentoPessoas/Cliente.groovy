package renk.gerenciamentoPessoas


class Cliente extends Pessoa {
    
    TipoPessoa tipoPessoa
    
    static constraints = {
        tipoPessoa(bindable: false)
    }
    
    String toString(){
        "${nome}"
    }
}

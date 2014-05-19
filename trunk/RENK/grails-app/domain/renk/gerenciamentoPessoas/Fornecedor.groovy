package renk.gerenciamentoPessoas


class Fornecedor extends Pessoa {
    
    PessoaJuridica pessoaJuridica

    static constraints = {
        pessoaJuridica(display:false)
    }
    
    String toString(){
        "${nome}"
    }
}

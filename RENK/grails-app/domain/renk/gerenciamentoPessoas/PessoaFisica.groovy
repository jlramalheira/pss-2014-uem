package renk.gerenciamentoPessoas


class PessoaFisica extends TipoPessoa {
    String cpf
    static constraints = {
        cpf(blank:false, minSize:11, maxSize:11)
    }
        
    String toString() {
        "Pessoa Física"
    }
}


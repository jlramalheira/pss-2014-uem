package renk.gerenciamentoPessoas


class PessoaJuridica extends TipoPessoa {
    String cnpj
    String inscricaoEstadual
    static constraints = {
        cnpj(blank: false, minSize: 14, maxSize:14)
        inscricaoEstadual(nullable: true, blank: false, maxSize:15)
    }
    String toString() {
        "Pessoa Jurídica"
    }
}


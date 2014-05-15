package renk.gerenciamentoPessoas


class PessoaFisica extends TipoPessoa {
	String cpf
        static constraints = {
            cpf()
        }
}


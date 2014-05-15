package renk.gerenciamentoPessoas

class UnidadeFederativa {
    static belongsTo = [pais: Pais]
    String nome
    String sigla
    static constraints = {
        pais()
        nome()
        sigla()
    }
}

package renk.gerenciamentoPessoas

class Cidade {
    static belongsTo = [uf: UnidadeFederativa]
    String nome
    static constraints = {
        uf()
        nome()
    }
}

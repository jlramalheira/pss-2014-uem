package renk.gerenciamentoPessoas

class UnidadeFederativa {
    static belongsTo = [Pais]
    String nome
    String sigla
    Pais pais
    static constraints = {
        pais()
        nome()
        sigla()
    }
    
    String toString() {
        "${sigla}"
    }
}

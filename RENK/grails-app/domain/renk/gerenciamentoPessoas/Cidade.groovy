package renk.gerenciamentoPessoas

class Cidade {
    static belongsTo = [UnidadeFederativa]
    String nome
    UnidadeFederativa uf
    static constraints = {
        uf()
        nome()
    }
    
    String toString() {
        "${nome}"
    }
}

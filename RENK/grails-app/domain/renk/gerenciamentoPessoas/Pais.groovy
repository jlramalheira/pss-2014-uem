package renk.gerenciamentoPessoas

class Pais {    
    String nome
    String sigla
    static constraints = {
        nome()
        sigla()
    }
    String toString() {
        "${nome} - ${sigla}"
    }
}

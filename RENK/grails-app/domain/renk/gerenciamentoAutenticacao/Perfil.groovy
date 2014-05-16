package renk.gerenciamentoAutenticacao

class Perfil {
    String nome
    static constraints = {
        nome(blank: false)
    }
}

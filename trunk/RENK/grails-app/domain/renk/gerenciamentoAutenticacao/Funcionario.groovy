package renk.gerenciamentoAutenticacao

class Funcionario {

    String nome
    Perfil perfil
    
    static constraints = {
        nome(display: false)
        perfil()
    }
}

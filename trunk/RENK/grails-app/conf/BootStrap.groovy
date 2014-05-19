
import renk.gerenciamentoPessoas.Cidade
import renk.gerenciamentoPessoas.Pais
import renk.gerenciamentoPessoas.UnidadeFederativa
import renk.gerenciamentoServicos.Servico
import renk.gerenciamentoAutenticacao.Funcionario

class BootStrap {

    def init = { servletContext ->
        Pais p = new Pais(nome: 'Brasil', sigla: 'BRA')
        p.save()
        UnidadeFederativa uf = new UnidadeFederativa(nome: 'Paraná', sigla: 'PR', pais: p)
        uf.save()
        Cidade c = new Cidade(nome: 'Maringá', uf: uf)
        c.save()
        Servico s = new Servico(nome: 'Formatar', descricao: 'Insalar Linux', hora: 2, minutos: 0, valor: 50.00)
        s.save()
        Funcionario f = new Funcionario(nome: 'Pedremildo')
        f.save()
        Funcionario f2 = new Funcionario(nome: 'Maria Verde')
        f2.save()
        
    }
    def destroy = {
    }
}

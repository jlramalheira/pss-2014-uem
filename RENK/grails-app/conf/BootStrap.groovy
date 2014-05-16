
import renk.gerenciamentoPessoas.Cidade
import renk.gerenciamentoPessoas.Pais
import renk.gerenciamentoPessoas.UnidadeFederativa

class BootStrap {

    def init = { servletContext ->
        Pais p = new Pais(nome: 'Brasil', sigla: 'BRA')
        p.save()
        UnidadeFederativa uf = new UnidadeFederativa(nome: 'Paraná', sigla: 'PR', pais: p)
        uf.save()
        Cidade c = new Cidade(nome: 'Maringá', uf: uf)
        c.save()
        
    }
    def destroy = {
    }
}

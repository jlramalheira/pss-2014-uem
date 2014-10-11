
import renk.gerenciamentoPessoas.*
import renk.gerenciamentoServicos.Servico
import renk.gerenciamentoAutenticacao.Funcionario
import renk.gerenciamentoProdutos.Produto

class BootStrap {

    def init = { servletContext ->
        Pais p = new Pais(nome: 'Brasil', sigla: 'BRA')
        p.save()
        
        UnidadeFederativa uf = new UnidadeFederativa(nome: 'Paraná', sigla: 'PR', pais: p)
        uf.save()
        UnidadeFederativa uf1 = new UnidadeFederativa(nome: 'São Paulo', sigla: 'SP', pais: p)
        uf1.save()
        UnidadeFederativa uf2 = new UnidadeFederativa(nome: 'Santa Catarina', sigla: 'SC', pais: p)
        uf2.save()
        UnidadeFederativa uf3 = new UnidadeFederativa(nome: 'Rio Grande do Sul', sigla: 'RS', pais: p)
        uf3.save()
        
        Cidade c = new Cidade(nome: 'Maringá', uf: uf)
        c.save()
        Cidade c1 = new Cidade(nome: 'Campo Mourão', uf: uf)
        c1.save()
        Cidade c2 = new Cidade(nome: 'São Paulo', uf: uf1)
        c2.save()
        Cidade c3 = new Cidade(nome: 'Florianopolis', uf: uf2)
        c3.save()
        Cidade c4 = new Cidade(nome: 'Porto Alegre', uf: uf3)
        c4.save()
        
        Servico s = new Servico(nome: 'Formatar c/ backup', descricao: 'Instalar Linux', hora: 2, minutos: 0, valor: 50.00)
        s.save()
        Servico s1 = new Servico(nome: 'Recarrega Preta', descricao: 'Recarregar cartucho HP Preto', hora: 0, minutos: 20, valor: 15.00)
        s1.save()
        Servico s2 = new Servico(nome: 'Recarrega Color', descricao: 'Recarregar cartucho HP Colorido', hora: 0, minutos: 30, valor: 20.00)
        s2.save()
        Servico s3 = new Servico(nome: 'Formatar s/ backup', descricao: 'Instalar Linux', hora: 1, minutos: 30, valor: 40.00)
        s3.save()
        Servico s4 = new Servico(nome: 'Limpeza Cooler', descricao: 'Limpar e lubrificar', hora: 0, minutos: 30, valor: 20.00, ativo: false)
        s4.save()
        
        Funcionario f = new Funcionario(nome: 'Pedremildo')
        f.save()
        Funcionario f2 = new Funcionario(nome: 'Maria Verde')
        f2.save()
        
        Produto prod = new Produto(codigoBarras: '7897725632514', nome: 'Monitor AOC 19.5', descricao: 'Monitor full HD', estoqueMinimo: 1, estoqueDesejavel: 3, valorCusto: 350.00, valorVenda: 399.90, valor: 399.90, ativo: true, saldo: 2)
        prod.save()
        Produto prod1 = new Produto(codigoBarras: '7897725632615', nome: 'Mouse s/ fio', descricao: 'Mouse 1600DPI', estoqueMinimo: 3, estoqueDesejavel: 5,valorCusto: 40.00,  valorVenda: 59.90, valor: 59.90, ativo: true, saldo: 4)
        prod1.save()
        Produto prod2 = new Produto(codigoBarras: '7897725965874', nome: 'Teclado Satellite', descricao: 'Normas ABNT-2', estoqueMinimo: 2, estoqueDesejavel: 4, valorCusto: 25.00, valorVenda: 49.90, valor: 49.90, ativo: true, saldo: 2)
        prod2.save()
        Produto prod3 = new Produto(codigoBarras: '7897725632523', nome: 'Cartucho HP60 Preto', descricao: 'Compativel', estoqueMinimo: 4, estoqueDesejavel: 7, valorCusto: 19.90, valorVenda: 39.90, valor: 39.90, ativo: true, saldo: 7)
        prod3.save()
        Produto prod4 = new Produto(codigoBarras: '7897777885566', nome: 'Extensor USB', descricao: '', estoqueMinimo: 1, estoqueDesejavel: 2, valorCusto: 9.90, valorVenda: 19.90, valor: 19.90 , ativo: false, saldo: 0)
        prod4.save()
        
        
        
    }
    def destroy = {
    }
}
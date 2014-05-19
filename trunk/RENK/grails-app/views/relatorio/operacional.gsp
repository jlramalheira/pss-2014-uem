<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Relatórios Operacionais</title>
    </head>
    <body>
        <g:render template="nav-main"/>
        <div class="container-fluid">
            <div class="row">
                <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <g:render template="nav-sub"/>
                </nav>
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <h1>Relatório Operacional</h1>
                    <form class="well well-lg">
                        <div class="row">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <h4>Conceito</h4>                                
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" checked=""/>
                                        Produto
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto"/>
                                        Vendas
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto"/>
                                        Compras
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" />
                                        Promoção
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" />
                                        Serviço
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" />
                                        Ordem de Serviço
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" />
                                        Soluções
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" />
                                        Cliente
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" />
                                        Fornecedor
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label for="data-inicio">De</label>
                                    <input type="date" class="form-control" id="data-inicio">
                                </div>
                                <div class="form-group">
                                    <label for="data-inicio">Até</label>
                                    <input type="date" class="form-control" id="data-inicio">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                <h4>Filtros de Pesquisa de Produto</h4>
                                <g:render template="/produto/form" />
                            </div>
                        </div>

                        <button class="btn btn-lg btn-primary">
                            Gerar Relatório
                        </button>
                    </form>


                    <h2>Relatório de Produtos</h2>
                    <table class="table table-hover table-striped table-responsive">
                        <thead>
                            <tr>
                                <th>Produto</th>
                                <th>Estoque mínimo</th>
                                <th>Saldo atual</th>
                                <th>Valor</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <a href="#">Produto Exemplo 1</a>
                                </td>
                                <td>
                                    10
                                </td>
                                <td>
                                    59
                                </td>
                                <td>
                                    R$ 15,50
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">Produto Exemplo 2</a>
                                </td>
                                <td>
                                    100
                                </td>
                                <td>
                                    568
                                </td>
                                <td>
                                    R$ 35,00
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">Produto Exemplo 3</a>
                                </td>
                                <td>
                                    5
                                </td>
                                <td>
                                    3
                                </td>
                                <td>
                                    R$ 17,50
                                </td>
                            </tr>
                        </tbody>
                    </table>


                    <div class="text-center">
                        <button type="button" class="btn btn-default btn-lg">
                            Carregar mais resultados
                        </button>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

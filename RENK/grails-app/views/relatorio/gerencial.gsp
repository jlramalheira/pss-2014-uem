<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Relatórios Gerenciais</title>

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">

            // Load the Visualization API and the piechart package.
            google.load('visualization', '1.0', {'packages':['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Produto');
            data.addColumn('number', 'Vendas');
            data.addRows([
            ['Produto Exemplo 1', 874],
            ['Produto Exemplo 2', 568],
            ['Produto Exemplo 3', 314],
            ['Outros', 651]
            ]);

            // Set chart options
            var options = {
                'title':'Gráfico de vendas de produtos'  
                };

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <g:render template="nav-main"/>
        <div class="container-fluid">
            <div class="row">
                <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <g:render template="nav-sub"/>
                </nav>
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <h1>Relatório Gerencial</h1>
                    <form class="well well-lg">
                        <div class="row">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <h4>Período de Análise</h4>
                                <div class="form-group">
                                    <label for="data-inicio">De</label>
                                    <input type="date" class="form-control" id="data-inicio">
                                </div>
                                <div class="form-group">
                                    <label for="data-inicio">Até</label>
                                    <input type="date" class="form-control" id="data-inicio">
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <h4>Entidade</h4>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" checked=""/>
                                        Produto
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
                                        Cliente
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" />
                                        Funcionário
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" />
                                        Receitas
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="entidade" value="Produto" />
                                        Despesas
                                    </label>
                                </div> 
                            </div>

                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <h4>Modelo</h4>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="modelo" value="Produto" />
                                        Mais vendido
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="modelo" value="Produto" />
                                        Menos vendido
                                    </label>
                                </div> 
                            </div>
                        </div>

                        <button class="btn btn-lg btn-primary">
                            Gerar Relatório
                        </button>
                    </form>


                    <h2>Relatório de produto mais vendido</h2>
                    <section class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div id="chart_div"></div>
                        </div>                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <table class="table table-hover table-striped table-responsive">
                                <thead>
                                    <tr>
                                        <th>Produto</th>
                                        <th>Preço</th>
                                        <th>Vendas</th>
                                        <th>Bruto</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <a href="#">Produto Exemplo 1</a>
                                        </td>
                                        <td>
                                            R$ 25,00
                                        </td>
                                        <td>
                                            874
                                        </td>
                                        <td>
                                            R$ 21.850,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#">Produto Exemplo 2</a>
                                        </td>
                                        <td>
                                            R$ 35,00
                                        </td>
                                        <td>
                                            568
                                        </td>
                                        <td>
                                            R$ 19.880,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#">Produto Exemplo 3</a>
                                        </td>
                                        <td>
                                            R$ 17,50
                                        </td>
                                        <td>
                                            314
                                        </td>
                                        <td>
                                            R$ 5.495,00
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="3">
                                            Total
                                        </th>
                                        <th>
                                            R$ 47.225,00
                                        </th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                    </section>


                </section>
            </div>
        </div>
    </body>
</html>

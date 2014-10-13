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
                  ['1', 1]
        ]);

        // Set chart options
        var options = {
            'title':'${params.titulo}'  
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
        <form class="well well-lg" action="gerencial" method="GET">
          <div class="row">
            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <h4>Período de Análise</h4>
              <div class="form-group">
                <label for="data-inicio">De</label>
                <input type="date" class="form-control" id="data-inicio">
              </div>
              <div class="form-group">
                <label for="data-fim">Até</label>
                <input type="date" class="form-control" id="data-fim">
              </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <h4>Entidade</h4>
              <div class="radio">
                <label>
                  <input type="radio" name="entidade" value="Produto"/>
                  Produto
                </label>
              </div>
              <div class="radio">
                <label>
                  <input type="radio" name="entidade" value="Servico" />
                  Serviço
                </label>
              </div>
              <div class="radio">
                <label>
                  <input type="radio" name="entidade" value="Cliente" />
                  Cliente
                </label>
              </div>
              <div class="radio">
                <label>
                  <input type="radio" name="entidade" value="Receitas" />
                  Receitas
                </label>
              </div>
              <div class="radio">
                <label>
                  <input type="radio" name="entidade" value="Despesas" />
                  Despesas
                </label>
              </div> 
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <h4>Modelo</h4>
              <div class="radio">
                <label>
                  <input type="radio" name="modelo" value="mais-vendido" />
                  Mais vendido
                </label>
              </div>
              <div class="radio">
                <label>
                  <input type="radio" name="modelo" value="menos-vendido" />
                  Menos vendido
                </label>
              </div>
              <div class="radio">
                <label>
                  <input type="radio" name="modelo" value="mais-comprado" />
                  Mais comprado
                </label>
              </div> 
              <div class="radio">
                <label>
                  <input type="radio" name="modelo" value="menos-comprado" />
                  Menos comprado
                </label>
              </div> 
            </div>
          </div>

          <button class="btn btn-lg btn-primary" type="submit">
            Gerar Relatório
          </button>
        </form>

        <g:if test="${params.relatorio}">

          <h2>Relatório ${params.texto}</h2>
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
                      25,00
                    </td>
                    <td>
                      874
                    </td>
                    <td>
                      21.850,00
                    </td>
                  </tr>

                </tbody>
                <tfoot>
                  <tr>
                    <th colspan="3">
                      Total
                    </th>
                    <th>
                      47.225,00
                    </th>
                  </tr>
                </tfoot>
              </table>
            </div>
          </section>


      </section>
      </g:if>
    </div>
  </div>
</body>
</html>

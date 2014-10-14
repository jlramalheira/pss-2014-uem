
<%@ page import="renk.gerenciamentoProdutos.Promocao" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'promocao.label', default: 'Promocao')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-cliente" class="sr-only">
  <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>
<nav class="navbar navbar-inverse" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-navigation">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${createLink(uri: '/inicio')}">
        <strong>RENK</strong>
      </a>
    </div>
    <div class="collapse navbar-collapse" id="main-navigation">
      <ul class="nav navbar-nav">
        <li>
        <g:link controller="venda" action="index">
          Vendas
        </g:link>
        </li>
        <li>
        <g:link controller="compra" action="index">
          Compras
        </g:link>
        </li>
        <li>
        <g:link controller="produto" action="index">
          Produtos
        </g:link>
        </li>
        <li>
        <g:link controller="cliente" action="index">
          Clientes
        </g:link>
        </li>
        <li>
        <g:link controller="fornecedor" action="index">
          Fornecedores
        </g:link>                            
        </li>
        <li>
        <g:link controller="servico" action="index">
          Serviços
        </g:link>
        </li>
        <li>
        <g:link controller="relatorio" action="index">
          Relatórios
        </g:link>
        </li>
        <li>
        <g:link controller="ajuda" action="index">
          Ajuda
        </g:link>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/RENK">Sair</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!--<div class="nav" role="navigation">
    <ul>
        <li>
            <a class="home" href="${createLink(uri: '/')}">
<g:message code="default.home.label"/>
            </a>
        </li>
        <li>
<g:link class="create" action="create">
<g:message code="default.new.label" args="[entityName]" />
</g:link>
        </li>
        </ul>
    </div>-->
<div class="container-fluid">
  <div class="row">
    <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
      <div class="well well-sm">
        <h1>Opções de Ajuda</h1>
        <ul class="nav nav-pills nav-stacked">
          <li>
          <g:link controller="promocao" action="help">
            Promocao
          </g:link>
          </li>
          <li>
          <g:link controller="venda" action="help">
            Venda
          </g:link>
          </li>
        </ul>
      </div>
    </nav>
    <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
      <div id="help-promocao" class="scaffold-show" role="main">
        <h3>A forma mais rápida de solucionar a sua dúvida é através do guia ao lado esquerdo</h3>
        <br/>
        <h3>Fale Conosco</h3>

        Caso você tenha uma dúvida sobre uma funcionalidade específica, que não esteja listada
        entre as sessões ao lado
        <br/>
        Evie um e-mail para: <a href="mailto:duvida@brarsolutions.com" >duvida@brarsolutions.com</a><br/>
        Ou ligue para <a href="tel:+554400000000" >(44) XXXX-XXXX</a> (das 6h às 18h) 
      </div>
    </section>
  </div>
</div>
</body>
</html>

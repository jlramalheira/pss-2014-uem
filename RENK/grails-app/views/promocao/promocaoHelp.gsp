
<%@ page import="renk.gerenciamentoProdutos.Promocao" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'promocao.label', default: 'Promocao')}" />
  <title><g:message code="Ajuda" args="[entityName]" /></title>
</head>
<body>
<g:render template="nav-main"/>
<div class="container-fluid">
  <div class="row">
    <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
      <g:render template="nav-sub"/>
    </nav>
    <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
      <div id="help-promocao" class="scaffold-show" role="main">
        <div class="row">
          <h1>Promoção Ajuda</h1>
          <h3>Criando uma promoção</h3>
          <p>Para criar uma nova promoção, basta clicar na barra de menu principal no topo da pagina no item Produto e após em nova promocao</p>
          <g:img dir="images" file="criarPromocao.png" width="100%"/>
          <p>Defina um nome para a promoção e suas datas de inicio e termino e clique no botão "Criar"</p>
        </div>
      </div>
    </section>
  </div>
</div>
</body>
</html>

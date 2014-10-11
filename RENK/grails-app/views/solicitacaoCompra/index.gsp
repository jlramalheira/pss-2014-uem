
<%@ page import="renk.gerenciamentoTransacoes.SolicitacaoCompra" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'solicitacaoCompra.label', default: 'Solicitacao Compra')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<g:render template="nav-main"/>
<div class="container-fluid">
  <div class="row">
    <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
      <g:render template="nav-sub"/>
    </nav>
    <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
      <div id="list-solicitacaoCompra" role="main">
        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:form url="[resource:solicitacaoCompraInstance, action:'index']" method="GET"
                class="well well-lg">
          <div class="row">
            <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: solicitacaoCompraInstance, field: 'dataSolicitacao', 'error')}">
              <label for="dataSolicitacaoIincio">
                <g:message code="promocao.dataSolicitacao.label" default="Data Inicio" />
              </label><br/>
              <g:datePicker name="dataSolicitacaoInicio" precision="day"  value="${params.dataSolicitacaoInicio}" />
            </div>
          </div>
          <div class="row">
            <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: solicitacaoCompraInstance, field: 'dataSolicitacao', 'error')}">
              <label for="dataSolicitacaoFim">
                <g:message code="promocao.dataSolicitacao.label" default="Data Fim" />
              </label><br/>
              <g:datePicker name="dataSolicitacaoFim" precision="day"  value="${params.dataSolicitacaoFim}" />
            </div>
          </div>
          <div class="form-actions">
            <g:actionSubmit class="btn btn-lg btn-primary" action="index" 
                            value="${message(code: 'default.button.search.label', default: 'Search')}" />
          </div>
        </g:form>
        <g:if test="${flash.message}">
          <div  class="alert alert-info alert-dismissable" role="status">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
${flash.message}
          </div>
        </g:if>
        <table class="table table-hover table-striped table-responsive">
          <thead>
            <tr>

          <g:sortableColumn property="dataSolicitacao" title="${message(code: 'solicitacaoCompra.dataSolicitacao.label', default: 'Data Solicitacao')}" />

          <g:sortableColumn property="status" title="${message(code: 'solicitacaoCompra.status.label', default: 'Status')}" />

          </tr>
          </thead>
          <tbody>
          <g:each in="${solicitacaoCompraInstanceList}" status="i" var="solicitacaoCompraInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

              <td><g:link action="show" id="${solicitacaoCompraInstance.id}"><g:formatDate format="dd/MM/yyyy" date="${solicitacaoCompraInstance?.dataSolicitacao}" /></g:link></td>

            <td><g:if test="${solicitacaoCompraInstance.isEmAberto()}">
              <span class="label label-warning">${solicitacaoCompraInstance.getStatusStr()}</span>
            </g:if>
            <g:if test="${solicitacaoCompraInstance.isCancelada()}">
              <span class="label label-danger">${solicitacaoCompraInstance.getStatusStr()}</span>
            </g:if>
            <g:if test="${solicitacaoCompraInstance.isConcluida()}">
              <span class="label label-success">${solicitacaoCompraInstance.getStatusStr()}</span>
            </g:if></td>

            </tr>
          </g:each>
          </tbody>
        </table>
        <div class="pagination">
          <g:paginate total="${solicitacaoCompraInstanceCount ?: 0}" />
        </div>
      </div>
    </section>
  </div>
</div>
</body>
</html>

<%@ page import="renk.gerenciamentoTransacoes.SolicitacaoCompra" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'solicitacaoCompra.label', default: 'Solicitacao Compra')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<g:render template="nav-main"/>
<div class="container-fluid">
  <div class="row">
    <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
      <g:render template="nav-sub"/>
    </nav>
    <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
      <div id="show-solicitacaoCompra" class="scaffold-show" role="main">
        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
          <div class="alert alert-info alert-dismissable" role="status">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
${flash.message}
          </div>
        </g:if>
        <dl class="dl-horizontal property-list solicitacaoCompra">

          <g:if test="${solicitacaoCompraInstance?.dataSolicitacao}">
            <dt id="dataSolicitacao-label" class="property-label">
            <g:message code="solicitacaoCompra.dataSolicitacao.label" default="Data Solicitacao" />
            </dt>
            <dd class="property-value" aria-labelledby="dataSolicitacao-label">

            <g:formatDate format="dd/MM/yyyy" date="${solicitacaoCompraInstance?.dataSolicitacao}" />

            </dd>
          </g:if>
          <g:if test="${solicitacaoCompraInstance?.status}">
            <dt id="dataSolicitacao-label" class="property-label">
            <g:message code="solicitacaoCompra.status.label" default="Status" />
            </dt>
            <dd class="property-value" aria-labelledby="status-label">
            <g:if test="${solicitacaoCompraInstance.isEmAberto()}">
              <span class="label label-info">${solicitacaoCompraInstance.getStatusStr()}</span>
            </g:if>
            <g:if test="${solicitacaoCompraInstance.isCancelada()}">
              <span class="label label-danger">${solicitacaoCompraInstance.getStatusStr()}</span>
            </g:if>
            <g:if test="${solicitacaoCompraInstance.isConcluida()}">
              <span class="label label-success">${solicitacaoCompraInstance.getStatusStr()}</span>
            </g:if>
            </dd>
          </g:if>
        </dl>
        <div class="row margin-top-sm">
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <table class="table table-hover table-striped table-responsive">
              <caption class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                  <h2 class="margin-top-zero">Lista de Produtos</h2>
                </div>

              </caption>
              <thead>
                <tr>
                  <th>
                    Produto
                  </th>
                  <th>
                    Preço do produto
                  </th>
                  <th>
                    Quantidade
                  </th>
                  <th colspan="2">
                    Total
                  </th>
                </tr>
              </thead>
              <tbody>
              <g:each in="${solicitacaoCompraInstance?.itens}" status="i" var="itemInstance">
                <tr>
                  <td>${fieldValue(bean: itemInstance.produto, field: "nome")}</td>
                  <td>${fieldValue(bean: itemInstance.produto, field: "valorCusto")}</td>
                  <td>${fieldValue(bean: itemInstance, field: "quantidade")}</td>
                  <td>${fieldValue(bean: itemInstance, field: "total")}</td>
                </tr>
              </g:each>
              </tbody>
              <tfoot>
                <tr>
                  <th colspan="2">
                    Total
                  </th>
                  <th>
${solicitacaoCompraInstance.getQuantidadeTotal()}
                  </th>
                  <th colspan="2">
${solicitacaoCompraInstance.getValorTotal()}
                  </th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
        <g:form url="[resource:solicitacaoCompraInstance, action:'delete']" method="DELETE">
          <g:if test="${solicitacaoCompraInstance.isEmAberto()}">
            <fieldset class="buttons">
              <legend>Opções</legend>
              <g:link class="btn btn-lg btn-primary"  action="edit" resource="${solicitacaoCompraInstance}">
                <g:message code="default.button.edit.label" default="Edit" />
              </g:link>
              <button type="button" class="btn btn-lg btn-success" data-toggle="modal" data-target="#modal-finalizar-solicitacao">
                Concluir
              </button>

              <g:actionSubmit class="btn btn-lg btn-danger" action="cancel" 
                              value="${message(code: 'default.button.cancel.label', default: 'Cancelar')}"
                              onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
          </g:if>

          <div class="modal fade" id="modal-finalizar-solicitacao" tabindex="-1" role="dialog" aria-labelledby="#modal-finalizar-solicitacao-label" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h3 class="modal-title" id="modal-novo-produto-label">
                    Novo item de produto
                  </h3>
                </div>
                <g:form id="new-item-form" url="[resource:solicitacaoCompraInstance, action:'addProduct']">
                  <div class="modal-body text-left">
                    <div class="row">
                      <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: solicitacaoCompraInstance, field: 'produto', 'error')} required">
                        <label for="fornecedor">
                          Fornecedor
                          <span class="required-indicator">*</span>
                        </label>
                        <g:select class="form-control" id="fornecedor" name="fornecedor.id" 
                                  from="${fornecedores}" 
                                  optionKey="id" required="" 
                                  value="${fornecedorInstance?.id}"
                                  class="many-to-one"/>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <g:actionSubmit class="btn btn-primary" action="complete" 
                                    value="${message(code: 'default.button.complete.label', default: 'Concluir')}"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                  </div>
                </g:form>
              </div>
            </div>
          </div>


        </g:form>
      </div>
    </section>
  </div>
</div>
</body>
</html>

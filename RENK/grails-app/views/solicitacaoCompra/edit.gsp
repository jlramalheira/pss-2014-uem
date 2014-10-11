<%@ page import="renk.gerenciamentoTransacoes.SolicitacaoCompra" %>
<%@ page import="renk.gerenciamentoProdutos.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'solicitacaoCompra.label', default: 'Solicitacao Compra')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<g:render template="nav-main"/>

<div class="container-fluid">
  <div class="row">
    <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
      <g:render template="nav-sub"/>
    </nav>
    <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
      <div id="edit-solicitacaoCompra" class="scaffold-edit" role="main">
        <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${solicitacaoCompraInstance}">
          <ul class="errors" role="alert">
            <g:eachError bean="${solicitacaoCompraInstance}" var="error">
              <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
          </ul>
        </g:hasErrors>
        <g:form url="[resource:solicitacaoCompraInstance, action:'update']"
                method="PUT" >
          <g:hiddenField name="version" value="${solicitacaoCompraInstance?.version}" />
          <fieldset class="form">
            <g:render template="form"/>
          </fieldset>
          <div class="row margin-top-sm">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <table class="table table-hover table-striped table-responsive">
                <caption class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                    <h2 class="margin-top-zero">Lista de Produtos</h2>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-novo-produto">
                      Adicionar Produto
                    </button>
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
                    <td class="text-right">
                    <g:link controller="solicitacaoCompra" action="removeProduct" 
                          id="${solicitacaoCompraInstance.id}" params="[itemId: itemInstance.id]" class="btn btn-sm btn-danger" >
                    Remover
                  </g:link>
                  </td>
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
          <fieldset class="buttons">
            <g:actionSubmit class="btn btn-lg btn-primary" action="update" 
                            value="${message(code: 'default.button.update.label', default: 'Update')}" />
            <g:link controller="show"  resource="${solicitacaoCompraInstance}" 
                    class="btn btn-lg btn-danger">
              Cancelar
            </g:link>
          </fieldset>
        </g:form>
        <div class="modal fade" id="modal-novo-produto" tabindex="-1" role="dialog" aria-labelledby="#modal-novo-produto-label" aria-hidden="true">
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
                      <label for="produto">
                        Produto
                        <span class="required-indicator">*</span>
                      </label>
                      <g:select class="form-control" id="produto" name="produto.id" 
                                from="${produtos}" 
                                optionKey="id" required="" 
                                value="${produtoInstance?.id}"
                                class="many-to-one"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: compraInstance, field: 'quantidade', 'error')} required">
                      <label for="quantidade">
                        Quantidade
                        <span class="required-indicator">*</span>
                      </label>
                      <input type="number" name="quantidade" class="form-control" value="1" min="1"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: compraInstance, field: 'preco', 'error')} required">
                      <label for="preco">
                        Valor
                        <span class="required-indicator">*</span>
                      </label>
                      <input type="number" name="preco" id="preco" class="form-control" value="${produtos.toArray()[0].valorCusto}" min="0" step="0.01"/>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                  <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
              </g:form>
            </div>
          </div>
        </div>
      </div>

    </section>
  </div>
</div>
<script type="text/javascript">
            produtos = new Array();
<g:each in="${produtos}" status="i" var="produto">
            produtos['${produto.id}'] = "${produto.valorCusto}"
</g:each>
</script>
</body>
</html>

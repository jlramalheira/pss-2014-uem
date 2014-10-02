<%@ page import="renk.gerenciamentoProdutos.Promocao" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'promocao.label', default: 'Promocao')}" />
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
      <div id="edit-promocao" class="scaffold-edit" role="main">
        <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${promocaoInstance}">
          <ul class="errors" role="alert">
            <g:eachError bean="${promocaoInstance}" var="error">
              <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
          </ul>
        </g:hasErrors>
        <g:form url="[resource:promocaoInstance, action:'update']"
                method="PUT" >
          <g:hiddenField name="version" value="${promocaoInstance?.version}" />
          <fieldset class="form">
            <g:render template="form"/>
          </fieldset>
          <div>
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
                    Desconto
                  </th>
                  <th colspan="2">
                    Preço com desconto
                  </th>
                </tr>
              </thead>
              <tbody>
              
              </tbody>
            </table>
          </div>
          <fieldset class="buttons">
            <g:actionSubmit class="btn btn-lg btn-primary" action="update" 
                            value="${message(code: 'default.button.update.label', default: 'Update')}" />
            <g:link controller="show"  resource="${promocaoInstance}" 
                    class="btn btn-lg btn-danger">
              Cancelar
            </g:link>
          </fieldset>
        </g:form>
      </div>
      <div class="modal fade" id="modal-novo-produto" tabindex="-1" role="dialog" aria-labelledby="#modal-novo-produto-label" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <g:form url="[resource:promocaoInstance, action:'addProduct']" >
              <g:hiddenField name="promocao.id" value="${promocaoInstance?.id}" />
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="modal-novo-produto-label">
                  Novo item de produto
                </h3>
              </div>
              <div class="modal-body text-left">
                <div class="row">
                  <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                    <label for="valorTotal">
                      Produto
                      <span class="required-indicator">*</span>
                    </label>
                    <g:select class="form-control" id="produto" name="produto.id" from="${produtos}" optionKey="id" required="" value="${produtoInstance?.id}" class="many-to-one"/>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                    <label for="valorTotal">
                      Desconto
                      <span class="required-indicator">*</span>
                    </label>
                    <input type="number" name="desconto" class="form-control"/>
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
</body>
</html>

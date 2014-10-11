
<%@ page import="renk.gerenciamentoProdutos.Promocao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'promocao.label', default: 'Promocao')}" />
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
                    <div id="show-promocao" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list promocao">
                            
                            <g:if test="${promocaoInstance?.nome}">
                                <dt id="nome-label" class="property-label">
                                        <g:message code="promocao.nome.label" default="Nome" />
                                </dt>
                                <dd class="property-value" aria-labelledby="nome-label">
                                    
                                        <g:fieldValue bean="${promocaoInstance}" field="nome"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${promocaoInstance?.dataInicio}">
                                <dt id="dataInicio-label" class="property-label">
                                        <g:message code="promocao.dataInicio.label" default="Data Inicio" />
                                </dt>
                                <dd class="property-value" aria-labelledby="dataInicio-label">
                                    
                                        <g:formatDate format="dd/MM/yyy" date="${promocaoInstance?.dataInicio}" />
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${promocaoInstance?.dataFim}">
                                <dt id="dataFim-label" class="property-label">
                                        <g:message code="promocao.dataFim.label" default="Data Fim" />
                                </dt>
                                <dd class="property-value" aria-labelledby="dataFim-label">
                                    
                                        <g:formatDate format="dd/MM/yyy" date="${promocaoInstance?.dataFim}" />
                                    
                                </dd>
                            </g:if>
                          
                                <div class="row margin-top-sm">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <table class="table table-hover table-striped table-responsive">
            <caption class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                    <h2 class="margin-top-zero">Lista de Produtos</h2>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">

                </div>
                <div class="modal fade" id="modal-novo-produto" tabindex="-1" role="dialog" aria-labelledby="#modal-novo-produto-label" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
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
                                        <select class="form-control" name="produto">
                                            <option value="1">Produto 1</option>
                                            <option value="2">Produto 2</option>
                                            <option value="3">Produto 3</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                                        <label for="valorTotal">
                                            Desconto
                                            <span class="required-indicator">*</span>
                                        </label>
                                        <input type="number" class="form-control"/>
                                    </div>
                                </div>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                <button type="button" class="btn btn-primary">Salvar</button>
                            </div>
                        </div>
                    </div>
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
                <g:each in="${promocaoInstance.itens}" status="i" var="itemPromocaoInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                  <td>${fieldValue(bean: itemPromocaoInstance, field: "produto")}</td>
                  <td>${itemPromocaoInstance.produto.valor}</td>
                  <td>${itemPromocaoInstance.desconto}%</td>
                  <td>${itemPromocaoInstance.produto.valorVenda}</td>
                </tr>
              </g:each>
            </tbody>
        </table>
    </div>
</div>
                            
                        </dl>
                        <g:form url="[resource:promocaoInstance, action:'finish']" method="DELETE">
                          <g:if test="${promocaoInstance.isFinalizada()}">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${promocaoInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                <g:actionSubmit class="btn btn-lg btn-success" action="finish" 
                                value="${message(code: 'default.button.finalize.label', default: 'Finalizar')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                            </g:if>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

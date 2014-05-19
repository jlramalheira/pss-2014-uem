
<%@ page import="renk.gerenciamentoProdutos.Produto" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
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
                    <div id="show-produto" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list produto">
                            
                            <g:if test="${produtoInstance?.nome}">
                                <dt id="nome-label" class="property-label">
                                        <g:message code="produto.nome.label" default="Nome" />
                                </dt>
                                <dd class="property-value" aria-labelledby="nome-label">
                                    
                                        <g:fieldValue bean="${produtoInstance}" field="nome"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${produtoInstance?.descricao}">
                                <dt id="descricao-label" class="property-label">
                                        <g:message code="produto.descricao.label" default="Descricao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="descricao-label">
                                    
                                        <g:fieldValue bean="${produtoInstance}" field="descricao"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${produtoInstance?.estoqueMinimo}">
                                <dt id="estoqueMinimo-label" class="property-label">
                                        <g:message code="produto.estoqueMinimo.label" default="Estoque Minimo" />
                                </dt>
                                <dd class="property-value" aria-labelledby="estoqueMinimo-label">
                                    
                                        <g:fieldValue bean="${produtoInstance}" field="estoqueMinimo"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${produtoInstance?.estoqueDesejavel}">
                                <dt id="estoqueDesejavel-label" class="property-label">
                                        <g:message code="produto.estoqueDesejavel.label" default="Estoque Desejavel" />
                                </dt>
                                <dd class="property-value" aria-labelledby="estoqueDesejavel-label">
                                    
                                        <g:fieldValue bean="${produtoInstance}" field="estoqueDesejavel"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${produtoInstance?.valor}">
                                <dt id="valor-label" class="property-label">
                                        <g:message code="produto.valor.label" default="Valor" />
                                </dt>
                                <dd class="property-value" aria-labelledby="valor-label">
                                    
                                        <g:fieldValue bean="${produtoInstance}" field="valor"/>
                                    
                                </dd>
                            </g:if>
                            <g:if test="${produtoInstance}">
                                <dt id="valor-label" class="property-label">
                                        <g:message code="produto.saldo.label" default="Saldo" />
                                </dt>
                                <dd class="property-value" aria-labelledby="saldo-label">
                                    
                                        <g:fieldValue bean="${produtoInstance}" field="saldo"/>
                                    
                                </dd>
                            </g:if>
                            <g:if test="${produtoInstance}">
                                <g:if test="${produtoInstance.ativo}">
                                    <dt id="valor-label" class="property-label">
                                            <g:message code="produto.ativo.label" default="Status" />
                                    </dt>
                                    <dd class="property-value" aria-labelledby="valor-label">
                                            <span class="label label-success">Ativo</span>
                                    </dd>
                                </g:if>
                              <g:else>
                                    <dt id="valor-label" class="property-label">
                                            <g:message code="produto.ativo.label" default="Status" />
                                    </dt>
                                    <dd class="property-value" aria-labelledby="valor-label">
                                            <span class="label label-danger">Inativo</span>
                                    </dd>
                              </g:else>
                            </g:if>
                        </dl>
                        <g:form url="[resource:produtoInstance, action:'inactivate']" method="DELETE">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${produtoInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                <g:if test="${produtoInstance?.ativo}">
                                <g:actionSubmit class="btn btn-lg btn-danger" action="inactivate" 
                                value="${message(code: 'default.button.inactive.label', default: 'Inativar')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </g:if>
                                <g:else>
                                  <g:actionSubmit class="btn btn-lg btn-success" action="activate" 
                                value="${message(code: 'default.button.active.label', default: 'Ativar')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </g:else>
                            </fieldset>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

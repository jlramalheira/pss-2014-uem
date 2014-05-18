
<%@ page import="renk.gerenciamentoTransacoes.Compra" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
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
                    <div id="show-compra" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list compra">
                            
                            <g:if test="${compraInstance?.pessoa}">
                                <dt id="pessoa-label" class="property-label">
                                        <g:message code="compra.pessoa.label" default="Pessoa" />
                                </dt>
                                <dd class="property-value" aria-labelledby="pessoa-label">
                                    
                                        <g:link controller="pessoa" action="show" id="${compraInstance?.pessoa?.id}">
                                            ${compraInstance?.pessoa?.encodeAsHTML()}
                                        </g:link>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${compraInstance?.dataTransacao}">
                                <dt id="dataTransacao-label" class="property-label">
                                        <g:message code="compra.dataTransacao.label" default="Data Transacao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="dataTransacao-label">
                                    
                                        <g:formatDate date="${compraInstance?.dataTransacao}" />
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${compraInstance?.quantidadeTotal}">
                                <dt id="quantidadeTotal-label" class="property-label">
                                        <g:message code="compra.quantidadeTotal.label" default="Quantidade Total" />
                                </dt>
                                <dd class="property-value" aria-labelledby="quantidadeTotal-label">
                                    
                                        <g:fieldValue bean="${compraInstance}" field="quantidadeTotal"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${compraInstance?.valorTotal}">
                                <dt id="valorTotal-label" class="property-label">
                                        <g:message code="compra.valorTotal.label" default="Valor Total" />
                                </dt>
                                <dd class="property-value" aria-labelledby="valorTotal-label">
                                    
                                        <g:fieldValue bean="${compraInstance}" field="valorTotal"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${compraInstance?.status}">
                                <dt id="status-label" class="property-label">
                                        <g:message code="compra.status.label" default="Status" />
                                </dt>
                                <dd class="property-value" aria-labelledby="status-label">
                                    
                                        <g:fieldValue bean="${compraInstance}" field="status"/>
                                    
                                </dd>
                            </g:if>
                            
                        </dl>
                        <g:form url="[resource:compraInstance, action:'delete']" method="DELETE">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${compraInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                <g:actionSubmit class="btn btn-lg btn-danger" action="delete" 
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>


<%@ page import="renk.gerenciamentoSolucao.Solucao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'solucao.label', default: 'Solucao')}" />
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
                    <div id="show-solucao" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list solucao">
                            
                            <g:if test="${solucaoInstance?.descricao}">
                                <dt id="descricao-label" class="property-label">
                                        <g:message code="solucao.descricao.label" default="Descricao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="descricao-label">
                                    
                                        <g:fieldValue bean="${solucaoInstance}" field="descricao"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${solucaoInstance?.ordemServico}">
                                <dt id="ordemServico-label" class="property-label">
                                        <g:message code="solucao.ordemServico.label" default="Ordem Servico" />
                                </dt>
                                <dd class="property-value" aria-labelledby="ordemServico-label">
                                    
                                        <g:link controller="ordemServico" action="show" id="${solucaoInstance?.ordemServico?.id}">
                                            ${solucaoInstance?.ordemServico?.encodeAsHTML()}
                                        </g:link>
                                    
                                </dd>
                            </g:if>
                            
                        </dl>
                        <g:form url="[resource:solucaoInstance, action:'delete']" method="DELETE">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${solucaoInstance}">
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

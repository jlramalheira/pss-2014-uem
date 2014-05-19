
<%@ page import="renk.gerenciamentoSolucao.Solucao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'solucao.label', default: 'Solucao')}" />
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
                    <div id="list-solucao" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                        <div  class="alert alert-info alert-dismissable" role="status">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${flash.message}
                        </div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="descricao" title="${message(code: 'solucao.descricao.label', default: 'Descricao')}" />
                                        <g:sortableColumn property="ordemServico" title="${message(code: 'solucao.ordemServico.label', default: 'Ordem de Servico')}" />
                                        
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${solucaoInstanceList}" status="i" var="solucaoInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${solucaoInstance.id}">${fieldValue(bean: solucaoInstance, field: "descricao")}</g:link></td>
                                        
                                        <td><g:link controller="ordemServico" action="show" id="${solucaoInstance.ordemServico.id}">${fieldValue(bean: solucaoInstance, field: "ordemServico")}</g:link></td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${solucaoInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

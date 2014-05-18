
<%@ page import="renk.gerenciamentoTransacoes.Venda" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
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
                    <div id="list-venda" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="dataTransacao" title="${message(code: 'venda.dataTransacao.label', default: 'Data Transacao')}" />
                                        
                                        <g:sortableColumn property="quantidadeTotal" title="${message(code: 'venda.quantidadeTotal.label', default: 'Quantidade Total')}" />
                                        
                                        <g:sortableColumn property="valorTotal" title="${message(code: 'venda.valorTotal.label', default: 'Valor Total')}" />
                                        
                                        <g:sortableColumn property="status" title="${message(code: 'venda.status.label', default: 'Status')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${vendaInstanceList}" status="i" var="vendaInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${vendaInstance.id}">${fieldValue(bean: vendaInstance, field: "dataTransacao")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: vendaInstance, field: "quantidadeTotal")}</td>
                                        
                                        <td>${fieldValue(bean: vendaInstance, field: "valorTotal")}</td>
                                        
                                        <td>${fieldValue(bean: vendaInstance, field: "status")}</td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${vendaInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

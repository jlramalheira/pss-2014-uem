
<%@ page import="renk.gerenciamentoServicos.OrdemServico" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'ordemServico.label', default: 'Ordem Servico')}" />
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
                    <div id="list-ordemServico" role="main">
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
                                    
                                    <th><g:message code="ordemServico.ordemServico.label" default="Ordem Servico" /></th>
                                        <g:sortableColumn property="servico" title="${message(code: 'ordemServico.servico.label', default: 'Servico')}" />
                                        <g:sortableColumn property="funcionario" title="${message(code: 'ordemServico.funcionario.label', default: 'Funcionario')}" />
                                        <g:sortableColumn property="dataEmissao" title="${message(code: 'ordemServico.dataEmissao.label', default: 'Data Emissao')}" />
                                        <g:sortableColumn property="dataPrevisao" title="${message(code: 'ordemServico.dataPrevisao.label', default: 'Data Previsao')}" />
                                        <g:sortableColumn property="dataConclusao" title="${message(code: 'ordemServico.dataConclusao.label', default: 'Data Conclusao')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${ordemServicoInstanceList}" status="i" var="ordemServicoInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${ordemServicoInstance.id}">#${fieldValue(bean: ordemServicoInstance, field: "id")}</g:link></td>
                                        <td><g:link controller="servico" action="show" id="${ordemServicoInstance.servico.id}">${fieldValue(bean: ordemServicoInstance, field: "servico")}</g:link></td>
                                        <td><g:link controller="funcionario" action="show" id="${ordemServicoInstance.funcionario.id}">${fieldValue(bean: ordemServicoInstance, field: "funcionario")}</g:link></td>
                                        
                                        <td><g:formatDate format="dd/MM/yyyy" date="${ordemServicoInstance.dataEmissao}" /></td>
                                        <td><g:formatDate format="dd/MM/yyyy" date="${ordemServicoInstance.dataPrevisao}" /></td>
                                        <td>
                                            <g:if test="${ordemServicoInstance.isConcluida()}">
                                                <g:formatDate format="dd/MM/yyyy" date="${ordemServicoInstance.dataConclusao}" />
                                            </g:if>
                                            <g:else>
                                                <g:if test="${ordemServicoInstance.isAtrasada()}">
                                                    <span class="label label-warning">Atrasada</span>
                                                </g:if>
                                                <g:elseif test="${ordemServicoInstance.cancelada}">
                                                    <span class="label label-danger">Cancelada</span>
                                                </g:elseif>
                                                <g:else>
                                                    <span class="label label-info">Em Andamento</span>
                                                </g:else>
                                            </g:else>
                                        </td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${ordemServicoInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

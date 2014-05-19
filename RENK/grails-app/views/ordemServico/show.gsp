
<%@ page import="renk.gerenciamentoServicos.OrdemServico" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'ordemServico.label', default: 'Ordem Servico')}" />
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
                    <div id="show-ordemServico" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list ordemServico">
                            <g:if test="${ordemServicoInstance?.funcionario}">
                                <dt id="funcionario-label" class="property-label">
                                        <g:message code="ordemServico.funcionario.label" default="Funcionario" />
                                </dt>
                                <dd class="property-value" aria-labelledby="servico-label">
                                    
                                        <g:link controller="funcionario" action="show" id="${ordemServicoInstance?.funcionario?.id}">
                                            ${ordemServicoInstance?.funcionario?.encodeAsHTML()}
                                        </g:link>
                                    
                                </dd>
                            </g:if>                            
                            
                            <g:if test="${ordemServicoInstance?.servico}">
                                <dt id="servico-label" class="property-label">
                                        <g:message code="ordemServico.servico.label" default="Servico" />
                                </dt>
                                <dd class="property-value" aria-labelledby="servico-label">
                                    
                                        <g:link controller="servico" action="show" id="${ordemServicoInstance?.servico?.id}">
                                            ${ordemServicoInstance?.servico?.encodeAsHTML()}
                                        </g:link>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${ordemServicoInstance?.dataEmissao}">
                                <dt id="dataEmissao-label" class="property-label">
                                        <g:message code="ordemServico.dataEmissao.label" default="Data Emissao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="dataEmissao-label">
                                    
                                        <g:formatDate format="dd/MM/yyyy" date="${ordemServicoInstance?.dataEmissao}" />
                                    
                                </dd>
                            </g:if>
                            <g:if test="${ordemServicoInstance?.dataPrevisao}">
                                <dt id="dataEmissao-label" class="property-label">
                                        <g:message code="ordemServico.dataPrevisao.label" default="Data Previsao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="dataPrevisao-label">
                                    
                                        <g:formatDate format="dd/MM/yyyy" date="${ordemServicoInstance?.dataPrevisao}" />
                                    
                                </dd>
                            </g:if>
                            <dt id="dataEmissao-label" class="property-label">
                                <g:message code="ordemServico.dataConclusao.label" default="Data Conclusao" />
                            </dt>
                            <dd class="property-value" aria-labelledby="dataConclusao-label">
                                <g:if test="${ordemServicoInstance?.isConcluida()}">
                                    <g:formatDate format="dd/MM/yyyy" date="${ordemServicoInstance?.dataConclusao}" />                                    
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
                            </dd>
                            
                        </dl>
                        <g:form url="[resource:ordemServicoInstance, action:'delete']" method="DELETE">
                          <g:if test="${!ordemServicoInstance?.cancelada}">
                              <g:if test="${!ordemServicoInstance?.isConcluida()}">
                                <fieldset class="buttons">
                                    <legend>Opções</legend>
                                    <g:link class="btn btn-lg btn-primary"  action="edit" resource="${ordemServicoInstance}">
                                        <g:message code="default.button.edit.label" default="Edit" />
                                    </g:link>
                                    <g:actionSubmit class="btn btn-lg btn-danger" action="cancel" 
                                    value="${message(code: 'default.button.cancel.label', default: 'Cancelar')}"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                    <g:actionSubmit class="btn btn-lg btn-success" action="complete" 
                                    value="${message(code: 'default.button.complete.label', default: 'Concluir')}"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                    <g:actionSubmit class="btn btn-lg btn-warning" action="searchSolutions" 
                                    value="${message(code: 'default.button.complete.label', default: 'Procurar Solucoes')}"/>
                                </fieldset>
                                </g:if>
                            <g:else>
                                <g:actionSubmit class="btn btn-lg btn-primary" action="newSolution" 
                                value="${message(code: 'default.button.newSolution.label', default: 'Informar Solucao')}" />
                            </g:else>
                            </g:if>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

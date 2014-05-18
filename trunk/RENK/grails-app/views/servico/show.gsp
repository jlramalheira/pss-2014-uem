
<%@ page import="renk.gerenciamentoServicos.Servico" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'servico.label', default: 'Servico')}" />
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
                    <div id="show-servico" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list servico">

                            <g:if test="${servicoInstance?.nome}">
                                <dt id="nome-label" class="property-label">
                                <g:message code="servico.nome.label" default="Nome" />
                                </dt>
                                <dd class="property-value" aria-labelledby="nome-label">

                                    <g:fieldValue bean="${servicoInstance}" field="nome"/>

                                </dd>
                            </g:if>

                            <g:if test="${servicoInstance?.descricao}">
                                <dt id="descricao-label" class="property-label">
                                <g:message code="servico.descricao.label" default="Descricao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="descricao-label">

                                    <g:fieldValue bean="${servicoInstance}" field="descricao"/>

                                </dd>
                            </g:if>

                            <g:if test="${servicoInstance?.hora}">
                                <dt id="hora-label" class="property-label">
                                <g:message code="servico.hora.label" default="Hora" />
                                </dt>
                                <dd class="property-value" aria-labelledby="hora-label">

                                    <g:fieldValue bean="${servicoInstance}" field="hora"/>

                                </dd>
                            </g:if>

                            <g:if test="${servicoInstance?.minutos}">
                                <dt id="minutos-label" class="property-label">
                                <g:message code="servico.minutos.label" default="Minutos" />
                                </dt>
                                <dd class="property-value" aria-labelledby="minutos-label">

                                    <g:fieldValue bean="${servicoInstance}" field="minutos"/>

                                </dd>
                            </g:if>

                            <g:if test="${servicoInstance?.valor}">
                                <dt id="valor-label" class="property-label">
                                <g:message code="servico.valor.label" default="Valor" />
                                </dt>
                                <dd class="property-value" aria-labelledby="valor-label">

                                    <g:fieldValue bean="${servicoInstance}" field="valor"/>

                                </dd>
                            </g:if>
                            
                            <g:if test="${servicoInstance}">
                                <g:if test="${servicoInstance.ativo}">
                                    <dt id="valor-label" class="property-label">
                                            <g:message code="servico.ativo.label" default="Status" />
                                    </dt>
                                    <dd class="property-value" aria-labelledby="valor-label">
                                            <span class="label label-success">Ativo</span>
                                    </dd>
                                </g:if>
                              <g:else>
                                    <dt id="valor-label" class="property-label">
                                            <g:message code="servico.ativo.label" default="Status" />
                                    </dt>
                                    <dd class="property-value" aria-labelledby="valor-label">
                                            <span class="label label-danger">Inativo</span>
                                    </dd>
                              </g:else>
                            </g:if>

                        </dl>
                        <g:form url="[resource:servicoInstance, action:'delete']" method="DELETE">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${servicoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                <g:if test="${servicoInstance?.ativo}">
                                    <g:actionSubmit class="btn btn-lg btn-danger" action="inativate" 
                                    value="${message(code: 'default.button.inativate.label', default: 'Inativar')}"
                                    onclick="return confirm('${message(code: 'default.button.inativate.confirm.message.servico', default: 'Are you sure?')}');" />
                                </g:if>
                                <g:if test="${!servicoInstance?.ativo}">
                                    <g:actionSubmit class="btn btn-lg btn-success" action="ativate" 
                                    value="${message(code: 'default.button.ativate.label', default: 'Ativar')}"
                                    onclick="return confirm('${message(code: 'default.button.ativate.confirm.message.servico', default: 'Are you sure?')}');" />
                                </g:if>
                            </fieldset>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

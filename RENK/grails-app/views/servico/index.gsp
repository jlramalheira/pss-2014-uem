
<%@ page import="renk.gerenciamentoServicos.Servico" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'servico.label', default: 'Servico')}" />
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
                    <div id="list-servico" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if> 
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>

                                    <g:sortableColumn property="nome" title="${message(code: 'servico.nome.label', default: 'Nome')}" />

                                    <g:sortableColumn property="descricao" title="${message(code: 'servico.descricao.label', default: 'Descricao')}" />

                                    <g:sortableColumn property="hora" title="${message(code: 'servico.hora.label', default: 'Hora')}" />

                                    <g:sortableColumn property="minutos" title="${message(code: 'servico.minutos.label', default: 'Minutos')}" />

                                    <g:sortableColumn property="valor" title="${message(code: 'servico.valor.label', default: 'Valor')}" />

                                    <g:sortableColumn property="ativo" title="${message(code: 'produto.ativo.label', default: 'Status')}" />
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${servicoInstanceList}" status="i" var="servicoInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                            <td><g:link action="show" id="${servicoInstance.id}">${fieldValue(bean: servicoInstance, field: "nome")}</g:link></td>

                                            <td>${fieldValue(bean: servicoInstance, field: "descricao")}</td>

                                            <td>${fieldValue(bean: servicoInstance, field: "hora")}</td>

                                            <td>${fieldValue(bean: servicoInstance, field: "minutos")}</td>

                                            <td>${fieldValue(bean: servicoInstance, field: "valor")}</td>

                                            <td>
                                                <g:if test="${servicoInstance.ativo}">
                                                    <span class="label label-success">Ativo</span>
                                                </g:if>
                                                <g:else>
                                                    <span class="label label-danger">Inativo</span>
                                                </g:else>
                                            </td>
                                        </tr>
                                    
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${servicoInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

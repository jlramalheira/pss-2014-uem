
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

                        <g:form url="[resource:fornecedorInstance, action:'index']" method="GET"
                            class="well well-lg">
                            <div class="row">
                                <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'dataTransacao', 'error')} required">
                                    <label for="dataTransacao">
                                        <g:message code="venda.dataTransacao.label" default="Data Transacao entre" />
                                        <span class="required-indicator">*</span>
                                    </label><br/>
                                    <g:datePicker name="dataTransacaoInicio" precision="day"  value="${params.dataTransacaoInicio}"  />
                                    <br/><br/>
                                    <g:datePicker name="dataTransacaoFim" precision="day"  value="${params.dataTransacaoFim}"  />
                                </div>
                            </div>
                            <div class="form-actions">
                                <g:actionSubmit class="btn btn-lg btn-primary" action="index" 
                                value="${message(code: 'default.button.search.label', default: 'Search')}" />
                            </div>
                        </g:form>

                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismiss" role="status">
                                <button type="button" class="close" data-dismiss="alert">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">Fechar</span>
                                </button>
                                ${flash.message}
                            </div>
                        </g:if>

                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>

                                    <th><g:message code="venda.pessoa.label" default="Cliente" /></th>

                                        <g:sortableColumn property="dataTransacao" title="${message(code: 'venda.dataTransacao.label', default: 'Data Transacao')}" />

                                        <g:sortableColumn property="quantidadeTotal" title="${message(code: 'venda.quantidadeTotal.label', default: 'Quantidade Total')}" />

                                        <g:sortableColumn property="valorTotal" title="${message(code: 'venda.valorTotal.label', default: 'Valor Total')}" />

                                        <g:sortableColumn property="status" title="${message(code: 'venda.status.label', default: 'Status')}" />

                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${vendaInstanceList}" status="i" var="vendaInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                        <td><g:link action="show" id="${vendaInstance.id}">
                                                Cliente ${fieldValue(bean: vendaInstance, field: "pessoa")}
                                            </g:link></td>

                                        <td><g:formatDate date="${vendaInstance.dataTransacao}" format="dd/MM/yyyy"  /></td>

                                        <td>${fieldValue(bean: vendaInstance, field: "quantidadeTotal")}</td>

                                        <td>${fieldValue(bean: vendaInstance, field: "valorTotal")}</td>

                                        <td><g:if test="${vendaInstance.isEmAberto()}">
                                                <span class="label label-warning">
                                                    ${vendaInstance.getStatusStr()}
                                                </span>
                                            </g:if>
                                            <g:if test="${vendaInstance.isCancelada()}">
                                                <span class="label label-danger">${vendaInstance.getStatusStr()}</span>
                                            </g:if>
                                            <g:if test="${vendaInstance.isFinalizada()}">
                                                <span class="label label-success">${vendaInstance.getStatusStr()}</span>
                                            </g:if>
                                        </td>

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

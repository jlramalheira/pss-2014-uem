
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

                                    <g:link controller="fornecedor" action="show" id="${compraInstance?.pessoa?.id}">
                                        ${compraInstance?.pessoa?.encodeAsHTML()}
                                    </g:link>

                                </dd>
                            </g:if>

                            <g:if test="${compraInstance?.dataTransacao}">
                                <dt id="dataTransacao-label" class="property-label">
                                <g:message code="compra.dataTransacao.label" default="Data Transacao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="dataTransacao-label">                                    
                                    <g:formatDate date="${compraInstance?.dataTransacao}"  format="dd/MM/yyyy"/>                                    
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
                                    R$ ${formatNumber(number: compraInstance?.valorTotal, format: '##0.00')}
                                </dd>
                            </g:if>

                            <g:if test="${compraInstance?.status}">
                                <dt id="status-label" class="property-label">
                                <g:message code="compra.status.label" default="Status" />
                                </dt>
                                <dd class="property-value" aria-labelledby="status-label">
                                    <g:if test="${compraInstance.isEmAberto()}">
                                        <span class="label label-warning">
                                            ${compraInstance.getStatusStr()}
                                        </span>
                                    </g:if>
                                    <g:if test="${compraInstance.isCancelada()}">
                                        <span class="label label-danger">${compraInstance.getStatusStr()}</span>
                                    </g:if>
                                    <g:if test="${compraInstance.isFinalizada()}">
                                        <span class="label label-info">${compraInstance.getStatusStr()}</span>
                                    </g:if>
                                    <g:if test="${compraInstance.isRecebida()}">
                                        <span class="label label-success">${compraInstance.getStatusStr()}</span>
                                    </g:if>
                                    <%--<g:fieldValue bean="${compraInstance}" field="status"/>--%>
                                </dd>
                            </g:if>

                        </dl>


                        <div class="row margin-top-sm">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <table class="table table-hover table-striped table-responsive">
                                    <caption class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                                            <h2 class="margin-top-zero">Lista de Produtos</h2>
                                        </div>
                                    </caption>
                                    <thead>
                                        <tr>
                                            <th>
                                                Produto
                                            </th>
                                            <th>
                                                Preço do produto
                                            </th>
                                            <th>
                                                Quantidade
                                            </th>
                                            <th>
                                                Total
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <g:each in="${compraInstance?.itens}" status="i" var="itemInstance">
                                            <tr>
                                                <td>${fieldValue(bean: itemInstance.produto, field: "nome")}</td>
                                                <td>R$ ${formatNumber(number: fieldValue(bean: itemInstance.produto, field: "valorCusto"), format: '##0.00')}</td>
                                                <td>${fieldValue(bean: itemInstance, field: "quantidade")}</td>
                                                <td>R$ ${formatNumber(number: fieldValue(bean: itemInstance, field: "total"), format: '##0.00')}</td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th colspan="2">
                                                Total
                                            </th>
                                            <th>
                                                ${compraInstance?.quantidadeTotal}
                                            </th>
                                            <th colspan="2">
                                                R$ ${formatNumber(number: compraInstance?.valorTotal, format: '##0.00')}
                                            </th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>

                    </div>



                    <g:form url="[resource:compraInstance, action:'delete']" method="DELETE">
                        <g:if test="${compraInstance.isEmAberto()}">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${compraInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                <g:actionSubmit class="btn btn-lg btn-info" action="finalizer" 
                                value="${message(code: 'default.button.complete.label', default: 'Finalizar')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                <g:actionSubmit class="btn btn-lg btn-success" action="receive" 
                                value="${message(code: 'default.button.complete.label', default: 'Receber')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

                                <g:actionSubmit class="btn btn-lg btn-danger" action="cancel" 
                                value="${message(code: 'default.button.cancel.label', default: 'Cancelar')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:if>
                    </g:form>
            </div>
        </section>
    </div>
</div>
</body>
</html>

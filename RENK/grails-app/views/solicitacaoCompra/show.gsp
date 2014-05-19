<%@ page import="renk.gerenciamentoTransacoes.SolicitacaoCompra" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'solicitacaoCompra.label', default: 'Solicitacao Compra')}" />
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
                    <div id="show-solicitacaoCompra" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list solicitacaoCompra">
                            
                            <g:if test="${solicitacaoCompraInstance?.dataSolicitacao}">
                                <dt id="dataSolicitacao-label" class="property-label">
                                        <g:message code="solicitacaoCompra.dataSolicitacao.label" default="Data Solicitacao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="dataSolicitacao-label">
                                    
                                        <g:formatDate format="dd/MM/yyyy" date="${solicitacaoCompraInstance?.dataSolicitacao}" />
                                    
                                </dd>
                            </g:if>
                            <g:if test="${solicitacaoCompraInstance?.status}">
                                <dt id="dataSolicitacao-label" class="property-label">
                                        <g:message code="solicitacaoCompra.status.label" default="Status" />
                                </dt>
                                <dd class="property-value" aria-labelledby="status-label">
                                <g:if test="${solicitacaoCompraInstance.isEmAberto()}">
                                        <span class="label label-info">${solicitacaoCompraInstance.getStatusStr()}</span>
                                </g:if>
                                <g:if test="${solicitacaoCompraInstance.isCancelada()}">
                                        <span class="label label-danger">${solicitacaoCompraInstance.getStatusStr()}</span>
                                </g:if>
                                <g:if test="${solicitacaoCompraInstance.isConcluida()}">
                                        <span class="label label-success">${solicitacaoCompraInstance.getStatusStr()}</span>
                                </g:if>
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
                <div class="modal fade" id="modal-novo-produto" tabindex="-1" role="dialog" aria-labelledby="#modal-novo-produto-label" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title" id="modal-novo-produto-label">
                                    Novo item de produto
                                </h3>
                            </div>
                            <div class="modal-body text-left">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                                        <label for="valorTotal">
                                            Produto
                                            <span class="required-indicator">*</span>
                                        </label>
                                        <select class="form-control" name="produto">
                                            <option value="1">Produto 1</option>
                                            <option value="2">Produto 2</option>
                                            <option value="3">Produto 3</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                                        <label for="valorTotal">
                                            Quantidade
                                            <span class="required-indicator">*</span>
                                        </label>
                                        <input type="number" class="form-control"/>
                                    </div>
                                </div>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                <button type="button" class="btn btn-primary">Salvar</button>
                            </div>
                        </div>
                    </div>
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
                    <th colspan="2">
                        Total
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <a href="#">Produto Sample</a>
                    </td>
                    <td>
                        R$ 20,00
                    </td>
                    <td>
                        5
                    </td>
                    <td>
                        R$ 100,00
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="#">Produto Sample</a>
                    </td>
                    <td>
                        R$ 20,00
                    </td>
                    <td>
                        5
                    </td>
                    <td>
                        R$ 100,00
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="#">Produto Sample</a>
                    </td>
                    <td>
                        R$ 20,00
                    </td>
                    <td>
                        5
                    </td>
                    <td>
                        R$ 100,00
                    </td>

                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="2">
                        Total
                    </th>
                    <th>
                        5
                    </th>
                    <th colspan="2">
                        R$ 300,00
                    </th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
                        <g:form url="[resource:solicitacaoCompraInstance, action:'delete']" method="DELETE">
                          <g:if test="${solicitacaoCompraInstance.isEmAberto()}">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${solicitacaoCompraInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                <g:actionSubmit class="btn btn-lg btn-success" action="complete" 
                                value="${message(code: 'default.button.complete.label', default: 'Concluir')}"
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

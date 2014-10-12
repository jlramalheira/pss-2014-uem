
<%@ page import="renk.gerenciamentoTransacoes.Venda" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
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
                    <div id="show-venda" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list venda">
                            
                            <g:if test="${vendaInstance?.pessoa}">
                                <dt id="pessoa-label" class="property-label">
                                        <g:message code="venda.pessoa.label" default="Pessoa" />
                                </dt>
                                <dd class="property-value" aria-labelledby="pessoa-label">
                                    
                                        <g:link controller="pessoa" action="show" id="${vendaInstance?.pessoa?.id}">
                                            ${vendaInstance?.pessoa?.encodeAsHTML()}
                                        </g:link>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${vendaInstance?.dataTransacao}">
                                <dt id="dataTransacao-label" class="property-label">
                                        <g:message code="venda.dataTransacao.label" default="Data Transacao" />
                                </dt>
                                <dd class="property-value" aria-labelledby="dataTransacao-label">
                                    
                                        <g:formatDate date="${vendaInstance?.dataTransacao}" format="dd/MM/yyyy" />
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${vendaInstance?.quantidadeTotal}">
                                <dt id="quantidadeTotal-label" class="property-label">
                                        <g:message code="venda.quantidadeTotal.label" default="Quantidade Total" />
                                </dt>
                                <dd class="property-value" aria-labelledby="quantidadeTotal-label">
                                    
                                        <g:fieldValue bean="${vendaInstance}" field="quantidadeTotal"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${vendaInstance?.valorTotal}">
                                <dt id="valorTotal-label" class="property-label">
                                        <g:message code="venda.valorTotal.label" default="Valor Total" />
                                </dt>
                                <dd class="property-value" aria-labelledby="valorTotal-label">
                                    
                                        <g:fieldValue bean="${vendaInstance}" field="valorTotal"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${vendaInstance?.status}">
                                <dt id="status-label" class="property-label">
                                        <g:message code="venda.status.label" default="Status" />
                                </dt>
                                <dd class="property-value" aria-labelledby="status-label">
                                    
                                    <g:if test="${vendaInstance.isEmAberto()}">
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
                                                15
                                            </th>
                                            <th>
                                                R$ 300,00
                                            </th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row margin-top-sm">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <table class="table table-hover table-striped table-responsive">
                                    <caption class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                                            <h2 class="margin-top-zero">Lista de Serviços</h2>
                                        </div>
                                    </caption>
                                    <thead>
                                        <tr>
                                            <th>
                                                Serviço
                                            </th>
                                            <th>
                                                Preço do Serviço
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
                                        <tr>
                                            <td>
                                                <a href="#">Serviço Sample</a>
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
                                                <a href="#">Serviço Sample</a>
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
                                                15
                                            </th>
                                            <th>
                                                R$ 300,00
                                            </th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>

                        
                        
                        
                        
                        
                        
                        <g:form url="[resource:vendaInstance, action:'delete']" method="DELETE">
                            <g:if test="${vendaInstance.isEmAberto()}">
                            <fieldset class="buttons">                                
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${vendaInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                <g:actionSubmit class="btn btn-lg btn-success" action="finalizer" 
                                value="${message(code: 'default.button.complete.label', default: 'Finalizar')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                <g:actionSubmit class="btn btn-lg btn-danger" action="cancel" 
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
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
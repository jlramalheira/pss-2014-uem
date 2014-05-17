
<%@ page import="renk.gerenciamentoProdutos.Produto" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
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
                    <div id="show-produto" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <ol class="property-list produto">
                            
                            <g:if test="${produtoInstance?.nome}">
                                <li class="fieldcontain">
                                    <span id="nome-label" class="property-label"><g:message code="produto.nome.label" default="Nome" /></span>
                                    
                                    <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${produtoInstance}" field="nome"/></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${produtoInstance?.descricao}">
                                <li class="fieldcontain">
                                    <span id="descricao-label" class="property-label"><g:message code="produto.descricao.label" default="Descricao" /></span>
                                    
                                    <span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${produtoInstance}" field="descricao"/></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${produtoInstance?.estoqueMinimo}">
                                <li class="fieldcontain">
                                    <span id="estoqueMinimo-label" class="property-label"><g:message code="produto.estoqueMinimo.label" default="Estoque Minimo" /></span>
                                    
                                    <span class="property-value" aria-labelledby="estoqueMinimo-label"><g:fieldValue bean="${produtoInstance}" field="estoqueMinimo"/></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${produtoInstance?.estoqueDesejavel}">
                                <li class="fieldcontain">
                                    <span id="estoqueDesejavel-label" class="property-label"><g:message code="produto.estoqueDesejavel.label" default="Estoque Desejavel" /></span>
                                    
                                    <span class="property-value" aria-labelledby="estoqueDesejavel-label"><g:fieldValue bean="${produtoInstance}" field="estoqueDesejavel"/></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${produtoInstance?.valor}">
                                <li class="fieldcontain">
                                    <span id="valor-label" class="property-label"><g:message code="produto.valor.label" default="Valor" /></span>
                                    
                                    <span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${produtoInstance}" field="valor"/></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${produtoInstance?.saldo}">
                                <li class="fieldcontain">
                                    <span id="saldo-label" class="property-label"><g:message code="produto.saldo.label" default="Saldo" /></span>
                                    
                                    <span class="property-value" aria-labelledby="saldo-label"><g:fieldValue bean="${produtoInstance}" field="saldo"/></span>
                                    
                                </li>
                            </g:if>
                            
                        </ol>
                        <g:form url="[resource:produtoInstance, action:'delete']" method="DELETE">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${produtoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                <g:actionSubmit class="btn btn-lg btn-danger" action="delete" 
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

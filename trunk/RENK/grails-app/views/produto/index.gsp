
<%@ page import="renk.gerenciamentoProdutos.Produto" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
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
                    <div id="list-produto" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="nome" title="${message(code: 'produto.nome.label', default: 'Nome')}" />
                                        
                                        <g:sortableColumn property="descricao" title="${message(code: 'produto.descricao.label', default: 'Descricao')}" />
                                        
                                        <g:sortableColumn property="estoqueMinimo" title="${message(code: 'produto.estoqueMinimo.label', default: 'Estoque Minimo')}" />
                                        
                                        <g:sortableColumn property="estoqueDesejavel" title="${message(code: 'produto.estoqueDesejavel.label', default: 'Estoque Desejavel')}" />
                                        
                                        <g:sortableColumn property="valor" title="${message(code: 'produto.valor.label', default: 'Valor')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${produtoInstanceList}" status="i" var="produtoInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${produtoInstance.id}">${fieldValue(bean: produtoInstance, field: "nome")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: produtoInstance, field: "descricao")}</td>
                                        
                                        <td>${fieldValue(bean: produtoInstance, field: "estoqueMinimo")}</td>
                                        
                                        <td>${fieldValue(bean: produtoInstance, field: "estoqueDesejavel")}</td>
                                        
                                        <td>${fieldValue(bean: produtoInstance, field: "valor")}</td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${produtoInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>
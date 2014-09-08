
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
                        <g:form url="[resource:produtoInstance, action:'index']" method="GET"
                            class="well well-lg">
                            <div class="row">
                                <div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
                                    <label for="nome">
                                        <g:message code="produto.nome" default="Nome" />
                                    </label>
                                    <g:textField name="nome" value="${params.nome}"class="form-control" />

                                </div>
                            </div>
                            <div class="form-more-options" id="produto-search">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                        <label for="descricao">
                                            <g:message code="produto.descricao" default="Descricao" />
                                        </label>
                                        <g:textField name="descricao" value="${params.descricao}"class="form-control" />

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <label for="telefone">
                                            <g:message code="produto.status.label" default="Status" />

                                        </label>
                                        <g:select name="status" from="['Ativo','Inativo']" value="${params.ativo}"
                                                  noSelection="['':' ']"/>

                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <g:actionSubmit class="btn btn-lg btn-primary" action="index" 
                                value="${message(code: 'default.button.search.label', default: 'Search')}" />
                                <button type="button" class="btn btn-lg btn-default" data-toggle="#produto-search">
                                    Mais opções
                                </button>
                            </div>
                        </g:form>
                        <g:if test="${flash.message}">
                        <div  class="alert alert-info alert-dismissable" role="status">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${flash.message}
                        </div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="nome" title="${message(code: 'produto.nome.label', default: 'Nome')}" />
                                        
                                        <g:sortableColumn property="descricao" title="${message(code: 'produto.descricao.label', default: 'Descricao')}" />
                                        
                                        <g:sortableColumn property="estoqueMinimo" title="${message(code: 'produto.estoqueMinimo.label', default: 'Estoque Minimo')}" />
                                        
                                        <g:sortableColumn property="estoqueDesejavel" title="${message(code: 'produto.estoqueDesejavel.label', default: 'Estoque Desejavel')}" />
                                        
                                        <g:sortableColumn property="valor" title="${message(code: 'produto.valor.label', default: 'Valor')}" />
                                        <g:sortableColumn property="saldo" title="${message(code: 'produto.saldo.label', default: 'Saldo')}" />
                                        <g:sortableColumn property="ativo" title="${message(code: 'produto.ativo.label', default: 'Status')}" />
                                        
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
                                        <td>${fieldValue(bean: produtoInstance, field: "saldo")}</td>
                                        <td>
                                            <g:if test="${produtoInstance.ativo}">
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
                            <g:paginate total="${produtoInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

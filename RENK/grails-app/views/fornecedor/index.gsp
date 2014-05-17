
<%@ page import="renk.gerenciamentoPessoas.Fornecedor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'fornecedor.label', default: 'Fornecedor')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="nav-main"/>
        <div class="container-fluid">
            <div class="row">
                <nav class="subnav col-xs-12 col-sm-2 col-md-2 col-lg-2">

                </nav>
                <section class="content col-xs-12 col-sm-10 col-md-10 col-lg-10">
                    <div id="list-fornecedor" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="nome" title="${message(code: 'fornecedor.nome.label', default: 'Nome')}" />
                                        
                                        <g:sortableColumn property="email" title="${message(code: 'fornecedor.email.label', default: 'Email')}" />
                                        
                                        <g:sortableColumn property="telefone" title="${message(code: 'fornecedor.telefone.label', default: 'Telefone')}" />
                                        
                                        <g:sortableColumn property="celular" title="${message(code: 'fornecedor.celular.label', default: 'Celular')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${fornecedorInstanceList}" status="i" var="fornecedorInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${fornecedorInstance.id}">${fieldValue(bean: fornecedorInstance, field: "nome")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: fornecedorInstance, field: "email")}</td>
                                        
                                        <td>${fieldValue(bean: fornecedorInstance, field: "telefone")}</td>
                                        
                                        <td>${fieldValue(bean: fornecedorInstance, field: "celular")}</td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${fornecedorInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

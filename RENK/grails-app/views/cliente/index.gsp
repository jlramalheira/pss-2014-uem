
<%@ page import="renk.gerenciamentoPessoas.Cliente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
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
                    <div id="list-cliente" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    
                                    <th><g:message code="cliente.tipoPessoa.label" default="Tipo Pessoa" /></th>
                                        
                                        <g:sortableColumn property="nome" title="${message(code: 'cliente.nome.label', default: 'Nome')}" />
                                        
                                        <g:sortableColumn property="email" title="${message(code: 'cliente.email.label', default: 'Email')}" />
                                        
                                        <g:sortableColumn property="telefone" title="${message(code: 'cliente.telefone.label', default: 'Telefone')}" />
                                        
                                        <g:sortableColumn property="celular" title="${message(code: 'cliente.celular.label', default: 'Celular')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "tipoPessoa")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: clienteInstance, field: "nome")}</td>
                                        
                                        <td>${fieldValue(bean: clienteInstance, field: "email")}</td>
                                        
                                        <td>${fieldValue(bean: clienteInstance, field: "telefone")}</td>
                                        
                                        <td>${fieldValue(bean: clienteInstance, field: "celular")}</td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${clienteInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

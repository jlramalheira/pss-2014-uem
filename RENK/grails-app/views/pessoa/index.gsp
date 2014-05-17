
<%@ page import="renk.gerenciamentoPessoas.Pessoa" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
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
                    <div id="list-pessoa" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    
                                    <th><g:message code="pessoa.tipoPessoa.label" default="Tipo Pessoa" /></th>
                                        
                                        <g:sortableColumn property="nome" title="${message(code: 'pessoa.nome.label', default: 'Nome')}" />
                                        
                                        <g:sortableColumn property="email" title="${message(code: 'pessoa.email.label', default: 'Email')}" />
                                        
                                        <g:sortableColumn property="telefone" title="${message(code: 'pessoa.telefone.label', default: 'Telefone')}" />
                                        
                                        <g:sortableColumn property="celular" title="${message(code: 'pessoa.celular.label', default: 'Celular')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${pessoaInstanceList}" status="i" var="pessoaInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${pessoaInstance.id}">${fieldValue(bean: pessoaInstance, field: "tipoPessoa")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: pessoaInstance, field: "nome")}</td>
                                        
                                        <td>${fieldValue(bean: pessoaInstance, field: "email")}</td>
                                        
                                        <td>${fieldValue(bean: pessoaInstance, field: "telefone")}</td>
                                        
                                        <td>${fieldValue(bean: pessoaInstance, field: "celular")}</td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${pessoaInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

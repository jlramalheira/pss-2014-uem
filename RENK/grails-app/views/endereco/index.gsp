
<%@ page import="renk.gerenciamentoPessoas.Endereco" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
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
                    <div id="list-endereco" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="tipo" title="${message(code: 'endereco.tipo.label', default: 'Tipo')}" />
                                        
                                        <g:sortableColumn property="logradouro" title="${message(code: 'endereco.logradouro.label', default: 'Logradouro')}" />
                                        
                                        <g:sortableColumn property="numero" title="${message(code: 'endereco.numero.label', default: 'Numero')}" />
                                        
                                        <g:sortableColumn property="complemento" title="${message(code: 'endereco.complemento.label', default: 'Complemento')}" />
                                        
                                        <g:sortableColumn property="bairro" title="${message(code: 'endereco.bairro.label', default: 'Bairro')}" />
                                        
                                        <g:sortableColumn property="cep" title="${message(code: 'endereco.cep.label', default: 'Cep')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${enderecoInstanceList}" status="i" var="enderecoInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${enderecoInstance.id}">${fieldValue(bean: enderecoInstance, field: "tipo")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: enderecoInstance, field: "logradouro")}</td>
                                        
                                        <td>${fieldValue(bean: enderecoInstance, field: "numero")}</td>
                                        
                                        <td>${fieldValue(bean: enderecoInstance, field: "complemento")}</td>
                                        
                                        <td>${fieldValue(bean: enderecoInstance, field: "bairro")}</td>
                                        
                                        <td>${fieldValue(bean: enderecoInstance, field: "cep")}</td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${enderecoInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

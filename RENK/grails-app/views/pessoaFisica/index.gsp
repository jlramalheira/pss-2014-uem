
<%@ page import="renk.gerenciamentoPessoas.PessoaFisica" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'pessoaFisica.label', default: 'PessoaFisica')}" />
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
                    <div id="list-pessoaFisica" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                        <div  class="alert alert-info alert-dismissable" role="status">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${flash.message}
                        </div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="cpf" title="${message(code: 'pessoaFisica.cpf.label', default: 'Cpf')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${pessoaFisicaInstanceList}" status="i" var="pessoaFisicaInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${pessoaFisicaInstance.id}">${fieldValue(bean: pessoaFisicaInstance, field: "cpf")}</g:link></td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${pessoaFisicaInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

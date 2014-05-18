
<%@ page import="renk.gerenciamentoProdutos.Promocao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'promocao.label', default: 'Promocao')}" />
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
                    <div id="list-promocao" role="main">
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
                                    
                                        <g:sortableColumn property="nome" title="${message(code: 'promocao.nome.label', default: 'Nome')}" />
                                        
                                        <g:sortableColumn property="dataInicio" title="${message(code: 'promocao.dataInicio.label', default: 'Data Inicio')}" />
                                        
                                        <g:sortableColumn property="dataFim" title="${message(code: 'promocao.dataFim.label', default: 'Data Fim')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${promocaoInstanceList}" status="i" var="promocaoInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${promocaoInstance.id}">${fieldValue(bean: promocaoInstance, field: "nome")}</g:link></td>
                                        
                                        <td><g:formatDate format="dd/MM/yyyy" date="${promocaoInstance.dataInicio}" /></td>
                                        
                                        <td><g:formatDate format="dd/MM/yyyy" date="${promocaoInstance.dataFim}" /></td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="${promocaoInstanceCount ?: 0}" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
 </html>

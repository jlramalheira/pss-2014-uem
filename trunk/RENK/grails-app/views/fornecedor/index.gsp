
<%@ page import="renk.gerenciamentoPessoas.Fornecedor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'fornecedor.label', default: 'Fornecedor')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-fornecedor" class="sr-only">
            <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
        </a>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${createLink(uri: '/')}">
                        RENK
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="main-navigation">
                    <ul class="nav navbar-nav">
                        <li>
                            <g:link controller="venda" action="index">
                                Vendas
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="compra" action="index">
                                Compras
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="produto" action="index">
                                Produtos
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="cliente" action="index">
                                Clientes
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="fornecedor" action="index">
                                Fornecedores
                            </g:link>                            
                        </li>
                        <li>
                            <g:link controller="servicos" action="index">
                                Serviços
                            </g:link>
                        </li>                     
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">RH</a>
                        </li>                    
                        <li><a href="#">Sair</a></li>                     
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                       <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                           </ul>
                           </div>
                           <div id="list-fornecedor" class="content scaffold-list" role="main">
                       <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table>
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
                        </body>
                        </html>

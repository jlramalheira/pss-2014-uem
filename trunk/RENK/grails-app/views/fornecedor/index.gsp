
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
                <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <g:render template="nav-sub"/>
                </nav>
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <div id="list-fornecedor" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:form url="[resource:fornecedorInstance, action:'index']" method="GET"
                            class="well well-lg">
                            <div class="row">
                                <div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
                                    <label for="nome">
                                        <g:message code="fornecedor.nome.label" default="Nome" />
                                    </label>
                                    <g:textField name="nome" value="${params.nome}"class="form-control" />

                                </div>
                            </div>
                            <div class="form-more-options" id="fornecedor-search">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                        <label for="cnpj">
                                            <g:message code="pessoaJuridica.cnpj.label" default="Cnpj" />
                                        </label>
                                        <g:textField name="pessoaJuridica.cnpj" value="${params.pessoaJuridica.cnpj}"class="form-control" />

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <label for="inscricaoEstadual">
                                            <g:message code="pessoaJuridica.inscricaoEstadual.label" default="Inscricao Estadual" />

                                        </label>
                                        <g:textField name="pessoaJuridica.inscricaoEstadual" value="${params.pessoaJuridica.inscricaoEstadual}"class="form-control" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4 ">
                                        <label for="email">
                                            <g:message code="fornecedor.email.label" default="Email" />

                                        </label>
                                        <g:field type="email" class="form-control" name="email" value="${params.email}"class="form-control" />

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <label for="telefone">
                                            <g:message code="fornecedor.telefone.label" default="Telefone" />

                                        </label>
                                        <g:textField name="telefone" maxlength="15" value="${params.telefone}"class="form-control" />

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <label for="celular">
                                            <g:message code="fornecedor.celular.label" default="Celular" />

                                        </label>
                                        <g:textField name="celular" maxlength="15" value="${params.celular}"class="form-control" />

                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <g:actionSubmit class="btn btn-lg btn-primary" action="index" 
                                value="${message(code: 'default.button.search.label', default: 'Search')}" />
                                <button type="button" class="btn btn-lg btn-default" data-toggle="#fornecedor-search">
                                    Mais opções
                                </button>
                            </div>
                        </g:form>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismiss" role="status">
                                <button type="button" class="close" data-dismiss="alert">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">Fechar</span>
                                </button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <g:if test="${request.message_info}">
                            <div class="alert alert-info alert-dismiss" role="status">
                                <button type="button" class="close" data-dismiss="alert">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">Fechar</span>
                                </button>
                                ${request.message_info}
                            </div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>

                                    <g:sortableColumn property="nome" title="${message(code: 'fornecedor.nome.label', default: 'Nome')}" />

                                    <th><g:message code="pessoaJuridica.cnpj.label" default="CNPJ" /></th>                                        

                                    <th><g:message code="pessoaJuridica.cnpj.label" default="Inscricao Estadual" /></th> 

                                        <g:sortableColumn property="email" title="${message(code: 'fornecedor.email.label', default: 'Email')}" />

                                        <g:sortableColumn property="telefone" title="${message(code: 'fornecedor.telefone.label', default: 'Telefone')}" />

                                        <g:sortableColumn property="celular" title="${message(code: 'fornecedor.celular.label', default: 'Celular')}" />

                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${fornecedorInstanceList}" status="i" var="fornecedorInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                        <td><g:link action="show" id="${fornecedorInstance.id}">${fieldValue(bean: fornecedorInstance, field: "nome")}</g:link></td>

                                        <td>${fieldValue(bean: fornecedorInstance.pessoaJuridica, field: "cnpj")}</td>

                                        <td>${fieldValue(bean: fornecedorInstance.pessoaJuridica, field: "inscricaoEstadual")}</td>

                                        <td>${fieldValue(bean: fornecedorInstance, field: "email")}</td>

                                        <td>${fieldValue(bean: fornecedorInstance, field: "telefone")}</td>

                                        <td>${fieldValue(bean: fornecedorInstance, field: "celular")}</td>

                                        <td>
                                            <g:if test="${fornecedorInstance.isAtivo()}">
                                                <span class="label label-success">
                                                    Ativo
                                                </span>
                                            </g:if>
                                            <g:else>
                                                <span class="label label-danger">
                                                    Inativo
                                                </span>
                                            </g:else>
                                        </td>

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

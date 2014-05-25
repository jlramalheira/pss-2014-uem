
<%@ page import="renk.gerenciamentoPessoas.Fornecedor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'fornecedor.label', default: 'Fornecedor')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="nav-main"/>
        <div class="container-fluid">
            <div class="row">
                <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <g:render template="nav-sub"/>
                </nav>
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <div id="show-fornecedor" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list fornecedor">

                            <dt>
                                Status
                            </dt>
                            <dd>
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
                            </dd>

                            <g:if test="${fornecedorInstance?.nome}">
                                <dt id="nome-label" class="property-label">
                                <g:message code="fornecedor.nome.label" default="Nome" />
                                </dt>
                                <dd class="property-value" aria-labelledby="nome-label">

                                    <g:fieldValue bean="${fornecedorInstance}" field="nome"/>

                                </dd>
                            </g:if>

                            <g:if test="${fornecedorInstance?.pessoaJuridica?.cnpj}">

                                <dt id="cnpj-label" class="property-label">
                                <g:message code="pessoaJuridica.cnpj.label" default="CNPJ" />
                                </dt>
                                <dd class="property-value" aria-labelledby="cnpj-label">

                                    <g:fieldValue bean="${fornecedorInstance.pessoaJuridica}" field="cnpj"/>

                                </dd>
                            </g:if>
                            <g:if test="${fornecedorInstance?.pessoaJuridica?.inscricaoEstadual}">

                                <dt id="inscricaoEstadual-label" class="property-label">
                                <g:message code="pessoaJuridica.inscricaoEstadual.label" default="Inscrição Estadual" />
                                </dt>
                                <dd class="property-value" aria-labelledby="inscricaoEstadual-label">

                                    <g:fieldValue bean="${fornecedorInstance.pessoaJuridica}" field="inscricaoEstadual"/>

                                </dd>
                            </g:if>
                            <g:if test="${fornecedorInstance?.email}">
                                <dt id="email-label" class="property-label">
                                <g:message code="fornecedor.email.label" default="Email" />
                                </dt>
                                <dd class="property-value" aria-labelledby="email-label">

                                    <g:fieldValue bean="${fornecedorInstance}" field="email"/>

                                </dd>
                            </g:if>

                            <g:if test="${fornecedorInstance?.telefone}">
                                <dt id="telefone-label" class="property-label">
                                <g:message code="fornecedor.telefone.label" default="Telefone" />
                                </dt>
                                <dd class="property-value" aria-labelledby="telefone-label">

                                    <g:fieldValue bean="${fornecedorInstance}" field="telefone"/>

                                </dd>
                            </g:if>

                            <g:if test="${fornecedorInstance?.celular}">
                                <dt id="celular-label" class="property-label">
                                <g:message code="fornecedor.celular.label" default="Celular" />
                                </dt>
                                <dd class="property-value" aria-labelledby="celular-label">

                                    <g:fieldValue bean="${fornecedorInstance}" field="celular"/>

                                </dd>
                            </g:if>

                            <g:if test="${fornecedorInstance?.enderecos}">
                                <dt id="enderecos-label" class="property-label">
                                <g:message code="fornecedor.enderecos.label" default="Enderecos" />
                                </dt>
                                <dd class="property-value" aria-labelledby="enderecos-label">

                                    <g:each in="${fornecedorInstance.enderecos}" var="e">
                                        <g:link controller="endereco" action="show" id="${e.id}"
                                            params="['fornecedor.id': fornecedorInstance?.id]">
                                            ${e?.encodeAsHTML()}
                                        </g:link>
                                        <br/>
                                    </g:each>                                    
                                </dd>
                            </g:if>                            
                        </dl>

                        <g:if test="${fornecedorInstance.isAtivo()}">
                        <g:link controller="endereco" action="create" class="btn btn-default"
                            params="['fornecedor.id': fornecedorInstance?.id]">
                            ${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}
                        </g:link>
                        </g:if>
                                
                                
                        <g:form url="[resource:fornecedorInstance, action:'delete']" method="DELETE">
                            <fieldset class="buttons">
                                <g:if test="${fornecedorInstance.isAtivo()}">
                                    <legend>Opções</legend>
                                    <g:link class="btn btn-lg btn-primary"  action="edit" resource="${fornecedorInstance}">
                                        <g:message code="default.button.edit.label" default="Edit" />
                                    </g:link>
                                </g:if>
                                <g:if test="${fornecedorInstance.isAtivo()}">
                                    <g:actionSubmit class="btn btn-lg btn-danger" action="inactivate" 
                                    value="${message(code: 'default.button.inativate.label', default: 'Inactivate')}"
                                    onclick="return confirm('${message(code: 'default.button.inativate.confirm.message.cliente', default: 'Are you sure?')}');" />
                                </g:if>
                                <g:else>
                                    <g:actionSubmit class="btn btn-lg btn-danger" action="activate" 
                                    value="${message(code: 'default.button.ativate.label', default: 'Activate')}"
                                    onclick="return confirm('${message(code: 'default.button.ativate.confirm.message.cliente', default: 'Are you sure?')}');" />                                    
                                </g:else>
                            </fieldset>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

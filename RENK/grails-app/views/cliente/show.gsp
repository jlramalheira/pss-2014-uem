
<%@ page import="renk.gerenciamentoPessoas.Cliente" %>
<%@ page import="renk.gerenciamentoPessoas.PessoaFisica" %>
<%@ page import="renk.gerenciamentoPessoas.PessoaJuridica" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
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
                    <div id="show-cliente" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>
                        <dl class="dl-horizontal property-list cliente">
                            
                            <g:if test="${clienteInstance?.nome}">
                                <dt id="nome-label" class="property-label">
                                        <g:message code="cliente.nome.label" default="Nome" />
                                </dt>
                                <dd class="property-value" aria-labelledby="nome-label">
                                    
                                        <g:fieldValue bean="${clienteInstance}" field="nome"/>
                                    
                                </dd>
                            </g:if>
                            <g:if test="${clienteInstance?.tipoPessoa instanceof PessoaFisica}">
                                <dt id="cpf-label" class="property-label">
                                        <g:message code="pessoaFisica.cpf.label" default="CPF" />
                                </dt>
                                <dd class="property-value" aria-labelledby="cpf-label">
                                    
                                        <g:fieldValue bean="${clienteInstance.tipoPessoa}" field="cpf"/>
                                    
                                </dd>
                            </g:if>
                            <g:if test="${clienteInstance?.tipoPessoa instanceof PessoaJuridica}">
                                <g:if test="${clienteInstance?.tipoPessoa?.cnpj}">
                                    
                                    <dt id="cnpj-label" class="property-label">
                                            <g:message code="pessoaJuridica.cnpj.label" default="CNPJ" />
                                    </dt>
                                    <dd class="property-value" aria-labelledby="cnpj-label">

                                            <g:fieldValue bean="${clienteInstance.tipoPessoa}" field="cnpj"/>

                                    </dd>
                                </g:if>
                                <g:if test="${clienteInstance?.tipoPessoa?.inscricaoEstadual}">
                                    
                                    <dt id="inscricaoEstadual-label" class="property-label">
                                            <g:message code="pessoaJuridica.inscricaoEstadual.label" default="Inscrição Estadual" />
                                    </dt>
                                    <dd class="property-value" aria-labelledby="inscricaoEstadual-label">

                                            <g:fieldValue bean="${clienteInstance.tipoPessoa}" field="inscricaoEstadual"/>

                                    </dd>
                                </g:if>
                            </g:if>
                            
                            <g:if test="${clienteInstance?.email}">
                                <dt id="email-label" class="property-label">
                                        <g:message code="cliente.email.label" default="Email" />
                                </dt>
                                <dd class="property-value" aria-labelledby="email-label">
                                    
                                        <g:fieldValue bean="${clienteInstance}" field="email"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${clienteInstance?.telefone}">
                                <dt id="telefone-label" class="property-label">
                                        <g:message code="cliente.telefone.label" default="Telefone" />
                                </dt>
                                <dd class="property-value" aria-labelledby="telefone-label">
                                    
                                        <g:fieldValue bean="${clienteInstance}" field="telefone"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${clienteInstance?.celular}">
                                <dt id="celular-label" class="property-label">
                                        <g:message code="cliente.celular.label" default="Celular" />
                                </dt>
                                <dd class="property-value" aria-labelledby="celular-label">
                                    
                                        <g:fieldValue bean="${clienteInstance}" field="celular"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${clienteInstance?.enderecos}">
                                <dt id="enderecos-label" class="property-label">
                                        <g:message code="cliente.enderecos.label" default="Enderecos" />
                                </dt>
                                <dd class="property-value" aria-labelledby="enderecos-label">
                                    
                                        <g:each in="${clienteInstance.enderecos}" var="e">
                                           <g:link controller="endereco" action="show" id="${e.id}"
                                               params="['cliente.id': clienteInstance?.id]">
                                               ${e?.encodeAsHTML()}
                                           </g:link>
                                           <br/>
                                        </g:each>
                                    
                                </dd>
                            </g:if>                                                        
                            
                        </dl>
                        <g:link controller="endereco" action="create" class="btn btn-default"
                            params="['cliente.id': clienteInstance?.id]">
                            ${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}
                        </g:link>
                        <g:form url="[resource:clienteInstance, action:'delete']" method="DELETE">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-primary"  action="edit" resource="${clienteInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                <g:actionSubmit class="btn btn-lg btn-danger" action="delete" 
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

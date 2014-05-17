
<%@ page import="renk.gerenciamentoPessoas.Pessoa" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
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
                    <div id="show-pessoa" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <ol class="property-list pessoa">
                            
                            <g:if test="${pessoaInstance?.tipoPessoa}">
                                <li class="fieldcontain">
                                    <span id="tipoPessoa-label" class="property-label"><g:message code="pessoa.tipoPessoa.label" default="Tipo Pessoa" /></span>
                                    
                                    <span class="property-value" aria-labelledby="tipoPessoa-label"><g:link controller="tipoPessoa" action="show" id="${pessoaInstance?.tipoPessoa?.id}">${pessoaInstance?.tipoPessoa?.encodeAsHTML()}</g:link></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${pessoaInstance?.nome}">
                                <li class="fieldcontain">
                                    <span id="nome-label" class="property-label"><g:message code="pessoa.nome.label" default="Nome" /></span>
                                    
                                    <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${pessoaInstance}" field="nome"/></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${pessoaInstance?.email}">
                                <li class="fieldcontain">
                                    <span id="email-label" class="property-label"><g:message code="pessoa.email.label" default="Email" /></span>
                                    
                                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${pessoaInstance}" field="email"/></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${pessoaInstance?.telefone}">
                                <li class="fieldcontain">
                                    <span id="telefone-label" class="property-label"><g:message code="pessoa.telefone.label" default="Telefone" /></span>
                                    
                                    <span class="property-value" aria-labelledby="telefone-label"><g:fieldValue bean="${pessoaInstance}" field="telefone"/></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${pessoaInstance?.celular}">
                                <li class="fieldcontain">
                                    <span id="celular-label" class="property-label"><g:message code="pessoa.celular.label" default="Celular" /></span>
                                    
                                    <span class="property-value" aria-labelledby="celular-label"><g:fieldValue bean="${pessoaInstance}" field="celular"/></span>
                                    
                                </li>
                            </g:if>
                            
                            <g:if test="${pessoaInstance?.enderecos}">
                                <li class="fieldcontain">
                                    <span id="enderecos-label" class="property-label"><g:message code="pessoa.enderecos.label" default="Enderecos" /></span>
                                    
                                    <g:each in="${pessoaInstance.enderecos}" var="e">
                                        <span class="property-value" aria-labelledby="enderecos-label"><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
                                    </g:each>
                                    
                                </li>
                            </g:if>
                            
                        </ol>
                        <g:form url="[resource:pessoaInstance, action:'delete']" method="DELETE">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <g:link class="btn btn-lg btn-default"  action="edit" resource="${pessoaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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


<%@ page import="renk.gerenciamentoPessoas.Endereco" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
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
                    <div id="show-endereco" class="scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="alert alert-info alert-dismissable" role="status">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flash.message}
                            </div>
                        </g:if>                        
                        <dl class="dl-horizontal property-list endereco">
                            
                            <g:if test="${enderecoInstance?.tipo}">
                                <dt id="tipo-label" class="property-label">
                                        <g:message code="endereco.tipo.label" default="Tipo" />
                                </dt>
                                <dd class="property-value" aria-labelledby="tipo-label">
                                    
                                        <g:fieldValue bean="${enderecoInstance}" field="tipo"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${enderecoInstance?.logradouro}">
                                <dt id="logradouro-label" class="property-label">
                                        <g:message code="endereco.logradouro.label" default="Logradouro" />
                                </dt>
                                <dd class="property-value" aria-labelledby="logradouro-label">
                                    
                                        <g:fieldValue bean="${enderecoInstance}" field="logradouro"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${enderecoInstance?.numero}">
                                <dt id="numero-label" class="property-label">
                                        <g:message code="endereco.numero.label" default="Numero" />
                                </dt>
                                <dd class="property-value" aria-labelledby="numero-label">
                                    
                                        <g:fieldValue bean="${enderecoInstance}" field="numero"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${enderecoInstance?.complemento}">
                                <dt id="complemento-label" class="property-label">
                                        <g:message code="endereco.complemento.label" default="Complemento" />
                                </dt>
                                <dd class="property-value" aria-labelledby="complemento-label">
                                    
                                        <g:fieldValue bean="${enderecoInstance}" field="complemento"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${enderecoInstance?.bairro}">
                                <dt id="bairro-label" class="property-label">
                                        <g:message code="endereco.bairro.label" default="Bairro" />
                                </dt>
                                <dd class="property-value" aria-labelledby="bairro-label">
                                    
                                        <g:fieldValue bean="${enderecoInstance}" field="bairro"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${enderecoInstance?.cep}">
                                <dt id="cep-label" class="property-label">
                                        <g:message code="endereco.cep.label" default="Cep" />
                                </dt>
                                <dd class="property-value" aria-labelledby="cep-label">
                                    
                                        <g:fieldValue bean="${enderecoInstance}" field="cep"/>
                                    
                                </dd>
                            </g:if>
                            
                            <g:if test="${enderecoInstance?.cidade}">
                                <dt id="cidade-label" class="property-label">
                                        <g:message code="endereco.cidade.label" default="Cidade" />
                                </dt>
                                <dd class="property-value" aria-labelledby="cidade-label">
                                    
                                        <g:link controller="cidade" action="show" id="${enderecoInstance?.cidade?.id}">
                                            ${enderecoInstance?.cidade?.encodeAsHTML()}
                                        </g:link>
                                    
                                </dd>
                            </g:if>
                            
                        </dl>
                        <g:form url="[resource:enderecoInstance, action:'edit']" method="PUT">
                            <fieldset class="buttons">
                                <legend>Opções</legend>
                                <input type="hidden" name="fornecedor.id" value="${params.fornecedor?.id}"/>
                                <input type="hidden" name="cliente.id" value="${params.cliente?.id}"/>
                                <input type="hidden" name="enderecoInstance.id" value="${enderecoInstance?.id}"/>
                                <%--<g:link class="btn btn-lg btn-primary"  action="edit" resource="${enderecoInstance}">
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>--%>
                                <g:actionSubmit class="btn btn-lg btn-primary" action="edit" 
                                value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                        </g:form>
                        <g:form url="[resource:enderecoInstance, action:'delete']" method="DELETE">
                                <g:actionSubmit class="btn btn-lg btn-danger" action="delete" 
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </g:form>
                            </fieldset>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

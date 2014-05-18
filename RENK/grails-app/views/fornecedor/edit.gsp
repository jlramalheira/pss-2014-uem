<%@ page import="renk.gerenciamentoPessoas.Fornecedor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'fornecedor.label', default: 'Fornecedor')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="nav-main"/>

        <div class="container-fluid">
            <div class="row">
                <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <g:render template="nav-sub"/>
                </nav>
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <div id="edit-fornecedor" class="scaffold-edit" role="main">
                       <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${fornecedorInstance}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${fornecedorInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form url="[resource:fornecedorInstance, action:'update']"
                                    method="PUT" >
                                    <g:hiddenField name="version" value="${fornecedorInstance?.version}" />
                                    <fieldset class="form">
                                        <g:render template="form"/>
                                        <g:link controller="endereco" action="create" class="btn btn-default"
                                        params="['fornecedor.id': fornecedorInstance?.id]">
                                            ${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}
                                        </g:link>
                                    </fieldset>
                                    <fieldset class="buttons">
                                        <g:actionSubmit class="btn btn-lg btn-primary" action="update" 
                                        value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                        <g:link controller="show"  resource="${fornecedorInstance}" 
                                             class="btn btn-lg btn-danger">
                                             Cancelar
                                        </g:link>
                                    </fieldset>
                                </g:form>
                                </div>                    
                </section>
            </div>
        </div>
</body>
</html>

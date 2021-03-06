<%@ page import="renk.gerenciamentoPessoas.Pessoa" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
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
                    <div id="edit-pessoa" class="scaffold-edit" role="main">
                       <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${pessoaInstance}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${pessoaInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form url="[resource:pessoaInstance, action:'update']"
                                    method="PUT" >
                                    <g:hiddenField name="version" value="${pessoaInstance?.version}" />
                                    <fieldset class="form">
                                        <g:render template="form"/>
                                    </fieldset>
                                    <fieldset class="buttons">
                                        <g:actionSubmit class="btn btn-lg btn-default" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                    </fieldset>
                                </g:form>
                                </div>                    
                </section>
            </div>
        </div>
</body>
</html>

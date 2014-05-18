<%@ page import="renk.gerenciamentoSolucao.Solucao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'solucao.label', default: 'Solucao')}" />
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
                    <div id="edit-solucao" class="scaffold-edit" role="main">
                       <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${solucaoInstance}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${solucaoInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form url="[resource:solucaoInstance, action:'update']"
                                    method="PUT" >
                                    <g:hiddenField name="version" value="${solucaoInstance?.version}" />
                                    <fieldset class="form">
                                        <g:render template="form"/>
                                    </fieldset>
                                    <fieldset class="buttons">
                                        <g:actionSubmit class="btn btn-lg btn-primary" action="update" 
                                        value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                        <g:link controller="show"  resource="${solucaoInstance}" 
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

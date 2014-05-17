<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'fornecedor.label', default: 'Fornecedor')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="nav-main"/>

        <div class="container-fluid">
            <div class="row">
                <nav class="subnav col-xs-12 col-sm-2 col-md-2 col-lg-2">

                </nav>
                <section class="content col-xs-12 col-sm-10 col-md-10 col-lg-10">
                    <div id="create-fornecedor" class="scaffold-create" role="main">
                        <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
                                <g:form url="[resource:fornecedorInstance, action:'save']" class="teste"
                                    >
                                    <fieldset class="form">
                                    <g:render template="form"/>
                                    </fieldset>
                                    <fieldset class="buttons">
                                        <g:submitButton name="create" class="btn btn-lg btn-default" 
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                                    </fieldset>
                                </g:form>
                                </div>
                            </section>
                        </div>
                    </div>

            </body>
        </html>

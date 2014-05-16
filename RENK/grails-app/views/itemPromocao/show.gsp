
<%@ page import="renk.gerenciamentoProdutos.ItemPromocao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemPromocao.label', default: 'ItemPromocao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-itemPromocao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-itemPromocao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list itemPromocao">
			
				<g:if test="${itemPromocaoInstance?.desconto}">
				<li class="fieldcontain">
					<span id="desconto-label" class="property-label"><g:message code="itemPromocao.desconto.label" default="Desconto" /></span>
					
						<span class="property-value" aria-labelledby="desconto-label"><g:fieldValue bean="${itemPromocaoInstance}" field="desconto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemPromocaoInstance?.produto}">
				<li class="fieldcontain">
					<span id="produto-label" class="property-label"><g:message code="itemPromocao.produto.label" default="Produto" /></span>
					
						<span class="property-value" aria-labelledby="produto-label"><g:link controller="produto" action="show" id="${itemPromocaoInstance?.produto?.id}">${itemPromocaoInstance?.produto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemPromocaoInstance?.promocao}">
				<li class="fieldcontain">
					<span id="promocao-label" class="property-label"><g:message code="itemPromocao.promocao.label" default="Promocao" /></span>
					
						<span class="property-value" aria-labelledby="promocao-label"><g:link controller="promocao" action="show" id="${itemPromocaoInstance?.promocao?.id}">${itemPromocaoInstance?.promocao?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:itemPromocaoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${itemPromocaoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

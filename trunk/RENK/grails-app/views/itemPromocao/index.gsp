
<%@ page import="renk.gerenciamentoProdutos.ItemPromocao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemPromocao.label', default: 'ItemPromocao')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemPromocao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemPromocao" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="desconto" title="${message(code: 'itemPromocao.desconto.label', default: 'Desconto')}" />
					
						<th><g:message code="itemPromocao.produto.label" default="Produto" /></th>
					
						<th><g:message code="itemPromocao.promocao.label" default="Promocao" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemPromocaoInstanceList}" status="i" var="itemPromocaoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemPromocaoInstance.id}">${fieldValue(bean: itemPromocaoInstance, field: "desconto")}</g:link></td>
					
						<td>${fieldValue(bean: itemPromocaoInstance, field: "produto")}</td>
					
						<td>${fieldValue(bean: itemPromocaoInstance, field: "promocao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemPromocaoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

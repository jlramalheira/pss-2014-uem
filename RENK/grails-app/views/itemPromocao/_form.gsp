<%@ page import="renk.gerenciamentoProdutos.ItemPromocao" %>



<div class="fieldcontain ${hasErrors(bean: itemPromocaoInstance, field: 'desconto', 'error')} required">
	<label for="desconto">
		<g:message code="itemPromocao.desconto.label" default="Desconto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="desconto" value="${fieldValue(bean: itemPromocaoInstance, field: 'desconto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemPromocaoInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="itemPromocao.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${renk.gerenciamentoProdutos.Produto.list()}" optionKey="id" required="" value="${itemPromocaoInstance?.produto?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemPromocaoInstance, field: 'promocao', 'error')} required">
	<label for="promocao">
		<g:message code="itemPromocao.promocao.label" default="Promocao" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="promocao" name="promocao.id" from="${renk.gerenciamentoProdutos.Promocao.list()}" optionKey="id" required="" value="${itemPromocaoInstance?.promocao?.id}" class="many-to-one"/>

</div>


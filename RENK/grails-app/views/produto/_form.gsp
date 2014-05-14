<%@ page import="renk.Produto" %>



<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="produto.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${produtoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="produto.descricao.label" default="Descricao" />
		
	</label>
	<g:textArea name="descricao" cols="40" rows="5" value="${produtoInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'estoqueMinimo', 'error')} required">
	<label for="estoqueMinimo">
		<g:message code="produto.estoqueMinimo.label" default="Estoque Minimo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estoqueMinimo" type="number" min="0" value="${produtoInstance.estoqueMinimo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'estoqueDesejavel', 'error')} required">
	<label for="estoqueDesejavel">
		<g:message code="produto.estoqueDesejavel.label" default="Estoque Desejavel" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estoqueDesejavel" type="number" min="0" value="${produtoInstance.estoqueDesejavel}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="produto.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: produtoInstance, field: 'valor')}" required=""/>

</div>


<%@ page import="renk.gerenciamentoServicos.Servico" %>



<div class="fieldcontain ${hasErrors(bean: servicoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="servico.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${servicoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="servico.descricao.label" default="Descricao" />
		
	</label>
	<g:textArea name="descricao" cols="40" rows="5" value="${servicoInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicoInstance, field: 'hora', 'error')} required">
	<label for="hora">
		<g:message code="servico.hora.label" default="Hora" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hora" type="number" value="${servicoInstance.hora}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicoInstance, field: 'minutos', 'error')} required">
	<label for="minutos">
		<g:message code="servico.minutos.label" default="Minutos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minutos" type="number" value="${servicoInstance.minutos}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="servico.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: servicoInstance, field: 'valor')}" required=""/>

</div>


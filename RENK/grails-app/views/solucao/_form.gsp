<%@ page import="renk.gerenciamentoSolucao.Solucao" %>



<div class="fieldcontain ${hasErrors(bean: solucaoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="solucao.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${solucaoInstance?.descricao}"/>

</div>


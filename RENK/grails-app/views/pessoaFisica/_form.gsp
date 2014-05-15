<%@ page import="renk.gerenciamentoPessoas.PessoaFisica" %>



<div class="fieldcontain ${hasErrors(bean: pessoaFisicaInstance, field: 'cpf', 'error')} ">
	<label for="cpf">
		<g:message code="pessoaFisica.cpf.label" default="Cpf" />
		
	</label>
	<g:textField name="cpf" value="${pessoaFisicaInstance?.cpf}"/>

</div>


<%@ page import="renk.gerenciamentoPessoas.PessoaJuridica" %>



<div class="fieldcontain ${hasErrors(bean: pessoaJuridicaInstance, field: 'cnpj', 'error')} ">
	<label for="cnpj">
		<g:message code="pessoaJuridica.cnpj.label" default="Cnpj" />
		
	</label>
	<g:textField name="cnpj" value="${pessoaJuridicaInstance?.cnpj}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pessoaJuridicaInstance, field: 'inscricaoEstadual', 'error')} ">
	<label for="inscricaoEstadual">
		<g:message code="pessoaJuridica.inscricaoEstadual.label" default="Inscricao Estadual" />
		
	</label>
	<g:textField name="inscricaoEstadual" value="${pessoaJuridicaInstance?.inscricaoEstadual}"/>

</div>


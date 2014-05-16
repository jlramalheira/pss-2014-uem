<%@ page import="renk.gerenciamentoAutenticacao.Funcionario" %>



<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'perfil', 'error')} required">
	<label for="perfil">
		<g:message code="funcionario.perfil.label" default="Perfil" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="perfil" name="perfil.id" from="${renk.gerenciamentoAutenticacao.Perfil.list()}" optionKey="id" required="" value="${funcionarioInstance?.perfil?.id}" class="many-to-one"/>

</div>


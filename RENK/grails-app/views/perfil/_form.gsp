<%@ page import="renk.gerenciamentoAutenticacao.Perfil" %>



<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="perfil.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${perfilInstance?.nome}"/>

</div>


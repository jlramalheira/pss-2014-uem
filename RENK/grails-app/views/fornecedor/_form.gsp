<%@ page import="renk.Fornecedor" %>



<div class="fieldcontain ${hasErrors(bean: fornecedorInstance, field: 'celular', 'error')} ">
	<label for="celular">
		<g:message code="fornecedor.celular.label" default="Celular" />
		
	</label>
	<g:textField name="celular" value="${fornecedorInstance?.celular}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fornecedorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="fornecedor.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${fornecedorInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fornecedorInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="fornecedor.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${fornecedorInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fornecedorInstance, field: 'telefone', 'error')} ">
	<label for="telefone">
		<g:message code="fornecedor.telefone.label" default="Telefone" />
		
	</label>
	<g:textField name="telefone" value="${fornecedorInstance?.telefone}"/>

</div>

<g:render template="../pessoaJuridica/form" />
<%@ page import="renk.gerenciamentoPessoas.Fornecedor" %>



<div class="fieldcontain form-group ${hasErrors(bean: fornecedorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="fornecedor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${fornecedorInstance?.nome}"class="form-control" />

</div>

<div class="fieldcontain form-group ${hasErrors(bean: fornecedorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="fornecedor.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${fornecedorInstance?.email}"class="form-control" />

</div>

<div class="fieldcontain form-group ${hasErrors(bean: fornecedorInstance, field: 'telefone', 'error')} ">
	<label for="telefone">
		<g:message code="fornecedor.telefone.label" default="Telefone" />
		
	</label>
	<g:textField name="telefone" maxlength="15" value="${fornecedorInstance?.telefone}"class="form-control" />

</div>

<div class="fieldcontain form-group ${hasErrors(bean: fornecedorInstance, field: 'celular', 'error')} ">
	<label for="celular">
		<g:message code="fornecedor.celular.label" default="Celular" />
		
	</label>
	<g:textField name="celular" maxlength="15" value="${fornecedorInstance?.celular}"class="form-control" />

</div>

<div class="fieldcontain form-group ${hasErrors(bean: fornecedorInstance, field: 'enderecos', 'error')} ">
	<label for="enderecos">
		<g:message code="fornecedor.enderecos.label" default="Enderecos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${fornecedorInstance?.enderecos?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['fornecedor.id': fornecedorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>


</div>


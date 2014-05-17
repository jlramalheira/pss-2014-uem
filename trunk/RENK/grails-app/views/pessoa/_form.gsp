<%@ page import="renk.gerenciamentoPessoas.Pessoa" %>



<div class="fieldcontain form-group ${hasErrors(bean: pessoaInstance, field: 'tipoPessoa', 'error')} required">
	<label for="tipoPessoa">
		<g:message code="pessoa.tipoPessoa.label" default="Tipo Pessoa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoPessoa" name="tipoPessoa.id" from="${renk.gerenciamentoPessoas.TipoPessoa.list()}" optionKey="id" required="" value="${pessoaInstance?.tipoPessoa?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain form-group ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="pessoa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${pessoaInstance?.nome}"class="form-control" />

</div>

<div class="fieldcontain form-group ${hasErrors(bean: pessoaInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="pessoa.email.label" default="Email" />
		
	</label>
	<g:field type="email"  class="form-control" name="email" value="${pessoaInstance?.email}"class="form-control" />

</div>

<div class="fieldcontain form-group ${hasErrors(bean: pessoaInstance, field: 'telefone', 'error')} ">
	<label for="telefone">
		<g:message code="pessoa.telefone.label" default="Telefone" />
		
	</label>
	<g:textField name="telefone" maxlength="15" value="${pessoaInstance?.telefone}"class="form-control" />

</div>

<div class="fieldcontain form-group ${hasErrors(bean: pessoaInstance, field: 'celular', 'error')} ">
	<label for="celular">
		<g:message code="pessoa.celular.label" default="Celular" />
		
	</label>
	<g:textField name="celular" maxlength="15" value="${pessoaInstance?.celular}"class="form-control" />

</div>

<div class="fieldcontain form-group ${hasErrors(bean: pessoaInstance, field: 'enderecos', 'error')} ">
	<label for="enderecos">
		<g:message code="pessoa.enderecos.label" default="Enderecos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pessoaInstance?.enderecos?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['pessoa.id': pessoaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>


</div>


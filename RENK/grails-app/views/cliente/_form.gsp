<%@ page import="renk.gerenciamentoPessoas.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'tipoPessoa', 'error')} required">
	<label for="tipoPessoa">
		<g:message code="cliente.tipoPessoa.label" default="Tipo Pessoa" />
		<span class="required-indicator">*</span>
	</label>
	<%--<g:select id="tipoPessoa" name="tipoPessoa.id" from="${renk.gerenciamentoPessoas.TipoPessoa.list()}" optionKey="id" required="" value="${clienteInstance?.tipoPessoa?.id}" class="many-to-one"/>--%>
                <g:radioGroup name="tipoPessoa" 
                    values="['${params.pessoaFisicaInstance?.id}','${params.pessoaJuridicaInstance?.id}']"
                    labels="['Pessoa Física', 'Pessoa Jurídica']" 
                    value="${params.pessoaFisicaInstance?.id}">
                    ${it.label} ${it.radio}
                    </g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="cliente.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${clienteInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="cliente.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${clienteInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefone', 'error')} ">
	<label for="telefone">
		<g:message code="cliente.telefone.label" default="Telefone" />
		
	</label>
	<g:textField name="telefone" value="${clienteInstance?.telefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'celular', 'error')} ">
	<label for="celular">
		<g:message code="cliente.celular.label" default="Celular" />
		
	</label>
	<g:textField name="celular" value="${clienteInstance?.celular}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'enderecos', 'error')} ">
	<label for="enderecos">
		<g:message code="cliente.enderecos.label" default="Enderecos" />
		
	</label>
	<g:select name="enderecos" from="${renk.gerenciamentoPessoas.Endereco.list()}" multiple="multiple" optionKey="id" size="5" value="${clienteInstance?.enderecos*.id}" class="many-to-many"/>

</div>

<g:render template="../pessoaFisica/form" />
<g:render template="../pessoaJuridica/form" />
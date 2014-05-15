<%@ page import="renk.Cliente" %>


<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'celular', 'error')} ">
    <label for="celular">
        <g:message code="cliente.celular.label" default="Celular" />

    </label>
    <g:textField name="celular" value="${clienteInstance?.celular}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="cliente.email.label" default="Email" />

    </label>
    <g:textField name="email" value="${clienteInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} ">
    <label for="nome">
        <g:message code="cliente.nome.label" default="Nome" />

    </label>
    <g:textField name="nome" value="${clienteInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefone', 'error')} ">
    <label for="telefone">
        <g:message code="cliente.telefone.label" default="Telefone" />

    </label>
    <g:textField name="telefone" value="${clienteInstance?.telefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'tipoPessoa', 'error')} required">
    <label for="tipoPessoa">
        <g:message code="cliente.tipoPessoa.label" default="Tipo Pessoa" />
        <span class="required-indicator">*</span>
    </label>


</div>

<g:render template="../pessoaFisica/form" />
<g:render template="../pessoaJuridica/form" />
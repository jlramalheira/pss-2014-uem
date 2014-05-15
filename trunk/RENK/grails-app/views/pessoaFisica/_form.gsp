<%@ page import="renk.PessoaFisica" %>



<div class="fieldcontain ${hasErrors(bean: pessoaFisicaInstance, field: 'cpf', 'error')} ">
    <label for="cpf">
        <g:message code="pessoaFisica.cpf.label" default="Cpf" />

    </label>
    <g:textField name="cpf" value="${clienteInstance?.tipoPessoa?.cpf}"/>

</div>


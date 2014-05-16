<%@ page import="renk.gerenciamentoPessoas.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'tipoPessoa', 'error')} required">
    <label for="tipoPessoa">
        <g:message code="cliente.tipoPessoa.label" default="Tipo Pessoa" />
        <span class="required-indicator">*</span>
    </label>
    <g:radioGroup name="tipoPessoa" 
        values="['fisica','juridica']"
        labels="['Pessoa Física', 'Pessoa Jurídica']" 
        value="fisica">
        ${it.label} ${it.radio}
    </g:radioGroup>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} ">
    <label for="nome">
        <g:message code="cliente.nome.label" default="Nome" />

    </label>
    <g:textField name="nome" value="${clienteInstance?.nome}"/>

</div>
<div id="pessoaFisica">
    <div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'tipoPessoa.cpf', 'error')} ">
        <label for="tipoPessoa.cpf">
            <g:message code="tipoPessoa.cpf.label" default="Cpf" />

        </label>
        <g:textField name="tipoPessoa.cpf" value="${clienteInstance?.tipoPessoa?.cpf}"/>

    </div>
</div>
<div id="pessoaJuridica" class="hidden">
    <div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'tipoPessoa.cnpj', 'error')} ">
        <label for="tipoPessoa.cnpj">
            <g:message code="pessoaJuridica.cnpj.label" default="Cnpj" />

        </label>
        <g:textField name="tipoPessoa.cnpj" value="${clienteInstance?.tipoPessoa?.cnpj}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'tipoPessoa.inscricaoEstadual', 'error')} ">
        <label for="tipoPessoa.inscricaoEstadual">
            <g:message code="pessoaJuridica.inscricaoEstadual.label" default="Inscricao Estadual" />

        </label>
        <g:textField name="tipoPessoa.inscricaoEstadual" value="${clienteInstance?.tipoPessoa?.inscricaoEstadual}"/>

    </div>
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
    <div id="enderecos">
        <a href="#">Adicionar Endereco </a>
    </div>
</div>

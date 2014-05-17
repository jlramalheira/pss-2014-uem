<%@ page import="renk.gerenciamentoPessoas.Cliente" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'tipoPessoa', 'error')} required">
        <label for="tipoPessoa">
            <g:message code="cliente.tipoPessoa.label" default="Tipo Pessoa" />
            <span class="required-indicator">*</span>
        </label>
        <g:select class="form-control" id="tipoPessoa" name="tipoPessoa.id" from="${renk.gerenciamentoPessoas.TipoPessoa.list()}" optionKey="id" required="" value="${clienteInstance?.tipoPessoa?.id}" class="many-to-one"/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} required">
        <label for="nome">
            <g:message code="cliente.nome.label" default="Nome" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="nome" required="" value="${clienteInstance?.nome}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
        <label for="email">
            <g:message code="cliente.email.label" default="Email" />
            
        </label>
        <g:field type="email" class="form-control" name="email" value="${clienteInstance?.email}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'telefone', 'error')} ">
        <label for="telefone">
            <g:message code="cliente.telefone.label" default="Telefone" />
            
        </label>
        <g:textField name="telefone" maxlength="15" value="${clienteInstance?.telefone}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'celular', 'error')} ">
        <label for="celular">
            <g:message code="cliente.celular.label" default="Celular" />
            
        </label>
        <g:textField name="celular" maxlength="15" value="${clienteInstance?.celular}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'enderecos', 'error')} ">
        <label for="enderecos">
            <g:message code="cliente.enderecos.label" default="Enderecos" />
            
        </label>
        
<ul class="one-to-many">
<g:each in="${clienteInstance?.enderecos?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>


    </div>
</div>


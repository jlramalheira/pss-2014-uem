<%@ page import="renk.gerenciamentoPessoas.Fornecedor" %>
<div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: fornecedorInstance?.pessoaJuridica, field: 'tipoPessoa.cnpj', 'error')} ">
        <label for="cnpj">
            <g:message code="pessoaJuridica.cnpj.label" default="Cnpj" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="pessoaJuridica.cnpj" value="${fornecedorInstance?.pessoaJuridica?.cnpj}"class="form-control" />

    </div>
</div>

<div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: fornecedorInstance?.pessoaJuridica, field: 'inscricaoEstadual', 'error')} ">
        <label for="inscricaoEstadual">
            <g:message code="pessoaJuridica.inscricaoEstadual.label" default="Inscricao Estadual" />

        </label>
        <g:textField name="pessoaJuridica.inscricaoEstadual" value="${fornecedorInstance?.pessoaJuridica?.inscricaoEstadual}"class="form-control" />
    </div>
</div>


    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: fornecedorInstance, field: 'nome', 'error')} required">
        <label for="nome">
            <g:message code="fornecedor.nome.label" default="Nome" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="nome" required="" value="${fornecedorInstance?.nome}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: fornecedorInstance, field: 'email', 'error')} ">
        <label for="email">
            <g:message code="fornecedor.email.label" default="Email" />
            
        </label>
        <g:field type="email" class="form-control" name="email" value="${fornecedorInstance?.email}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: fornecedorInstance, field: 'telefone', 'error')} ">
        <label for="telefone">
            <g:message code="fornecedor.telefone.label" default="Telefone" />
            
        </label>
        <g:textField name="telefone" maxlength="15" value="${fornecedorInstance?.telefone}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: fornecedorInstance, field: 'celular', 'error')} ">
        <label for="celular">
            <g:message code="fornecedor.celular.label" default="Celular" />
            
        </label>
        <g:textField name="celular" maxlength="15" value="${fornecedorInstance?.celular}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: fornecedorInstance, field: 'enderecos', 'error')} ">
        
<ul class="one-to-many">
<g:each in="${fornecedorInstance?.enderecos?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>



    </div>
</div>


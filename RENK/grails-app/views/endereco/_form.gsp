<%@ page import="renk.gerenciamentoPessoas.Endereco" %>


    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: enderecoInstance, field: 'tipo', 'error')} required">
        <label for="tipo">
            <g:message code="endereco.tipo.label" default="Tipo" />
            <span class="required-indicator">*</span>
        </label>
        <g:select  class="form-control"  name="tipo" from="${renk.gerenciamentoPessoas.TipoEndereco?.values()}" keys="${renk.gerenciamentoPessoas.TipoEndereco.values()*.name()}" required="" value="${enderecoInstance?.tipo?.name()}" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: enderecoInstance, field: 'logradouro', 'error')} ">
        <label for="logradouro">
            <g:message code="endereco.logradouro.label" default="Logradouro" />
            
        </label>
        <g:textField name="logradouro" value="${enderecoInstance?.logradouro}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: enderecoInstance, field: 'numero', 'error')} ">
        <label for="numero">
            <g:message code="endereco.numero.label" default="Numero" />
            
        </label>
        <g:textField name="numero" maxlength="10" value="${enderecoInstance?.numero}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: enderecoInstance, field: 'complemento', 'error')} ">
        <label for="complemento">
            <g:message code="endereco.complemento.label" default="Complemento" />
            
        </label>
        <g:textField name="complemento" value="${enderecoInstance?.complemento}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: enderecoInstance, field: 'bairro', 'error')} ">
        <label for="bairro">
            <g:message code="endereco.bairro.label" default="Bairro" />
            
        </label>
        <g:textField name="bairro" value="${enderecoInstance?.bairro}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: enderecoInstance, field: 'cep', 'error')} ">
        <label for="cep">
            <g:message code="endereco.cep.label" default="Cep" />
            
        </label>
        <g:textField name="cep" value="${enderecoInstance?.cep}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: enderecoInstance, field: 'cidade', 'error')} required">
        <label for="cidade">
            <g:message code="endereco.cidade.label" default="Cidade" />
            <span class="required-indicator">*</span>
        </label>
        <g:select class="form-control" id="cidade" name="cidade.id" from="${renk.gerenciamentoPessoas.Cidade.list()}" optionKey="id" required="" value="${enderecoInstance?.cidade?.id}" class="many-to-one"/>

    </div>
</div>


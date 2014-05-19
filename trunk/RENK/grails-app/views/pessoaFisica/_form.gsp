<%@ page import="renk.gerenciamentoPessoas.PessoaFisica" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: pessoaFisicaInstance, field: 'cpf', 'error')} required">
        <label for="cpf">
            <g:message code="pessoaFisica.cpf.label" default="Cpf" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="cpf" maxlength="11" required="" value="${pessoaFisicaInstance?.cpf}"class="form-control" />

    </div>
</div>


<%@ page import="renk.gerenciamentoPessoas.PessoaFisica" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: pessoaFisicaInstance, field: 'cpf', 'error')} ">
        <label for="cpf">
            <g:message code="pessoaFisica.cpf.label" default="Cpf" />
            
        </label>
        <g:textField name="cpf" value="${pessoaFisicaInstance?.cpf}"class="form-control" />

    </div>
</div>


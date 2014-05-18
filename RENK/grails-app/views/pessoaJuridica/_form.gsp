<%@ page import="renk.gerenciamentoPessoas.PessoaJuridica" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: pessoaJuridicaInstance, field: 'cnpj', 'error')} ">
        <label for="cnpj">
            <g:message code="pessoaJuridica.cnpj.label" default="Cnpj" />
            
        </label>
        <g:textField name="cnpj" value="${pessoaJuridicaInstance?.cnpj}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: pessoaJuridicaInstance, field: 'inscricaoEstadual', 'error')} ">
        <label for="inscricaoEstadual">
            <g:message code="pessoaJuridica.inscricaoEstadual.label" default="Inscricao Estadual" />
            
        </label>
        <g:textField name="inscricaoEstadual" value="${pessoaJuridicaInstance?.inscricaoEstadual}"class="form-control" />

    </div>
</div>


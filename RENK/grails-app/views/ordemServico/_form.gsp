<%@ page import="renk.gerenciamentoServicos.OrdemServico" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10 ${hasErrors(bean: ordemServicoInstance, field: 'funcionario', 'error')} required">
        <label for="funcionario">
            <g:message code="ordemServico.funcionario.label" default="Funcionario" />
            <span class="required-indicator">*</span>
        </label>
        <g:select class="form-control" id="funcionario" name="funcionario.id" from="${renk.gerenciamentoAutenticacao.Funcionario.list()}" optionKey="id" required="" value="${ordemServicoInstance?.funcionario?.id}" class="many-to-one" noSelection="${['-1':'Escalonar']}"/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-8 col-md-8 col-lg-8 ${hasErrors(bean: ordemServicoInstance, field: 'servico', 'error')} required">
        <label for="servico">
            <g:message code="ordemServico.servico.label" default="Servico" />
            <span class="required-indicator">*</span>
        </label>
        <g:select class="form-control" id="servico" name="servico.id" from="${renk.gerenciamentoServicos.Servico.list()}" optionKey="id" required="" value="${ordemServicoInstance?.servico?.id}" class="many-to-one"/>

    </div>
</div>

    <div class="row">
    <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: ordemServicoInstance, field: 'dataEmissao', 'error')} required">
        <label for="dataEmissao">
            <g:message code="ordemServico.dataEmissao.label" default="Data Emissao" />
            <span class="required-indicator">*</span>
        </label><br/>
        <g:datePicker name="dataEmissao" precision="day"  value="${ordemServicoInstance?.dataEmissao}"  />

    </div>
</div>


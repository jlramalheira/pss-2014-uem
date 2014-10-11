<%@ page import="renk.gerenciamentoProdutos.Promocao" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10 ${hasErrors(bean: promocaoInstance, field: 'nome', 'error')} required">
        <label for="nome">
            <g:message code="promocao.nome.label" default="Nome" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="nome" required="" value="${promocaoInstance?.nome}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: promocaoInstance, field: 'dataInicio', 'error')} required">
        <label for="dataInicio">
            <g:message code="promocao.dataInicio.label" default="Data Inicio" />
            <span class="required-indicator">*</span>
        </label><br/>
        <g:datePicker name="dataInicio" precision="day"  value="${promocaoInstance?.dataInicio}"  />

    </div>
</div>

    <div class="row">
    <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: promocaoInstance, field: 'dataFim', 'error')} required">
        <label for="dataFim">
            <g:message code="promocao.dataFim.label" default="Data Fim" />
            <span class="required-indicator">*</span>
        </label><br/>
        <g:datePicker name="dataFim" precision="day"  value="${promocaoInstance?.dataFim}" />

    </div>
    
    
</div>


<%@ page import="renk.gerenciamentoServicos.Servico" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: servicoInstance, field: 'nome', 'error')} required">
        <label for="nome">
            <g:message code="servico.nome.label" default="Nome" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="nome" required="" value="${servicoInstance?.nome}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: servicoInstance, field: 'descricao', 'error')} ">
        <label for="descricao">
            <g:message code="servico.descricao.label" default="Descricao" />
            
        </label>
        <g:textArea name="descricao" cols="40" rows="5" class="form-control"  value="${servicoInstance?.descricao}"/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: servicoInstance, field: 'hora', 'error')} required">
        <label for="hora">
            <g:message code="servico.hora.label" default="Hora" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="hora" type="number" min="0" max="24" value="${servicoInstance.hora}" required=""/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: servicoInstance, field: 'minutos', 'error')} required">
        <label for="minutos">
            <g:message code="servico.minutos.label" default="Minutos" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="minutos" type="number" min="0" max="60" value="${servicoInstance.minutos}" required=""/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: servicoInstance, field: 'valor', 'error')} required">
        <label for="valor">
            <g:message code="servico.valor.label" default="Valor" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="valor" value="${fieldValue(bean: servicoInstance, field: 'valor')}" required=""/>

    </div>
</div>


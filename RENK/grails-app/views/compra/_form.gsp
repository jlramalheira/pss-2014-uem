<%@ page import="renk.gerenciamentoTransacoes.Compra" %>



<div class="row">
    <div class="form-group col-xs-12 col-sm-8 col-md-8 col-lg-8 ${hasErrors(bean: compraInstance, field: 'pessoa', 'error')} required">
        <label for="pessoa">
            Fornecedor <%--<g:message code="compra.pessoa.label" default="Pessoa" />--%>
            <span class="required-indicator">*</span>
        </label>
        <g:select class="form-control" id="pessoa" name="pessoa.id" from="${renk.gerenciamentoPessoas.Pessoa.list()}" optionKey="id" value="${compraInstance?.pessoa?.id}" class="many-to-one"/>

    </div>
</div>

<%@ page import="renk.gerenciamentoTransacoes.Compra" %>



<div class="row">
    <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'dataTransacao', 'error')} required">
        <label for="dataTransacao">
            <g:message code="compra.dataTransacao.label" default="Data Transacao" />
            <span class="required-indicator">*</span>
        </label><br/>
        <g:datePicker name="dataTransacao" precision="day"  value="${compraInstance?.dataTransacao}"/>

    </div>
</div>


<!--<div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'status', 'error')} required">
        <label for="status">
            <g:message code="compra.status.label" default="Status" />
            <span class="required-indicator">*</span>
        </label>
        <g:select  class="form-control"  name="status" 
        from="${renk.gerenciamentoTransacoes.Compra$Status?.values()}" 
        keys="${renk.gerenciamentoTransacoes.Compra$Status.values()*.name()}" 
        required="" value="${compraInstance?.status?.name()}"/>
    </div>-->



</div>




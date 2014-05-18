<%@ page import="renk.gerenciamentoTransacoes.Compra" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'dataTransacao', 'error')} required">
        <label for="dataTransacao">
            <g:message code="compra.dataTransacao.label" default="Data Transacao" />
            <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="dataTransacao" precision="day"  value="${compraInstance?.dataTransacao}"  />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'quantidadeTotal', 'error')} required">
        <label for="quantidadeTotal">
            <g:message code="compra.quantidadeTotal.label" default="Quantidade Total" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="quantidadeTotal" type="number" value="${compraInstance.quantidadeTotal}" required=""/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
        <label for="valorTotal">
            <g:message code="compra.valorTotal.label" default="Valor Total" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="valorTotal" value="${fieldValue(bean: compraInstance, field: 'valorTotal')}" required=""/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'status', 'error')} required">
        <label for="status">
            <g:message code="compra.status.label" default="Status" />
            <span class="required-indicator">*</span>
        </label>
        <g:select  class="form-control"  name="status" from="${renk.gerenciamentoTransacoes.Compra$Status?.values()}" keys="${renk.gerenciamentoTransacoes.Compra$Status.values()*.name()}" required="" value="${compraInstance?.status?.name()}" />

    </div>
</div>


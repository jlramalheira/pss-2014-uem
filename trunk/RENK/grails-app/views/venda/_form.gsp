<%@ page import="renk.gerenciamentoTransacoes.Venda" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'dataTransacao', 'error')} required">
        <label for="dataTransacao">
            <g:message code="venda.dataTransacao.label" default="Data Transacao" />
            <span class="required-indicator">*</span>
        </label>
        ${vendaInstance?.dataTransacao?.toString()}

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'quantidadeTotal', 'error')} required">
        <label for="quantidadeTotal">
            <g:message code="venda.quantidadeTotal.label" default="Quantidade Total" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="quantidadeTotal" type="number" value="${vendaInstance.quantidadeTotal}" required=""/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'valorTotal', 'error')} required">
        <label for="valorTotal">
            <g:message code="venda.valorTotal.label" default="Valor Total" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="valorTotal" value="${fieldValue(bean: vendaInstance, field: 'valorTotal')}" required=""/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'status', 'error')} required">
        <label for="status">
            <g:message code="venda.status.label" default="Status" />
            <span class="required-indicator">*</span>
        </label>
        <g:select  class="form-control"  name="status" from="${renk.gerenciamentoTransacoes.Status?.values()}" keys="${renk.gerenciamentoTransacoes.Status.values()*.name()}" required="" value="${vendaInstance?.status?.name()}" />

    </div>
</div>


<%@ page import="renk.gerenciamentoTransacoes.SolicitacaoCompra" %>



    <div class="row">
    <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: solicitacaoCompraInstance, field: 'dataSolicitacao', 'error')} required">
        <label for="dataSolicitacao">
            <g:message code="solicitacaoCompra.dataSolicitacao.label" default="Data Solicitacao" />
            <span class="required-indicator">*</span>
        </label><br/>
        <g:datePicker name="dataSolicitacao" precision="day"  value="${solicitacaoCompraInstance?.dataSolicitacao}"  />

    </div>
</div>


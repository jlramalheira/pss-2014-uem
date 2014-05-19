<%@ page import="renk.gerenciamentoSolucao.Solucao" %>


<g:if test="${!params.idOrdem}">
<div class="row">
  <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: solucaoInstance, field: 'ordemServico', 'error')}">
    <label for="ordemServico">
      <g:message code="solucao.ordemServico.label" default="Ordem Servico" />
      <span class="required-indicator">*</span>
    </label>
    <g:select class="form-control" id="ordemServico" name="ordemServico.id" from="${renk.gerenciamentoServicos.OrdemServico.list()}" optionKey="id" required="" value="${solucaoInstance?.ordemServico?.id}" class="many-to-one"/>

  </div>
</div>
</g:if>
<g:else>
<g:hiddenField name="idOrdem" value="${params.idOrdem}" />
</g:else>
<div class="row">
  <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: solucaoInstance, field: 'descricao', 'error')} ">
    <label for="descricao">
      <g:message code="solucao.descricao.label" default="Descricao" />

    </label>
    <g:textArea name="descricao" cols="40" rows="5" class="form-control"  value="${solucaoInstance?.descricao}"/>

  </div>

</div>


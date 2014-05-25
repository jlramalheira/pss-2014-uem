<%@ page import="renk.gerenciamentoProdutos.Produto" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10 ${hasErrors(bean: produtoInstance, field: 'nome', 'error')} required">
        <label for="nome">
            <g:message code="produto.nome.label" default="Nome" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="nome" required="" value="${produtoInstance?.nome}"class="form-control" />

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10 ${hasErrors(bean: produtoInstance, field: 'descricao', 'error')} ">
        <label for="descricao">
            <g:message code="produto.descricao.label" default="Descricao" />
            
        </label>
        <g:textArea name="descricao" cols="40" rows="5" class="form-control"  value="${produtoInstance?.descricao}"/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-6 col-sm-3 col-md-3 col-lg-3 ${hasErrors(bean: produtoInstance, field: 'estoqueMinimo', 'error')} required">
        <label for="estoqueMinimo">
            <g:message code="produto.estoqueMinimo.label" default="Estoque Minimo" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="estoqueMinimo" type="number" min="0" value="${produtoInstance?.estoqueMinimo}" required=""/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-6 col-sm-3 col-md-3 col-lg-3 ${hasErrors(bean: produtoInstance, field: 'estoqueDesejavel', 'error')} required">
        <label for="estoqueDesejavel">
            <g:message code="produto.estoqueDesejavel.label" default="Estoque Desejavel" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="estoqueDesejavel" type="number" min="0" value="${produtoInstance?.estoqueDesejavel}" required=""/>

    </div>
</div>

    <div class="row">
    <div class="form-group col-xs-6 col-sm-3 col-md-3 col-lg-3 ${hasErrors(bean: produtoInstance, field: 'valor', 'error')} required">
        <label for="valor">
            <g:message code="produto.valor.label" default="Valor" />
            <span class="required-indicator">*</span>
        </label>
        <g:field  class="form-control" name="valor" value="${fieldValue(bean: produtoInstance, field: 'valor')}" required=""/>

    </div>
</div>


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
        <g:datePicker name="dataFim" precision="day"  value="${promocaoInstance?.dataFim}"  />

    </div>
    
    <table class="table table-hover table-striped table-responsive">
            <caption class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                    <h2 class="margin-top-zero">Lista de Produtos</h2>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-novo-produto">
                        Adicionar Produto
                    </button>
                </div>
                <div class="modal fade" id="modal-novo-produto" tabindex="-1" role="dialog" aria-labelledby="#modal-novo-produto-label" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title" id="modal-novo-produto-label">
                                    Novo item de produto
                                </h3>
                            </div>
                            <div class="modal-body text-left">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                                        <label for="valorTotal">
                                            Produto
                                            <span class="required-indicator">*</span>
                                        </label>
                                        <g:select class="form-control" id="produto" name="produto.id" from="${renk.gerenciamentoProdutos.Produto.findAllByAtivo(true)}" optionKey="id" required="" value="${produtoInstance?.id}" class="many-to-one"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                                        <label for="valorTotal">
                                            Desconto
                                            <span class="required-indicator">*</span>
                                        </label>
                                        <input type="number" class="form-control"/>
                                    </div>
                                </div>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                <button type="button" class="btn btn-primary">Salvar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </caption>
            <thead>
                <tr>
                    <th>
                        Produto
                    </th>
                    <th>
                        Preço do produto
                    </th>
                    <th>
                        Desconto
                    </th>
                    <th colspan="2">
                        Preço com desconto
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <a href="#">Produto Sample</a>
                    </td>
                    <td>
                        R$ 20,00
                    </td>
                    <td>
                        5%
                    </td>
                    <td>
                        R$ 19,00
                    </td>
                    <td class="text-right">
                        <button type="button" class="btn btn-sm btn-primary"
                         data-toggle="modal" data-target="#modal-novo-produto">
                            Editar
                        </button>
                        <button type="button" class="btn btn-sm btn-danger"
                        onclick="return confirm('Tem certeza disso?');">
                            Excluir
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="#">Produto Sample</a>
                    </td>
                    <td>
                        R$ 20,00
                    </td>
                    <td>
                        10%
                    </td>
                    <td>
                        R$ 18,00
                    </td>
                    <td class="text-right">
                        <button type="button" class="btn btn-sm btn-primary"
                         data-toggle="modal" data-target="#modal-novo-produto">
                            Editar
                        </button>
                        <button type="button" class="btn btn-sm btn-danger"
                        onclick="return confirm('Tem certeza disso?');">
                            Excluir
                        </button>
                            
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="#">Produto Sample</a>
                    </td>
                    <td>
                        R$ 20,00
                    </td>
                    <td>
                        15%
                    </td>
                    <td>
                        R$ 17,00
                    </td>
                    <td class="text-right">
                        <button type="button" class="btn btn-sm btn-primary"
                         data-toggle="modal" data-target="#modal-novo-produto">
                            Editar
                        </button>
                        <button type="button" class="btn btn-sm btn-danger"
                        onclick="return confirm('Tem certeza disso?');">
                            Excluir
                        </button>
                    </td>

                </tr>
            </tbody>
        </table>
</div>
</div>


<%@ page import="renk.gerenciamentoTransacoes.Venda" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10 ${hasErrors(bean: vendaInstance, field: 'pessoa', 'error')} ">
        <label for="pessoa">
            <g:message code="venda.pessoa.label" default="Pessoa" />
            
        </label>
        <g:select class="form-control" id="pessoa" name="pessoa.id" from="${renk.gerenciamentoPessoas.Pessoa.list()}" optionKey="id" value="${vendaInstance?.pessoa?.id}" class="many-to-one" noSelection="['null': '']"/>

    </div>
</div>

    <div class="row">
    <div class="form-group form-group-data col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: vendaInstance, field: 'dataTransacao', 'error')} required">
        <label for="dataTransacao">
            <g:message code="venda.dataTransacao.label" default="Data Transacao" />
            <span class="required-indicator">*</span>
        </label><br/>
        <g:datePicker name="dataTransacao" precision="day"  value="${vendaInstance?.dataTransacao}"  />

    </div>
</div>

<div class="row margin-top-sm">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
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
                                        <select class="form-control" name="produto">
                                            <option value="1">Produto 1</option>
                                            <option value="2">Produto 2</option>
                                            <option value="3">Produto 3</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                                        <label for="valorTotal">
                                            Quantidade
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
                        Quantidade
                    </th>
                    <th colspan="2">
                        Total
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
                        5
                    </td>
                    <td>
                        R$ 100,00
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
                        5
                    </td>
                    <td>
                        R$ 100,00
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
                        5
                    </td>
                    <td>
                        R$ 100,00
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
            <tfoot>
                <tr>
                    <th colspan="2">
                        Total
                    </th>
                    <th>
                        15
                    </th>
                    <th colspan="2">
                        R$ 300,00
                    </th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>

<div class="row margin-top-sm">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <table class="table table-hover table-striped table-responsive">
            <caption class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                    <h2 class="margin-top-zero">Lista de Serviços</h2>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-novo-servico">
                        Adicionar Serviço
                    </button>
                </div>
                <div class="modal fade" id="modal-novo-servico" tabindex="-1" role="dialog" aria-labelledby="#modal-novo-servico-label" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title" id="modal-novo-servico-label">
                                    Novo item de Serviço
                                </h3>
                            </div>
                            <div class="modal-body text-left">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                                        <label for="valorTotal">
                                            Serviço
                                            <span class="required-indicator">*</span>
                                        </label>
                                        <select class="form-control" name="produto">
                                            <option value="1">Serviço 1</option>
                                            <option value="2">Serviço 2</option>
                                            <option value="3">Serviço 3</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6 ${hasErrors(bean: compraInstance, field: 'valorTotal', 'error')} required">
                                        <label for="valorTotal">
                                            Quantidade
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
                        Serviço
                    </th>
                    <th>
                        Preço do Serviço
                    </th>
                    <th>
                        Quantidade
                    </th>
                    <th colspan="2">
                        Total
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <a href="#">Serviço Sample</a>
                    </td>
                    <td>
                        R$ 20,00
                    </td>
                    <td>
                        5
                    </td>
                    <td>
                        R$ 100,00
                    </td>
                    <td class="text-right">
                        <button type="button" class="btn btn-sm btn-primary"
                         data-toggle="modal" data-target="#modal-novo-servico">
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
                        <a href="#">Serviço Sample</a>
                    </td>
                    <td>
                        R$ 20,00
                    </td>
                    <td>
                        5
                    </td>
                    <td>
                        R$ 100,00
                    </td>
                    <td class="text-right">
                        <button type="button" class="btn btn-sm btn-primary"
                         data-toggle="modal" data-target="#modal-novo-servico">
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
                        <a href="#">Serviço Sample</a>
                    </td>
                    <td>
                        R$ 20,00
                    </td>
                    <td>
                        5
                    </td>
                    <td>
                        R$ 100,00
                    </td>
                    <td class="text-right">
                        <button type="button" class="btn btn-sm btn-primary"
                         data-toggle="modal" data-target="#modal-novo-servico">
                            Editar
                        </button>
                        <button type="button" class="btn btn-sm btn-danger"
                        onclick="return confirm('Tem certeza disso?');">
                            Excluir
                        </button>
                    </td>

                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="2">
                        Total
                    </th>
                    <th>
                        15
                    </th>
                    <th colspan="2">
                        R$ 300,00
                    </th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>





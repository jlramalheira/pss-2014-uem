
<%@ page import="renk.gerenciamentoTransacoes.Venda" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
        <title><g:message code="default.help.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="nav-main"/>
        <div class="container-fluid">
            <div class="row">
                <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <div class="well well-sm">
                        <h1>Opções da Ajuda</h1>
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <a href="#criar">Criar Venda</a>
                            </li>
                            <li>
                                <a href="#pesquisar">Pesquisar Venda</a>
                            </li>
                            <li>
                                <a href="#visualizar">Visualizar Venda</a>
                            </li>
                            <li>
                                <a href="#finalizar">Finalizar Venda</a>
                            </li>
                            <li>
                                <a href="#editar">Editar Venda</a>
                            </li>
                            <li>
                                <a href="#adicionarProduto">Adicionar Produtos</a>
                            </li>
                            <li>
                                <a href="#adicionarServico">Adicionar Serviço</a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <h1>Ajuda para venda</h1>
                    <p>
                        Para acessar todas as funcionalidades disponíveis para o gerenciamento de vendas,
                        basta clicar na opção "Vendas" que se encontra na barra de menu principal no topo da página
                    </p>
                    <p class="text-center">
                        <g:img dir="images" file="menu.png" class="img-responsive center-block"/>
                    </p>


                    <section>
                        <h3 id="criar">Criar uma venda</h3>
                        <p>Para criar uma venda, basta clicar na opção "Venda" que se encontra na barra de menu principal no topo da pagina</p>
                        <p>No sub-menu de navegação lateral a esquerda, clique na opção "Nova Venda"</p>
                        <p>Na tela que aparecer, defina o cliente para a compra, a respectiva data e clique no botão "Criar", como mostra a imagem abaixo</p>
                        <p>Após isso você será redirecionado para a tela de edição da venda, onde nela poderá adicionar produtos que serão explicados na sessão <a href="#adicionarProduto">Adicionar Produtos</a></p>
                        <g:img dir="images" file="venda-criar.png" class="img-responsive center-block"/>
                        <a href="#topo">↑ Topo</a>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                    </section>

                    <section>
                        <h3 id="pesquisar">Pesquisar venda</h3>
                        <p>Para pesquisar uma venda, basta clicar na opção "Venda" que se encontra na barra de menu principal no topo da pagina</p>
                        <p>No sub-menu de navegação lateral a esquerda, clique na opção "Venda Listagem"</p>
                        <p>Será exibida uma tabela com todas as vendas cadastradas, mostrando até 10 opções por página</p>
                        <p>Pode ser filtrada por data, basta preencher o formulário acima da tabela e clicar em "Pesquisar"</p>
                        <g:img dir="images" file="venda-listagem.png" class="img-responsive center-block"/>
                        <a href="#topo">↑ Topo</a>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                    </section>

                    <section>
                        <h3 id="visualizar">Visualizar venda</h3>
                        <p>Para visualizar uma venda, basta clicar na opção "Venda" que se encontra na barra de menu principal no topo da pagina</p>
                        <p>No sub-menu de navegação lateral a esquerda, clique na opção "Venda Listagem"</p>
                        <p>Será exibida uma tabela com todas as vendas cadastradas, mostrando até 10 opções por página</p>
                        <p>Pode ser filtrada por data, basta preencher o formulário acima da tabela e clicar em "Pesquisar"</p>
                        <p>Ao encontrar a venda desejada na tabela, clique sobre o cliente da venda que te redicionará para a tela de visualização da respectiva venda</p>
                        <p>Se a venda ainda estiver ativa, você pode edita-la, finaliza-la ou cancela-la, clicando nos botões no sub-menu opções na parte inferior</p>
                        <g:img dir="images" file="venda-ver.png" class="img-responsive center-block"/>
                        <a href="#topo">↑ Topo</a>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                    </section>

                    <section>
                        <h3 id="editar">Editar venda</h3>
                        <p>Para editar uma venda, basta clicar na opção "Venda" que se encontra na barra de menu principal no topo da pagina</p>
                        <p>No sub-menu de navegação lateral a esquerda, clique na opção "Venda Listagem"</p>
                        <p>Será exibida uma tabela com todas as vendas cadastradas, mostrando até 10 opções por página</p>
                        <p>Pode ser filtrada por data, basta preencher o formulário acima da tabela e clicar em "Pesquisar"</p>
                        <p>Ao encontrar a venda desejada na tabela, clique sobre o cliente da venda que te redicionará para a tela de visualização da respectiva venda</p>
                        <p>Selecione a opção Editar no sub-menu de opções na parte inferior</p>
                        <p>Você pode editar o cliente da venda e a data da mesma, pode também alterar os produtos e servicos: removendo-os ou <a href="#adicionarProduto">adicionando um produto</a> ou <a href="#adicionarProduto">adicionando um serviço</a></p>
                        <p>Após as edições realizadas, clique no botão alterar</p>
                        <g:img dir="images" file="venda-editar.png" class="img-responsive center-block"/>
                        <a href="#topo">↑ Topo</a>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                    </section>

                    <section>
                        <h3 id="adicionarProduto">Adicionando produto na venda</h3>
                        <p>Para adicionar um produto em uma venda, basta clicar na opção "Venda" que se encontra na barra de menu principal no topo da pagina</p>
                        <p>No sub-menu de navegação lateral a esquerda, clique na opção "Venda Listagem"</p>
                        <p>Será exibida uma tabela com todas as vendas cadastradas, mostrando até 10 opções por página</p>
                        <p>Pode ser filtrada por data, basta preencher o formulário acima da tabela e clicar em "Pesquisar"</p>
                        <p>Ao encontrar a venda desejada na tabela, clique sobre o cliente da venda que te redicionará para a tela de visualização da respectiva venda</p>
                        <p>Selecione a opção Editar no sub-menu de opções na parte inferior</p>
                        <p>Clique no botão "Adicionar Produto" que se encontra do lado direito da tela</p>
                        <p>Uma caixa de dialogo será aberta, sendo assim você seleciona o produto e informa qual a quantidade que será vendida. Clique no botão salvar.</p>
                        <p>Após os produtos adicionados, clique no botão Alterar</p>
                        <g:img dir="images" file="venda-addproduto.png" class="img-responsive center-block"/>
                        <a href="#topo">↑ Topo</a>
                        <br/>
                    </section>

                    <section>
                        <h3 id="adicionarServico">Adicionando serviço na venda</h3>
                        <p>Para adicionar um serviço em uma venda, basta clicar na opção "Venda" que se encontra na barra de menu principal no topo da pagina</p>
                        <p>No sub-menu de navegação lateral a esquerda, clique na opção "Venda Listagem"</p>
                        <p>Será exibida uma tabela com todas as vendas cadastradas, mostrando até 10 opções por página</p>
                        <p>Pode ser filtrada por data, basta preencher o formulário acima da tabela e clicar em "Pesquisar"</p>
                        <p>Ao encontrar a venda desejada na tabela, clique sobre o cliente da venda que te redicionará para a tela de visualização da respectiva venda</p>
                        <p>Selecione a opção Editar no sub-menu de opções na parte inferior</p>
                        <p>Clique no botão "Adicionar Produto" que se encontra do lado direito da tela</p>
                        <p>Uma caixa de dialogo será aberta, sendo assim você seleciona o servico e informa qual a quantidade que será vendida. Clique no botão salvar.</p>
                        <p>Após os serviços adicionados, clique no botão Alterar</p>
                        <g:img dir="images" file="venda-addservico.png" class="img-responsive center-block"/>
                        <a href="#topo">↑ Topo</a>
                        <br/>
                    </section>



                </section>
            </div>
        </div>
    </div>
</body>
</html>

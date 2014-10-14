
<%@ page import="renk.gerenciamentoProdutos.Promocao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'promocao.label', default: 'Promocao')}" />
        <title><g:message code="Ajuda" args="[entityName]" /></title>
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
                                <a href="#criarPromocao">Criar Promoção</a>
                            </li>
                            <li>
                                <a href="#pesquisarPromocao">Pesquisar Promoção</a>
                            </li>
                            <li>
                                <a href="#visualizarPromocao">Visualizar Promoção</a>
                            </li>
                            <li>
                                <a href="#editarPromocao">Editar Promoção</a>
                            </li>
                            <li>
                                <a href="#adicionarProdutoPromocao">Adicionar Produto na Promoção</a>
                            </li>
                        </ul>
                    </div>

                </nav>
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <div id="help-promocao" class="scaffold-show" role="main">
                        <div class="row">
                            <h1 id="topo">Promoção Ajuda</h1>
                            <section>
                                <h3 id="criarPromocao">Criar uma promoção</h3>
                                <p>Para criar uma nova promoção, basta clicar na opção "Produto" que se encontra na barra de menu principal no topo da pagina</p>
                                <p>Após isso, clique na opção "Nova Promoção" no menu a esquerda</p>
                                <p>Defina um nome para a promoção e suas datas de inicio e termino e clique no botão "Criar", como mostra a imagem abaixo</p>
                                <p>Após isso você será redirecionado para a tela de edição, onde nela poderá adicionar produtos que serão explicados na sessão <a href="#adicionarProdutoPromocao">Adicionar Produtos</a></p>
                                <g:img dir="images" file="criarPromocao.png" width="100%"/>
                                <a href="#topo">↑ Topo</a>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                            </section>

                            <section>
                                <h3 id="pesquisarPromocao">Pesquisar promoção</h3>
                                <p>Para pesquisar uma promoção, basta clicar na opção "Produto" que se encontra na barra de menu principal no topo da pagina</p>
                                <p>Após isso, clique na opção "Promoção Listagem" no menu a esquerda</p>
                                <p>Será exibida uma tabela com todas as promoções cadastradas, mostrando até 10 opções por página</p>
                                <p>Pode ser filtrada está busca, por nome ou mais opções, para realizar tal filtro basta preencher o formulário acima da tabela e clicar em "Pesquisar"</p>
                                <g:img dir="images" file="listagemPromocao.png" width="100%"/>
                                <a href="#topo">↑ Topo</a>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                            </section>

                            <section>
                                <h3 id="visualizarPromocao">Visualizar promoção</h3>
                                <p>Para visualizar uma promoção, basta clicar na opção "Produto" que se encontra na barra de menu principal no topo da pagina</p>
                                <p>Após isso, clique na opção "Promoção Listagem" no menu a esquerda</p>
                                <p>Será exibida uma tabela com todas as promoções cadastradas, mostrando até 10 opções por página</p>
                                <p>Pode ser filtrada está busca, por nome ou mais opções, para realizar tal filtro basta preencher o formulário acima da tabela e clicar em "Pesquisar"</p>
                                <p>Qaundo encontrar a promoção desejada na tabela, clice sobre o nome da promoção que te redicionará para a tela de visualização da promoção</p>
                                <p>Se a promoção ainda estiver ativa, você pode edita-lá ou finaliza-lá, clicando nos botões no sub-menu opções</p>
                                <g:img dir="images" file="showPromocao.png" width="100%"/>
                                <a href="#topo">↑ Topo</a>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                            </section>

                            <section>
                                <h3 id="editarPromocao">Editar promoção</h3>
                                <p>Para editar uma promoção, basta clicar na opção "Produto" que se encontra na barra de menu principal no topo da pagina</p>
                                <p>Após isso, clique na opção "Promoção Listagem" no menu a esquerda</p>
                                <p>Será exibida uma tabela com todas as promoções cadastradas, mostrando até 10 opções por página</p>
                                <p>Pode ser filtrada está busca, por nome ou mais opções, para realizar tal filtro basta preencher o formulário acima da tabela e clicar em "Pesquisar"</p>
                                <p>Qaundo encontrar a promoção desejada na tabela, clice sobre o nome da promoção que te redicionará para a tela de visualização da promoção</p>
                                <p>Selecione a opção editar no sub-menu de opções</p>
                                <p>Você pode editar o nome da promoção ou as datas da mesma, além dos produtos que será explicado no tópico a seguir</p>
                                <p>Após as edições realizadas, clique no botão alterar</p>
                                <g:img dir="images" file="editarPromocao.png" width="100%"/>
                                <a href="#topo">↑ Topo</a>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                            </section>

                            <section>
                                <h3 id="adicionarProdutoPromocao">Adicionando produto na promoção</h3>
                                <p>Para editar uma promoção, basta clicar na opção "Produto" que se encontra na barra de menu principal no topo da pagina</p>
                                <p>Após isso, clique na opção "Promoção Listagem" no menu a esquerda</p>
                                <p>Será exibida uma tabela com todas as promoções cadastradas, mostrando até 10 opções por página</p>
                                <p>Pode ser filtrada está busca, por nome ou mais opções, para realizar tal filtro basta preencher o formulário acima da tabela e clicar em "Pesquisar"</p>
                                <p>Qaundo encontrar a promoção desejada na tabela, clice sobre o nome da promoção que te redicionará para a tela de visualização da promoção</p>
                                <p>Selecione a opção editar no sub-menu de opções</p>
                                <p>Clique no botão "Adicionar Produto que se encontra do lado direito da tela"</p>
                                <p>Uma caixa de dialogo será aberta e nela você selciona o produto e define qual o desconto que será aplicado para o mesmo</p>
                                <p>Após os produtos adicionados, clique no botão alterar</p>
                                <g:img dir="images" file="adicionarProdutoPromocao.png" width="100%"/>
                                <a href="#topo">↑ Topo</a>
                                <br/>
                            </section>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>

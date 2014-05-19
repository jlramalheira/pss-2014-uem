<a href="#list-solicitacaoCompra" class="sr-only">
            <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
        </a>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${createLink(uri: '/inicio')}">
                       <strong>RENK</strong>
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="main-navigation">
                    <ul class="nav navbar-nav">
                        <li>
                            <g:link controller="venda" action="index">
                                Vendas
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="compra" action="index">
                                Compras
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="produto" action="index">
                                Produtos
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="cliente" action="index">
                                Clientes
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="fornecedor" action="index">
                                Fornecedores
                            </g:link>                            
                        </li>
                        <li>
                            <g:link controller="servico" action="index">
                                Serviços
                            </g:link>
                        </li>              
                        <li>
                            <g:link controller="relatorio" action="index">
                                Relatórios
                            </g:link>
                        </li>        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/RENK">Sair</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!--<div class="nav" role="navigation">
            <ul>
                <li>
                    <a class="home" href="${createLink(uri: '/')}">
                    <g:message code="default.home.label"/>
                    </a>
                </li>
                <li>
                    <g:link class="create" action="create">
                        <g:message code="default.new.label" args="[entityName]" />
                    </g:link>
                </li>
                </ul>
            </div>-->
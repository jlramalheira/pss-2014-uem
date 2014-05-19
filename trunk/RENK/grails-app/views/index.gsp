<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>RENK : Sistema de Controle de Vendas e Serviços</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'logo.png')}" type="image/x-icon"/>
        <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.css')}" />        
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custon.css')}" />
        <g:javascript library="application"/>		
    <r:layoutResources />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    
    <a href="#list-fornecedor" class="sr-only">
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
    
    <div class="container-fluid">
        <div class="jumbotron">
            <h1>Bem-vindo!</h1>
            <p>
                O <strong>RENK</strong> SCVS é um sistema de controle de vendas e de serviço.
            </p>
        </div>
    
    </div>
    
    <div class="footer" role="contentinfo">

    </div>
    
    
    <footer class="main-footer margin-top-sm">
        RENK - Sistema de Controle de Vendas e Serviços. Por BRAR Sollutions, 2014.
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <r:layoutResources />
</body>
</html>


<!-- <!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>		
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${GroovySystem.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Welcome to Grails</h1>
			<p>Congratulations, you have successfully started your first Grails application! At the moment
			   this is the default page, feel free to modify it to either redirect to a controller or display whatever
			   content you may choose. Below is a list of controllers that are currently deployed in this application,
			   click on each to execute its default action:</p>

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
	</body>
</html>-->

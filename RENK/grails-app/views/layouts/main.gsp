<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'logo.png')}" type="image/x-icon"/>
        <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}"/>
        <g:layoutHead/>
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
    <g:layoutBody/>
    <div class="footer" role="contentinfo">

    </div>
    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>
    
    <footer class="main-footer margin-top-sm">
        RENK - Sistema de Controle de Vendas e Serviços. Por BRAR Solutions, 2014.
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<r:layoutResources />
</body>
</html>

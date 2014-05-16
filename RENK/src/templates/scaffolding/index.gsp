<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-${domainClass.propertyName}" class="sr-only">
            <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
        </a>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="\${createLink(uri: '/')}">
                        RENK
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
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">RH</a>
                        </li>                    
                        <li><a href="#">Sair</a></li>                     
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                       <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                           </ul>
                           </div>
                           <div id="list-${domainClass.propertyName}" class="content scaffold-list" role="main">
                       <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="\${flash.message}">
                            <div class="message" role="status">\${flash.message}</div>
                        </g:if>
                        <table>
                            <thead>
                                <tr>
                                    <%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
props.eachWithIndex { p, i ->
if (i < 6) {
        if (p.isAssociation()) { %>
                                    <th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
                                        <%      } else { %>
                                        <g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
                                        <%  }   }   } %>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                                    <tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
                                        <%  props.eachWithIndex { p, i ->
            if (i == 0) { %>
                                        <td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
                                        <%      } else if (i < 6) {
                if (p.type == Boolean || p.type == boolean) { %>
                                        <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
                                        <%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                                        <td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
                                        <%          } else { %>
                                        <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                                        <%  }   }   } %>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <g:paginate total="\${${propertyName}Count ?: 0}" />
                        </div>
                        </div>
                        </body>
                        </html>

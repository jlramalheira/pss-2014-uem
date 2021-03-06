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
        <g:render template="nav-main"/>
        <div class="container-fluid">
            <div class="row">
                <nav class="subnav col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <g:render template="nav-sub"/>
                </nav>
                <section class="content col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <div id="list-${domainClass.propertyName}" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="\${flash.message}">
                        <div  class="alert alert-info alert-dismissable" role="status">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            \${flash.message}
                        </div>
                        </g:if>
                        <table class="table table-hover table-striped table-responsive">
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
                </section>
            </div>
        </div>
    </body>
 </html>

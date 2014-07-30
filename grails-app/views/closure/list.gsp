
<%@ page import="fastchacaito.Closure" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'closure.label', default: 'Closure')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Cierres</li>
        </ul>
        <div id="list-closure" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Cierres</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="closure.closureDate.label" default="Fecha" /></th>

                                <th><g:message code="closure.reportX.label" default="Reporte X" /></th>

                                <th><g:message code="closure.reportZ.label" default="Reporte Z" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${closureInstanceList}" status="i" var="closureInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${closureInstance.id}">${fieldValue(bean: closureInstance, field: "closureDate")}</g:link></td>

                                    <td>${fieldValue(bean: closureInstance, field: "reportX")}</td>

                                    <td>${fieldValue(bean: closureInstance, field: "reportZ")}</td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <div class="footer">
                        <div class="footer-left">
                            <span>&copy; 2014. Fast CA. Todos los derechos reservados.</span>
                        </div>
                        <div class="footer-right">
                            <span>Diseñado por: <a href="http://themepixels.com/">Kristian Cortés</a></span>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>

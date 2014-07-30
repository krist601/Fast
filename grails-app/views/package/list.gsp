
<%@ page import="fastchacaito.Package" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'package.label', default: 'Package')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Paquetes</li>
        </ul>
        <div id="list-package" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Paquetes</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="mesotherapy.packageType.label" default="Tipo de Paquete" /></th>

                                <th><g:message code="mesotherapy.price.label" default="Precio" /></th>

                                <th><g:message code="mesotherapy.sesionAmount.label" default="Cantidad de Sesiones" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${packageInstanceList}" status="i" var="packageInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${packageInstance.id}">${fieldValue(bean: packageInstance, field: "packageType")}</g:link></td>

                                    <td>${fieldValue(bean: packageInstance, field: "price")}</td>

                                    <td>${fieldValue(bean: packageInstance, field: "sesionAmount")}</td>

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

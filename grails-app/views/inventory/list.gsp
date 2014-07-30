
<%@ page import="fastchacaito.Inventory" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'inventory.label', default: 'Inventory')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Inventario</li>
        </ul>
        <div id="list-inventory" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Inventario</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="inventory.closure.label" default="Cierre" /></th>

                                <th><g:message code="inventory.inventoryType.label" default="Tipo de Inventario" /></th>

                                <th><g:message code="inventory.receivedDate.label" default="Fecha de Recivo" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${inventoryInstanceList}" status="i" var="inventoryInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${inventoryInstance.id}">${fieldValue(bean: inventoryInstance, field: "closure")}</g:link></td>

                                    <td>${fieldValue(bean: inventoryInstance, field: "inventoryType")}</td>

                                    <td>${fieldValue(bean: inventoryInstance, field: "receivedDate")}</td>

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

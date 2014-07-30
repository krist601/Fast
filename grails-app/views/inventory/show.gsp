
<%@ page import="fastchacaito.Inventory" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'inventory.label', default: 'Inventory')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Inventory/List')}">Inventario</a> <span class="separator"></span></li>
            <li>Mostrar Inventario</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Inventario: ${inventoryInstance?.id}</h4>
                    <div class="widgetcontent">
                                <div id="show-inventory" class="content scaffold-show" role="main">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <ol class="property-list inventory">

                                    <g:if test="${inventoryInstance?.closure}">
                                        <li class="fieldcontain">
                                            <span id="closure-label" class="property-label"><g:message code="inventory.closure.label" default="Closure" /></span>

                                            <span class="property-value" aria-labelledby="closure-label"><g:link controller="closure" action="show" id="${inventoryInstance?.closure?.id}">${inventoryInstance?.closure?.encodeAsHTML()}</g:link></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${inventoryInstance?.inventoryType}">
                                        <li class="fieldcontain">
                                            <span id="inventoryType-label" class="property-label"><g:message code="inventory.inventoryType.label" default="Inventory Type" /></span>

                                            <span class="property-value" aria-labelledby="inventoryType-label"><g:fieldValue bean="${inventoryInstance}" field="inventoryType"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${inventoryInstance?.receivedDate}">
                                        <li class="fieldcontain">
                                            <span id="receivedDate-label" class="property-label"><g:message code="inventory.receivedDate.label" default="Received Date" /></span>

                                            <span class="property-value" aria-labelledby="receivedDate-label"><g:link controller="date" action="show" id="${inventoryInstance?.receivedDate?.id}">${inventoryInstance?.receivedDate?.encodeAsHTML()}</g:link></span>

                                        </li>
                                    </g:if>

                                </ol>
                                <g:form>
                                    <fieldset class="buttons">
                                        <g:hiddenField name="id" value="${inventoryInstance?.id}" />
                                        <g:link class="btn btn-primary" action="edit" id="${inventoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                        <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                    </fieldset>
                                </g:form>
                            </div>
                    </div><!--widgetcontent-->
                </div><!--widget-->

                <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2014. Fast CA. Todos los derechos reservados.</span>
                    </div>
                    <div class="footer-right">
                        <span>Diseñado por: <a href="http://themepixels.com/">Kristian Cortés</a></span>
                    </div>
                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->
    </body>
</html>

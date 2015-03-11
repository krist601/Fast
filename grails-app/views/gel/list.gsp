
<%@ page import="fastchacaito.Gel" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'gel.label', default: 'Gel')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Gel</li>
        </ul>
        <div id="list-gel" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <h4 class="widgettitle" style="font-size: 30px;">Gel</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <thead>
                            <tr>

                                <th><g:message code="gel.outType.label" default="Identificador" /></th>

                                <th><g:message code="gel.receivedDate.label" default="Fecha de Llegada" /></th>

                                <th><g:message code="gel.receivedDate.label" default="Estado" /></th>

                                <th><g:message code="gel.receivedDate.label" default="AcciÃ³n" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${gelInstanceList}" status="i" var="gelInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td>${fieldValue(bean: gelInstance, field: "identifier")}</td>

                                    <td><g:formatDate format="dd MMMM yyyy" date="${gelInstance.receivedDate}"/></td>

                                    <td><g:link action="changeStatus" id="${gelInstance.id}">Marcar como Vendido</g:link></td>

                                    <td><g:link action="deleteGel" id="${gelInstance.id}">Eliminar</g:link></td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <div class="footer">
                        <div class="footer-left">
                            <span>&copy; 2014. Fast CA. Todos los derechos reservados.</span>
                        </div>
                        <div class="footer-right">
                            <span>DiseÃ±ado por: <a href="http://themepixels.com/">Kristian CortÃ©s</a></span>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>

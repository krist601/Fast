
<%@ page import="fastchacaito.Application" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Aplicaciones</li>
        </ul>
        <div id="list-application" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Aplicaciones</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="application.arrivalDate.label" default="Fecha de Llegada" /></th>

                                <th><g:message code="application.identifier.label" default="Identificador" /></th>

                                <th><g:message code="application.lostDate.label" default="Fecha de Perdida" /></th>

                                <th><g:message code="application.vacutainer.label" default="Vacutainer" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${applicationInstanceList}" status="i" var="applicationInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${applicationInstance.id}">${fieldValue(bean: applicationInstance, field: "arrivalDate")}</g:link></td>

                                    <td>${fieldValue(bean: applicationInstance, field: "identifier")}</td>

                                    <td>${fieldValue(bean: applicationInstance, field: "lostDate")}</td>

                                    <td>${fieldValue(bean: applicationInstance, field: "vacutainer")}</td>

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
                </div><!--footer-->
                </div>
                </body>
                </html>

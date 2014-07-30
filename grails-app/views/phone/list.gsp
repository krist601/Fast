
<%@ page import="fastchacaito.Phone" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'phone.label', default: 'Phone')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Teléfono</li>
        </ul>
        <div id="list-phone" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Teléfono</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="phone.areaCode.label" default="Codigo de Área" /></th>

                                <th><g:message code="phone.patient.label" default="Paciente" /></th>

                                <th><g:message code="phone.phoneNumber.label" default="Número de Teléfono" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${phoneInstanceList}" status="i" var="phoneInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${phoneInstance.id}">${fieldValue(bean: phoneInstance, field: "areaCode")}</g:link></td>

                                    <td>${fieldValue(bean: phoneInstance, field: "patient")}</td>

                                    <td>${fieldValue(bean: phoneInstance, field: "phoneNumber")}</td>

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

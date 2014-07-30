
<%@ page import="fastchacaito.ApplicationControl" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'applicationControl.label', default: 'ApplicationControl')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Controles de Aplicaciones</li>
        </ul>
        <div id="list-applicationControl" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Control de Aplicaciones</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="applicationControl.application.label" default="Aplicación" /></th>

                                <th><g:message code="applicationControl.balance.label" default="Balance" /></th>

                                <th><g:message code="applicationControl.currentWeight.label" default="Peso Actual" /></th>

                                <th><g:message code="applicationControl.date.label" default="Fecha" /></th>

                                <th><g:message code="applicationControl.differenceWeight.label" default="Peso de Diferencia" /></th>   

                                <th><g:message code="applicationControl.identifierNumber.label" default="Número de Identificador" /></th>  

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${applicationControlInstanceList}" status="i" var="applicationControlInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${applicationControlInstance.id}">${fieldValue(bean: applicationControlInstance, field: "application")}</g:link></td>

                                    <td>${fieldValue(bean: applicationControlInstance, field: "balance")}</td>

                                    <td>${fieldValue(bean: applicationControlInstance, field: "currentWeight")}</td>

                                    <td>${fieldValue(bean: applicationControlInstance, field: "date")}</td>

                                    <td>${fieldValue(bean: applicationControlInstance, field: "differenceWeight")}</td>

                                    <td>${fieldValue(bean: applicationControlInstance, field: "identifierNumber")}</td>

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

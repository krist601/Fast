
<%@ page import="fastchacaito.BloodSample" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'bloodSample.label', default: 'BloodSample')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Muestras de Sangre Enviadas</li>
        </ul>
        <div id="list-bloodSample" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Muestras de Sangre</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="bloodSample.patient.label" default="Paciente" /></th>

                                <th><g:message code="bloodSample.receiptData.label" default="Fecha de toma de Muestra" /></th>

                                <th><g:message code="bloodSample.testType.label" default="Tipo de Prueba" /></th>
                                
                                <th><g:message code="bloodSample.testType.label" default="Acciones" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${bloodSampleInstanceList}" status="i" var="bloodSampleInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${bloodSampleInstance.id}">${fieldValue(bean: bloodSampleInstance, field: "patient")}</g:link></td>

                                    <td><g:formatDate date="${bloodSampleInstance.receiptData}" format="dd MMMM yyyy"/> </td>

                                    <td>${fieldValue(bean: bloodSampleInstance, field: "testType")}</td>

                                    <td><g:link action="changeStatusShipped" id="${bloodSampleInstance.id}">Registrar como Enviada</g:link></td>

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

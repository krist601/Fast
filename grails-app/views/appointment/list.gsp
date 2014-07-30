
<%@ page import="fastchacaito.Appointment" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Citas</li>
        </ul>

        <div id="list-appointment" class="content scaffold-list" role="main">

            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Citas</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="appointment.beginDate.label" default="Fecha de Comienzo" /></th>

                                <th><g:message code="appointment.dateType.label" default="Tpo de Cita" /></th>

                                <th><g:message code="appointment.endDate.label" default="Fecha de Fin" /></th>

                                <th><g:message code="appointment.patient.label" default="Paciente" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${appointmentInstanceList}" status="i" var="appointmentInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${appointmentInstance.id}">${fieldValue(bean: appointmentInstance, field: "beginDate")}</g:link></td>

                                    <td>${fieldValue(bean: appointmentInstance, field: "dateType")}</td>

                                    <td><g:formatDate date="${appointmentInstance.endDate}" /></td>

                                    <td>${fieldValue(bean: appointmentInstance, field: "patient")}</td>

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

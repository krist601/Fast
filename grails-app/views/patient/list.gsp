
<%@ page import="fastchacaito.Patient" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Pacientes</li>
        </ul>
        <div id="list-patient" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Pacientes</h4>
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

                                <th><g:message code="patient.address.label" default="Dirección" /></th>

                                <th><g:message code="patient.admisionDate.label" default="Fecha de Admision" /></th>

                                <th><g:message code="patient.allergy.label" default="Alegia" /></th>

                                <th><g:message code="patient.bornDate.label" default="Fecha de Nacimiento" /></th>

                                <th><g:message code="patient.cedula.label" default="Cedula" /></th>

                                <th><g:message code="patient.firstName.label" default="Primer Nombre" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${patientInstanceList}" status="i" var="patientInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${patientInstance.id}">${fieldValue(bean: patientInstance, field: "address")}</g:link></td>

                                    <td>${fieldValue(bean: patientInstance, field: "admisionDate")}</td>

                                    <td>${fieldValue(bean: patientInstance, field: "allergy")}</td>

                                    <td>${fieldValue(bean: patientInstance, field: "bornDate")}</td>

                                    <td>${fieldValue(bean: patientInstance, field: "cedula")}</td>

                                    <td>${fieldValue(bean: patientInstance, field: "firstName")}</td>

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

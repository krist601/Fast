
<%@ page import="fastchacaito.Appointment" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Appointment/List')}">Cita</a> <span class="separator"></span></li>
            <li>Mostrar Cita</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Cita: ${appointmentInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-appointment" class="content scaffold-show" role="main">
                            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list appointment">

                                <g:if test="${appointmentInstance?.beginDate}">
                                    <li class="fieldcontain">
                                        <span id="beginDate-label" class="property-label"><g:message code="appointment.beginDate.label" default="Begin Date" /></span>

                                        <span class="property-value" aria-labelledby="beginDate-label"><g:formatDate date="${appointmentInstance?.beginDate}" /></span>

                                    </li>
                                </g:if>

                                <g:if test="${appointmentInstance?.dateType}">
                                    <li class="fieldcontain">
                                        <span id="dateType-label" class="property-label"><g:message code="appointment.dateType.label" default="Date Type" /></span>

                                        <span class="property-value" aria-labelledby="dateType-label"><g:fieldValue bean="${appointmentInstance}" field="dateType"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${appointmentInstance?.endDate}">
                                    <li class="fieldcontain">
                                        <span id="endDate-label" class="property-label"><g:message code="appointment.endDate.label" default="End Date" /></span>

                                        <span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${appointmentInstance?.endDate}" /></span>

                                    </li>
                                </g:if>

                                <g:if test="${appointmentInstance?.patient}">
                                    <li class="fieldcontain">
                                        <span id="patient-label" class="property-label"><g:message code="appointment.patient.label" default="Patient" /></span>

                                        <span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${appointmentInstance?.patient?.id}">${appointmentInstance?.patient?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${appointmentInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${appointmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

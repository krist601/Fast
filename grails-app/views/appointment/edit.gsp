<%@ page import="fastchacaito.Appointment" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Appointment/List')}">Cita</a> <span class="separator"></span></li>
            <li>Editar Cita</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Editar Cita</h4>
                    <div class="widgetcontent">
                        <div id="edit-appointment" class="content scaffold-edit" role="main">
                            
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${appointmentInstance}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${appointmentInstance}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                        </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form method="post" >
                                <g:hiddenField name="id" value="${appointmentInstance?.id}" />
                                <g:hiddenField name="version" value="${appointmentInstance?.version}" />
                                <fieldset class="form">
                                    <%@ page import="fastchacaito.Appointment" %>



<div class="fieldcontain ${hasErrors(bean: appointmentInstance, field: 'date', 'error')} ">
    <label>Fecha de la Cita</label>
    <span class="field"><input id="datepicker" type="text" name="date" class="input-small" value="${appointmentInstance?.date.format("MM/dd/yyyy")}" required/></span>
</div>

<div class="par">
    <label>Hora Inicio de la Cita</label>
    <div class="input-append bootstrap-timepicker">
        <input id="timepicker1" name="startTime" type="text" class="input-small" value="${appointmentInstance?.startTime.format("HH:mm a")}" required/>
        <span class="add-on"><i class="iconfa-time"></i></span>
    </div>
</div>
<div class="par">
    <label>Hora Fin de la Cita</label>
    <div class="input-append bootstrap-timepicker">
        <input id="timepicker2" name="endTime" type="text" class="input-small" value="${appointmentInstance?.endTime.format("HH:mm a")}" required/>
        <span class="add-on"><i class="iconfa-time"></i></span>
    </div>
</div>
<div class="fieldcontain ${hasErrors(bean: appointmentInstance, field: 'treatment', 'error')} required">
    <label for="treatment">
        <g:message code="appointment.treatment.label" default="Tratamiento" />
    </label>
    <g:select id="treatment" name="treatment.id" from="${fastchacaito.Treatment.findAllByPatient(patientInstance)}" optionKey="id" required="" value="${appointmentInstance?.treatment?.id}" class="many-to-one" />
</div>


                                </fieldset>
                                <fieldset class="buttons">
                                    <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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

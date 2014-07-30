<%@ page import="fastchacaito.Appointment" %>



<div class="fieldcontain ${hasErrors(bean: appointmentInstance, field: 'beginDate', 'error')} required">
	<label for="beginDate">
		<g:message code="appointment.beginDate.label" default="Begin Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="beginDate" precision="day"  value="${appointmentInstance?.beginDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: appointmentInstance, field: 'dateType', 'error')} ">
	<label for="dateType">
		<g:message code="appointment.dateType.label" default="Date Type" />
		
	</label>
	<g:textField name="dateType" value="${appointmentInstance?.dateType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: appointmentInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="appointment.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${appointmentInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: appointmentInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="appointment.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${fastchacaito.Patient.list()}" optionKey="id" required="" value="${appointmentInstance?.patient?.id}" class="many-to-one"/>
</div>


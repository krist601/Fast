<%@ page import="fastchacaito.Date" %>



<div class="fieldcontain ${hasErrors(bean: dateInstance, field: 'beginDate', 'error')} required">
	<label for="beginDate">
		<g:message code="date.beginDate.label" default="Begin Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="beginDate" name="beginDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${dateInstance?.beginDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dateInstance, field: 'dateType', 'error')} ">
	<label for="dateType">
		<g:message code="date.dateType.label" default="Date Type" />
		
	</label>
	<g:textField name="dateType" value="${dateInstance?.dateType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dateInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="date.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="endDate" name="endDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${dateInstance?.endDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dateInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="date.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${fastchacaito.Patient.list()}" optionKey="id" required="" value="${dateInstance?.patient?.id}" class="many-to-one"/>
</div>


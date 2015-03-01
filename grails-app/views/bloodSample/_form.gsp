<%@ page import="fastchacaito.BloodSample" %>

<g:hiddenField name="patient.id" value="${bloodSampleInstance?.patient?.id}"/>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'receiptData', 'error')} required">
	<label for="receiptData">
		<g:message code="bloodSample.receiptData.label" default="Fecha de toma de Muestra" />
		<span class="required-indicator">*</span>
	</label>
        <g:datePicker name="receiptData" precision="day"  value="${bloodSampleInstance?.receiptData}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'testType', 'error')} ">
	<label for="testType">
		<g:message code="bloodSample.testType.label" default="Tipo de Prueba" />
		
	</label>
	<g:textField name="testType" value="${bloodSampleInstance?.testType}"/>
</div>


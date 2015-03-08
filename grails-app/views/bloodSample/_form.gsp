<%@ page import="fastchacaito.BloodSample" %>

<g:hiddenField name="patient.id" value="${bloodSampleInstance?.patient?.id}"/>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'receiptData', 'error')} ">
    <label>Fecha de toma de Muestra</label>
    <span class="field"><input id="datepicker" type="text" name="receiptData" class="input-small" /></span>
</div> 

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'testType', 'error')} ">
	<label for="testType">
		<g:message code="bloodSample.testType.label" default="Tipo de Prueba" />
		
	</label>
	<g:textField name="testType" value="${bloodSampleInstance?.testType}"/>
</div>


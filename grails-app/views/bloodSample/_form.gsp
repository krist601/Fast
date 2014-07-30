<%@ page import="fastchacaito.BloodSample" %>



<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="bloodSample.patient.label" default="Paciente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${fastchacaito.Patient.list()}" optionKey="id" required="" value="${bloodSampleInstance?.patient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'receiptData', 'error')} required">
	<label for="receiptData">
		<g:message code="bloodSample.receiptData.label" default="Fecha de toma de Muestra" />
		<span class="required-indicator">*</span>
	</label>
        <g:datePicker name="receiptData" precision="day"  value="${bloodSampleInstance?.receiptData?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'receivedDate', 'error')} required">
	<label for="receivedDate">
		<g:message code="bloodSample.receivedDate.label" default="Fecha de Recivo" />
		<span class="required-indicator">*</span>
	</label>
        <g:datePicker name="receivedDate" precision="day"  value="${bloodSampleInstance?.receivedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'shippingDate', 'error')} required">
	<label for="shippingDate">
		<g:message code="bloodSample.shippingDate.label" default="Fecha de Envío" />
		<span class="required-indicator">*</span>
	</label>
        <g:datePicker name="shippingDate" precision="day"  value="${bloodSampleInstance?.shippingDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'testType', 'error')} ">
	<label for="testType">
		<g:message code="bloodSample.testType.label" default="Tipo de Prueba" />
		
	</label>
	<g:textField name="testType" value="${bloodSampleInstance?.testType}"/>
</div>


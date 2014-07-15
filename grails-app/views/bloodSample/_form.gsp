<%@ page import="fastchacaito.BloodSample" %>



<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="bloodSample.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${fastchacaito.Patient.list()}" optionKey="id" required="" value="${bloodSampleInstance?.patient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'receiptData', 'error')} required">
	<label for="receiptData">
		<g:message code="bloodSample.receiptData.label" default="Receipt Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receiptData" name="receiptData.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${bloodSampleInstance?.receiptData?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'receivedDate', 'error')} required">
	<label for="receivedDate">
		<g:message code="bloodSample.receivedDate.label" default="Received Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receivedDate" name="receivedDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${bloodSampleInstance?.receivedDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'shippingDate', 'error')} required">
	<label for="shippingDate">
		<g:message code="bloodSample.shippingDate.label" default="Shipping Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="shippingDate" name="shippingDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${bloodSampleInstance?.shippingDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bloodSampleInstance, field: 'testType', 'error')} ">
	<label for="testType">
		<g:message code="bloodSample.testType.label" default="Test Type" />
		
	</label>
	<g:textField name="testType" value="${bloodSampleInstance?.testType}"/>
</div>


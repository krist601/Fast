<%@ page import="fastchacaito.Phone" %>



<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'areaCode', 'error')} ">
	<label for="areaCode">
		<g:message code="phone.areaCode.label" default="Area Code" />
		
	</label>
	<g:textField name="areaCode" value="${phoneInstance?.areaCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="phone.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${fastchacaito.Patient.list()}" optionKey="id" required="" value="${phoneInstance?.patient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="phone.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" value="${phoneInstance?.phoneNumber}"/>
</div>


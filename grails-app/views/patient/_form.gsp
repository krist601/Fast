<%@ page import="fastchacaito.Patient" %>



<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="patient.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${patientInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'admisionDate', 'error')} required">
	<label for="admisionDate">
		<g:message code="patient.admisionDate.label" default="Admision Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="admisionDate" name="admisionDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${patientInstance?.admisionDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'allergy', 'error')} ">
	<label for="allergy">
		<g:message code="patient.allergy.label" default="Allergy" />
		
	</label>
	<g:textField name="allergy" value="${patientInstance?.allergy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'bornDate', 'error')} ">
	<label for="bornDate">
		<g:message code="patient.bornDate.label" default="Born Date" />
		
	</label>
	<g:textField name="bornDate" value="${patientInstance?.bornDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'cedula', 'error')} required">
	<label for="cedula">
		<g:message code="patient.cedula.label" default="Cedula" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cedula" type="number" value="${patientInstance.cedula}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="patient.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${patientInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'heartMedicine', 'error')} ">
	<label for="heartMedicine">
		<g:message code="patient.heartMedicine.label" default="Heart Medicine" />
		
	</label>
	<g:textField name="heartMedicine" value="${patientInstance?.heartMedicine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'height', 'error')} ">
	<label for="height">
		<g:message code="patient.height.label" default="Height" />
		
	</label>
	<g:textField name="height" value="${patientInstance?.height}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="patient.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${patientInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'medicine', 'error')} ">
	<label for="medicine">
		<g:message code="patient.medicine.label" default="Medicine" />
		
	</label>
	<g:textField name="medicine" value="${patientInstance?.medicine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'ocupation', 'error')} ">
	<label for="ocupation">
		<g:message code="patient.ocupation.label" default="Ocupation" />
		
	</label>
	<g:textField name="ocupation" value="${patientInstance?.ocupation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferDiabetes', 'error')} ">
	<label for="sufferDiabetes">
		<g:message code="patient.sufferDiabetes.label" default="Suffer Diabetes" />
		
	</label>
	<g:checkBox name="sufferDiabetes" value="${patientInstance?.sufferDiabetes}" />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferFever', 'error')} ">
	<label for="sufferFever">
		<g:message code="patient.sufferFever.label" default="Suffer Fever" />
		
	</label>
	<g:checkBox name="sufferFever" value="${patientInstance?.sufferFever}" />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferHeartFailure', 'error')} ">
	<label for="sufferHeartFailure">
		<g:message code="patient.sufferHeartFailure.label" default="Suffer Heart Failure" />
		
	</label>
	<g:checkBox name="sufferHeartFailure" value="${patientInstance?.sufferHeartFailure}" />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferHernias', 'error')} ">
	<label for="sufferHernias">
		<g:message code="patient.sufferHernias.label" default="Suffer Hernias" />
		
	</label>
	<g:checkBox name="sufferHernias" value="${patientInstance?.sufferHernias}" />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferHypertension', 'error')} ">
	<label for="sufferHypertension">
		<g:message code="patient.sufferHypertension.label" default="Suffer Hypertension" />
		
	</label>
	<g:checkBox name="sufferHypertension" value="${patientInstance?.sufferHypertension}" />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferRenalInsufficiency', 'error')} ">
	<label for="sufferRenalInsufficiency">
		<g:message code="patient.sufferRenalInsufficiency.label" default="Suffer Renal Insufficiency" />
		
	</label>
	<g:checkBox name="sufferRenalInsufficiency" value="${patientInstance?.sufferRenalInsufficiency}" />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferhemorrhoid', 'error')} ">
	<label for="sufferhemorrhoid">
		<g:message code="patient.sufferhemorrhoid.label" default="Sufferhemorrhoid" />
		
	</label>
	<g:checkBox name="sufferhemorrhoid" value="${patientInstance?.sufferhemorrhoid}" />
</div>


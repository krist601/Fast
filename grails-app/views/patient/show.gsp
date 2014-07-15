
<%@ page import="fastchacaito.Patient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-patient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-patient" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list patient">
			
				<g:if test="${patientInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="patient.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${patientInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.admisionDate}">
				<li class="fieldcontain">
					<span id="admisionDate-label" class="property-label"><g:message code="patient.admisionDate.label" default="Admision Date" /></span>
					
						<span class="property-value" aria-labelledby="admisionDate-label"><g:link controller="date" action="show" id="${patientInstance?.admisionDate?.id}">${patientInstance?.admisionDate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.allergy}">
				<li class="fieldcontain">
					<span id="allergy-label" class="property-label"><g:message code="patient.allergy.label" default="Allergy" /></span>
					
						<span class="property-value" aria-labelledby="allergy-label"><g:fieldValue bean="${patientInstance}" field="allergy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.bornDate}">
				<li class="fieldcontain">
					<span id="bornDate-label" class="property-label"><g:message code="patient.bornDate.label" default="Born Date" /></span>
					
						<span class="property-value" aria-labelledby="bornDate-label"><g:fieldValue bean="${patientInstance}" field="bornDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.cedula}">
				<li class="fieldcontain">
					<span id="cedula-label" class="property-label"><g:message code="patient.cedula.label" default="Cedula" /></span>
					
						<span class="property-value" aria-labelledby="cedula-label"><g:fieldValue bean="${patientInstance}" field="cedula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="patient.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${patientInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.heartMedicine}">
				<li class="fieldcontain">
					<span id="heartMedicine-label" class="property-label"><g:message code="patient.heartMedicine.label" default="Heart Medicine" /></span>
					
						<span class="property-value" aria-labelledby="heartMedicine-label"><g:fieldValue bean="${patientInstance}" field="heartMedicine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="patient.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${patientInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="patient.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${patientInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.medicine}">
				<li class="fieldcontain">
					<span id="medicine-label" class="property-label"><g:message code="patient.medicine.label" default="Medicine" /></span>
					
						<span class="property-value" aria-labelledby="medicine-label"><g:fieldValue bean="${patientInstance}" field="medicine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.ocupation}">
				<li class="fieldcontain">
					<span id="ocupation-label" class="property-label"><g:message code="patient.ocupation.label" default="Ocupation" /></span>
					
						<span class="property-value" aria-labelledby="ocupation-label"><g:fieldValue bean="${patientInstance}" field="ocupation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.sufferDiabetes}">
				<li class="fieldcontain">
					<span id="sufferDiabetes-label" class="property-label"><g:message code="patient.sufferDiabetes.label" default="Suffer Diabetes" /></span>
					
						<span class="property-value" aria-labelledby="sufferDiabetes-label"><g:formatBoolean boolean="${patientInstance?.sufferDiabetes}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.sufferFever}">
				<li class="fieldcontain">
					<span id="sufferFever-label" class="property-label"><g:message code="patient.sufferFever.label" default="Suffer Fever" /></span>
					
						<span class="property-value" aria-labelledby="sufferFever-label"><g:formatBoolean boolean="${patientInstance?.sufferFever}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.sufferHeartFailure}">
				<li class="fieldcontain">
					<span id="sufferHeartFailure-label" class="property-label"><g:message code="patient.sufferHeartFailure.label" default="Suffer Heart Failure" /></span>
					
						<span class="property-value" aria-labelledby="sufferHeartFailure-label"><g:formatBoolean boolean="${patientInstance?.sufferHeartFailure}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.sufferHernias}">
				<li class="fieldcontain">
					<span id="sufferHernias-label" class="property-label"><g:message code="patient.sufferHernias.label" default="Suffer Hernias" /></span>
					
						<span class="property-value" aria-labelledby="sufferHernias-label"><g:formatBoolean boolean="${patientInstance?.sufferHernias}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.sufferHypertension}">
				<li class="fieldcontain">
					<span id="sufferHypertension-label" class="property-label"><g:message code="patient.sufferHypertension.label" default="Suffer Hypertension" /></span>
					
						<span class="property-value" aria-labelledby="sufferHypertension-label"><g:formatBoolean boolean="${patientInstance?.sufferHypertension}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.sufferRenalInsufficiency}">
				<li class="fieldcontain">
					<span id="sufferRenalInsufficiency-label" class="property-label"><g:message code="patient.sufferRenalInsufficiency.label" default="Suffer Renal Insufficiency" /></span>
					
						<span class="property-value" aria-labelledby="sufferRenalInsufficiency-label"><g:formatBoolean boolean="${patientInstance?.sufferRenalInsufficiency}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.sufferhemorrhoid}">
				<li class="fieldcontain">
					<span id="sufferhemorrhoid-label" class="property-label"><g:message code="patient.sufferhemorrhoid.label" default="Sufferhemorrhoid" /></span>
					
						<span class="property-value" aria-labelledby="sufferhemorrhoid-label"><g:formatBoolean boolean="${patientInstance?.sufferhemorrhoid}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${patientInstance?.id}" />
					<g:link class="edit" action="edit" id="${patientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

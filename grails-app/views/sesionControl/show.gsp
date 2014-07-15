
<%@ page import="fastchacaito.SesionControl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sesionControl.label', default: 'SesionControl')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sesionControl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sesionControl" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sesionControl">
			
				<g:if test="${sesionControlInstance?.abdomen}">
				<li class="fieldcontain">
					<span id="abdomen-label" class="property-label"><g:message code="sesionControl.abdomen.label" default="Abdomen" /></span>
					
						<span class="property-value" aria-labelledby="abdomen-label"><g:formatBoolean boolean="${sesionControlInstance?.abdomen}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.achieved}">
				<li class="fieldcontain">
					<span id="achieved-label" class="property-label"><g:message code="sesionControl.achieved.label" default="Achieved" /></span>
					
						<span class="property-value" aria-labelledby="achieved-label"><g:formatBoolean boolean="${sesionControlInstance?.achieved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.hips}">
				<li class="fieldcontain">
					<span id="hips-label" class="property-label"><g:message code="sesionControl.hips.label" default="Hips" /></span>
					
						<span class="property-value" aria-labelledby="hips-label"><g:formatBoolean boolean="${sesionControlInstance?.hips}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.leftArm}">
				<li class="fieldcontain">
					<span id="leftArm-label" class="property-label"><g:message code="sesionControl.leftArm.label" default="Left Arm" /></span>
					
						<span class="property-value" aria-labelledby="leftArm-label"><g:formatBoolean boolean="${sesionControlInstance?.leftArm}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.leftCrotch}">
				<li class="fieldcontain">
					<span id="leftCrotch-label" class="property-label"><g:message code="sesionControl.leftCrotch.label" default="Left Crotch" /></span>
					
						<span class="property-value" aria-labelledby="leftCrotch-label"><g:formatBoolean boolean="${sesionControlInstance?.leftCrotch}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.leftThigh}">
				<li class="fieldcontain">
					<span id="leftThigh-label" class="property-label"><g:message code="sesionControl.leftThigh.label" default="Left Thigh" /></span>
					
						<span class="property-value" aria-labelledby="leftThigh-label"><g:formatBoolean boolean="${sesionControlInstance?.leftThigh}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.rightArm}">
				<li class="fieldcontain">
					<span id="rightArm-label" class="property-label"><g:message code="sesionControl.rightArm.label" default="Right Arm" /></span>
					
						<span class="property-value" aria-labelledby="rightArm-label"><g:formatBoolean boolean="${sesionControlInstance?.rightArm}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.rightCrotch}">
				<li class="fieldcontain">
					<span id="rightCrotch-label" class="property-label"><g:message code="sesionControl.rightCrotch.label" default="Right Crotch" /></span>
					
						<span class="property-value" aria-labelledby="rightCrotch-label"><g:formatBoolean boolean="${sesionControlInstance?.rightCrotch}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.rightThigh}">
				<li class="fieldcontain">
					<span id="rightThigh-label" class="property-label"><g:message code="sesionControl.rightThigh.label" default="Right Thigh" /></span>
					
						<span class="property-value" aria-labelledby="rightThigh-label"><g:formatBoolean boolean="${sesionControlInstance?.rightThigh}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.sesionNumber}">
				<li class="fieldcontain">
					<span id="sesionNumber-label" class="property-label"><g:message code="sesionControl.sesionNumber.label" default="Sesion Number" /></span>
					
						<span class="property-value" aria-labelledby="sesionNumber-label"><g:fieldValue bean="${sesionControlInstance}" field="sesionNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.vacutainer}">
				<li class="fieldcontain">
					<span id="vacutainer-label" class="property-label"><g:message code="sesionControl.vacutainer.label" default="Vacutainer" /></span>
					
						<span class="property-value" aria-labelledby="vacutainer-label"><g:link controller="vacutainer" action="show" id="${sesionControlInstance?.vacutainer?.id}">${sesionControlInstance?.vacutainer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.waist}">
				<li class="fieldcontain">
					<span id="waist-label" class="property-label"><g:message code="sesionControl.waist.label" default="Waist" /></span>
					
						<span class="property-value" aria-labelledby="waist-label"><g:formatBoolean boolean="${sesionControlInstance?.waist}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sesionControlInstance?.id}" />
					<g:link class="edit" action="edit" id="${sesionControlInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

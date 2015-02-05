
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
			
				<g:if test="${sesionControlInstance?.vacutainer2}">
				<li class="fieldcontain">
					<span id="vacutainer2-label" class="property-label"><g:message code="sesionControl.vacutainer2.label" default="Vacutainer2" /></span>
					
						<span class="property-value" aria-labelledby="vacutainer2-label"><g:link controller="vacutainer" action="show" id="${sesionControlInstance?.vacutainer2?.id}">${sesionControlInstance?.vacutainer2?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="sesionControl.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${sesionControlInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.kit}">
				<li class="fieldcontain">
					<span id="kit-label" class="property-label"><g:message code="sesionControl.kit.label" default="Kit" /></span>
					
						<span class="property-value" aria-labelledby="kit-label"><g:fieldValue bean="${sesionControlInstance}" field="kit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.mesotherapy}">
				<li class="fieldcontain">
					<span id="mesotherapy-label" class="property-label"><g:message code="sesionControl.mesotherapy.label" default="Mesotherapy" /></span>
					
						<span class="property-value" aria-labelledby="mesotherapy-label"><g:link controller="mesotherapy" action="show" id="${sesionControlInstance?.mesotherapy?.id}">${sesionControlInstance?.mesotherapy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sesionControlInstance?.secAppUser}">
				<li class="fieldcontain">
					<span id="secAppUser-label" class="property-label"><g:message code="sesionControl.secAppUser.label" default="Sec App User" /></span>
					
						<span class="property-value" aria-labelledby="secAppUser-label"><g:link controller="secAppUser" action="show" id="${sesionControlInstance?.secAppUser?.id}">${sesionControlInstance?.secAppUser?.encodeAsHTML()}</g:link></span>
					
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

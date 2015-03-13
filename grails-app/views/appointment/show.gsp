
<%@ page import="fastchacaito.Appointment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-appointment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-appointment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list appointment">
			
				<g:if test="${appointmentInstance?.attended}">
				<li class="fieldcontain">
					<span id="attended-label" class="property-label"><g:message code="appointment.attended.label" default="Attended" /></span>
					
						<span class="property-value" aria-labelledby="attended-label"><g:formatBoolean boolean="${appointmentInstance?.attended}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${appointmentInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="appointment.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${appointmentInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${appointmentInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="appointment.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:formatDate date="${appointmentInstance?.time}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${appointmentInstance?.treatment}">
				<li class="fieldcontain">
					<span id="treatment-label" class="property-label"><g:message code="appointment.treatment.label" default="Treatment" /></span>
					
						<span class="property-value" aria-labelledby="treatment-label"><g:link controller="treatment" action="show" id="${appointmentInstance?.treatment?.id}">${appointmentInstance?.treatment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${appointmentInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="appointment.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="secAppUser" action="show" id="${appointmentInstance?.user?.id}">${appointmentInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${appointmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${appointmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="fastchacaito.Mesotherapy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mesotherapy.label', default: 'Mesotherapy')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mesotherapy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mesotherapy" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mesotherapy">
			
				<g:if test="${mesotherapyInstance?.method}">
				<li class="fieldcontain">
					<span id="method-label" class="property-label"><g:message code="mesotherapy.method.label" default="Method" /></span>
					
						<span class="property-value" aria-labelledby="method-label"><g:fieldValue bean="${mesotherapyInstance}" field="method"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mesotherapyInstance?.ploblemCauses}">
				<li class="fieldcontain">
					<span id="ploblemCauses-label" class="property-label"><g:message code="mesotherapy.ploblemCauses.label" default="Ploblem Causes" /></span>
					
						<span class="property-value" aria-labelledby="ploblemCauses-label"><g:fieldValue bean="${mesotherapyInstance}" field="ploblemCauses"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mesotherapyInstance?.previousAttempts}">
				<li class="fieldcontain">
					<span id="previousAttempts-label" class="property-label"><g:message code="mesotherapy.previousAttempts.label" default="Previous Attempts" /></span>
					
						<span class="property-value" aria-labelledby="previousAttempts-label"><g:fieldValue bean="${mesotherapyInstance}" field="previousAttempts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mesotherapyInstance?.sesionControl}">
				<li class="fieldcontain">
					<span id="sesionControl-label" class="property-label"><g:message code="mesotherapy.sesionControl.label" default="Sesion Control" /></span>
					
						<span class="property-value" aria-labelledby="sesionControl-label"><g:link controller="sesionControl" action="show" id="${mesotherapyInstance?.sesionControl?.id}">${mesotherapyInstance?.sesionControl?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${mesotherapyInstance?.treatAreas}">
				<li class="fieldcontain">
					<span id="treatAreas-label" class="property-label"><g:message code="mesotherapy.treatAreas.label" default="Treat Areas" /></span>
					
						<span class="property-value" aria-labelledby="treatAreas-label"><g:fieldValue bean="${mesotherapyInstance}" field="treatAreas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mesotherapyInstance?.treatment}">
				<li class="fieldcontain">
					<span id="treatment-label" class="property-label"><g:message code="mesotherapy.treatment.label" default="Treatment" /></span>
					
						<span class="property-value" aria-labelledby="treatment-label"><g:link controller="treatment" action="show" id="${mesotherapyInstance?.treatment?.id}">${mesotherapyInstance?.treatment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${mesotherapyInstance?.id}" />
					<g:link class="edit" action="edit" id="${mesotherapyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

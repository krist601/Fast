
<%@ page import="fastchacaito.MassageControl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'massageControl.label', default: 'MassageControl')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-massageControl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-massageControl" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list massageControl">
			
				<g:if test="${massageControlInstance?.bodyTherapy}">
				<li class="fieldcontain">
					<span id="bodyTherapy-label" class="property-label"><g:message code="massageControl.bodyTherapy.label" default="Body Therapy" /></span>
					
						<span class="property-value" aria-labelledby="bodyTherapy-label"><g:link controller="bodyTherapy" action="show" id="${massageControlInstance?.bodyTherapy?.id}">${massageControlInstance?.bodyTherapy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${massageControlInstance?.massageDate}">
				<li class="fieldcontain">
					<span id="massageDate-label" class="property-label"><g:message code="massageControl.massageDate.label" default="Massage Date" /></span>
					
						<span class="property-value" aria-labelledby="massageDate-label"><g:link controller="date" action="show" id="${massageControlInstance?.massageDate?.id}">${massageControlInstance?.massageDate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${massageControlInstance?.massageNumber}">
				<li class="fieldcontain">
					<span id="massageNumber-label" class="property-label"><g:message code="massageControl.massageNumber.label" default="Massage Number" /></span>
					
						<span class="property-value" aria-labelledby="massageNumber-label"><g:fieldValue bean="${massageControlInstance}" field="massageNumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${massageControlInstance?.id}" />
					<g:link class="edit" action="edit" id="${massageControlInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

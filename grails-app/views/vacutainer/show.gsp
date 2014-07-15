
<%@ page import="fastchacaito.Vacutainer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vacutainer.label', default: 'Vacutainer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vacutainer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vacutainer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vacutainer">
			
				<g:if test="${vacutainerInstance?.arrivalDate}">
				<li class="fieldcontain">
					<span id="arrivalDate-label" class="property-label"><g:message code="vacutainer.arrivalDate.label" default="Arrival Date" /></span>
					
						<span class="property-value" aria-labelledby="arrivalDate-label"><g:link controller="date" action="show" id="${vacutainerInstance?.arrivalDate?.id}">${vacutainerInstance?.arrivalDate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacutainerInstance?.identifier}">
				<li class="fieldcontain">
					<span id="identifier-label" class="property-label"><g:message code="vacutainer.identifier.label" default="Identifier" /></span>
					
						<span class="property-value" aria-labelledby="identifier-label"><g:fieldValue bean="${vacutainerInstance}" field="identifier"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacutainerInstance?.lostDate}">
				<li class="fieldcontain">
					<span id="lostDate-label" class="property-label"><g:message code="vacutainer.lostDate.label" default="Lost Date" /></span>
					
						<span class="property-value" aria-labelledby="lostDate-label"><g:link controller="date" action="show" id="${vacutainerInstance?.lostDate?.id}">${vacutainerInstance?.lostDate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacutainerInstance?.vacutainerType}">
				<li class="fieldcontain">
					<span id="vacutainerType-label" class="property-label"><g:message code="vacutainer.vacutainerType.label" default="Vacutainer Type" /></span>
					
						<span class="property-value" aria-labelledby="vacutainerType-label"><g:fieldValue bean="${vacutainerInstance}" field="vacutainerType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vacutainerInstance?.id}" />
					<g:link class="edit" action="edit" id="${vacutainerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

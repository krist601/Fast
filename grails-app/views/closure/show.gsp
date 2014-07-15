
<%@ page import="fastchacaito.Closure" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'closure.label', default: 'Closure')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-closure" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-closure" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list closure">
			
				<g:if test="${closureInstance?.closureDate}">
				<li class="fieldcontain">
					<span id="closureDate-label" class="property-label"><g:message code="closure.closureDate.label" default="Closure Date" /></span>
					
						<span class="property-value" aria-labelledby="closureDate-label"><g:link controller="date" action="show" id="${closureInstance?.closureDate?.id}">${closureInstance?.closureDate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${closureInstance?.reportX}">
				<li class="fieldcontain">
					<span id="reportX-label" class="property-label"><g:message code="closure.reportX.label" default="Report X" /></span>
					
						<span class="property-value" aria-labelledby="reportX-label"><g:fieldValue bean="${closureInstance}" field="reportX"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${closureInstance?.reportZ}">
				<li class="fieldcontain">
					<span id="reportZ-label" class="property-label"><g:message code="closure.reportZ.label" default="Report Z" /></span>
					
						<span class="property-value" aria-labelledby="reportZ-label"><g:fieldValue bean="${closureInstance}" field="reportZ"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${closureInstance?.id}" />
					<g:link class="edit" action="edit" id="${closureInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

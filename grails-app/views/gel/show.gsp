
<%@ page import="fastchacaito.Gel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gel.label', default: 'Gel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gel">
			
				<g:if test="${gelInstance?.closure}">
				<li class="fieldcontain">
					<span id="closure-label" class="property-label"><g:message code="gel.closure.label" default="Closure" /></span>
					
						<span class="property-value" aria-labelledby="closure-label"><g:link controller="closure" action="show" id="${gelInstance?.closure?.id}">${gelInstance?.closure?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gelInstance?.outType}">
				<li class="fieldcontain">
					<span id="outType-label" class="property-label"><g:message code="gel.outType.label" default="Out Type" /></span>
					
						<span class="property-value" aria-labelledby="outType-label"><g:fieldValue bean="${gelInstance}" field="outType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gelInstance?.receivedDate}">
				<li class="fieldcontain">
					<span id="receivedDate-label" class="property-label"><g:message code="gel.receivedDate.label" default="Received Date" /></span>
					
						<span class="property-value" aria-labelledby="receivedDate-label"><g:link controller="date" action="show" id="${gelInstance?.receivedDate?.id}">${gelInstance?.receivedDate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gelInstance?.id}" />
					<g:link class="edit" action="edit" id="${gelInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

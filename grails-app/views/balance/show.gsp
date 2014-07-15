
<%@ page import="fastchacaito.Balance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'balance.label', default: 'Balance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-balance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-balance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list balance">
			
				<g:if test="${balanceInstance?.applicationAmount}">
				<li class="fieldcontain">
					<span id="applicationAmount-label" class="property-label"><g:message code="balance.applicationAmount.label" default="Application Amount" /></span>
					
						<span class="property-value" aria-labelledby="applicationAmount-label"><g:fieldValue bean="${balanceInstance}" field="applicationAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${balanceInstance?.idealWeight}">
				<li class="fieldcontain">
					<span id="idealWeight-label" class="property-label"><g:message code="balance.idealWeight.label" default="Ideal Weight" /></span>
					
						<span class="property-value" aria-labelledby="idealWeight-label"><g:fieldValue bean="${balanceInstance}" field="idealWeight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${balanceInstance?.treatment}">
				<li class="fieldcontain">
					<span id="treatment-label" class="property-label"><g:message code="balance.treatment.label" default="Treatment" /></span>
					
						<span class="property-value" aria-labelledby="treatment-label"><g:link controller="treatment" action="show" id="${balanceInstance?.treatment?.id}">${balanceInstance?.treatment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${balanceInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="balance.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${balanceInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${balanceInstance?.id}" />
					<g:link class="edit" action="edit" id="${balanceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

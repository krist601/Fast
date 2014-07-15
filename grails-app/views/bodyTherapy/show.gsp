
<%@ page import="fastchacaito.BodyTherapy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bodyTherapy.label', default: 'BodyTherapy')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bodyTherapy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bodyTherapy" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bodyTherapy">
			
				<g:if test="${bodyTherapyInstance?.massageType}">
				<li class="fieldcontain">
					<span id="massageType-label" class="property-label"><g:message code="bodyTherapy.massageType.label" default="Massage Type" /></span>
					
						<span class="property-value" aria-labelledby="massageType-label"><g:fieldValue bean="${bodyTherapyInstance}" field="massageType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bodyTherapyInstance?.treatment}">
				<li class="fieldcontain">
					<span id="treatment-label" class="property-label"><g:message code="bodyTherapy.treatment.label" default="Treatment" /></span>
					
						<span class="property-value" aria-labelledby="treatment-label"><g:link controller="treatment" action="show" id="${bodyTherapyInstance?.treatment?.id}">${bodyTherapyInstance?.treatment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bodyTherapyInstance?.id}" />
					<g:link class="edit" action="edit" id="${bodyTherapyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

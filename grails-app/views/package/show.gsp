
<%@ page import="fastchacaito.Package" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'package.label', default: 'Package')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-package" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-package" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list package">
			
				<g:if test="${packageInstance?.packageType}">
				<li class="fieldcontain">
					<span id="packageType-label" class="property-label"><g:message code="package.packageType.label" default="Package Type" /></span>
					
						<span class="property-value" aria-labelledby="packageType-label"><g:fieldValue bean="${packageInstance}" field="packageType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="package.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${packageInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.sesionAmount}">
				<li class="fieldcontain">
					<span id="sesionAmount-label" class="property-label"><g:message code="package.sesionAmount.label" default="Sesion Amount" /></span>
					
						<span class="property-value" aria-labelledby="sesionAmount-label"><g:fieldValue bean="${packageInstance}" field="sesionAmount"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${packageInstance?.id}" />
					<g:link class="edit" action="edit" id="${packageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

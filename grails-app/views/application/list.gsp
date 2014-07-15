
<%@ page import="fastchacaito.Application" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-application" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-application" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="application.arrivalDate.label" default="Arrival Date" /></th>
					
						<g:sortableColumn property="identifier" title="${message(code: 'application.identifier.label', default: 'Identifier')}" />
					
						<th><g:message code="application.lostDate.label" default="Lost Date" /></th>
					
						<th><g:message code="application.vacutainer.label" default="Vacutainer" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${applicationInstanceList}" status="i" var="applicationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${applicationInstance.id}">${fieldValue(bean: applicationInstance, field: "arrivalDate")}</g:link></td>
					
						<td>${fieldValue(bean: applicationInstance, field: "identifier")}</td>
					
						<td>${fieldValue(bean: applicationInstance, field: "lostDate")}</td>
					
						<td>${fieldValue(bean: applicationInstance, field: "vacutainer")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${applicationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

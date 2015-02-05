
<%@ page import="fastchacaito.SesionControl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sesionControl.label', default: 'SesionControl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sesionControl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sesionControl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="sesionControl.vacutainer2.label" default="Vacutainer2" /></th>
					
						<g:sortableColumn property="date" title="${message(code: 'sesionControl.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="kit" title="${message(code: 'sesionControl.kit.label', default: 'Kit')}" />
					
						<th><g:message code="sesionControl.mesotherapy.label" default="Mesotherapy" /></th>
					
						<th><g:message code="sesionControl.secAppUser.label" default="Sec App User" /></th>
					
						<g:sortableColumn property="sesionNumber" title="${message(code: 'sesionControl.sesionNumber.label', default: 'Sesion Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sesionControlInstanceList}" status="i" var="sesionControlInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sesionControlInstance.id}">${fieldValue(bean: sesionControlInstance, field: "vacutainer2")}</g:link></td>
					
						<td><g:formatDate date="${sesionControlInstance.date}" /></td>
					
						<td>${fieldValue(bean: sesionControlInstance, field: "kit")}</td>
					
						<td>${fieldValue(bean: sesionControlInstance, field: "mesotherapy")}</td>
					
						<td>${fieldValue(bean: sesionControlInstance, field: "secAppUser")}</td>
					
						<td>${fieldValue(bean: sesionControlInstance, field: "sesionNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sesionControlInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

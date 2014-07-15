
<%@ page import="fastchacaito.Mesotherapy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mesotherapy.label', default: 'Mesotherapy')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mesotherapy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mesotherapy" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="method" title="${message(code: 'mesotherapy.method.label', default: 'Method')}" />
					
						<g:sortableColumn property="ploblemCauses" title="${message(code: 'mesotherapy.ploblemCauses.label', default: 'Ploblem Causes')}" />
					
						<g:sortableColumn property="previousAttempts" title="${message(code: 'mesotherapy.previousAttempts.label', default: 'Previous Attempts')}" />
					
						<th><g:message code="mesotherapy.sesionControl.label" default="Sesion Control" /></th>
					
						<g:sortableColumn property="treatAreas" title="${message(code: 'mesotherapy.treatAreas.label', default: 'Treat Areas')}" />
					
						<th><g:message code="mesotherapy.treatment.label" default="Treatment" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mesotherapyInstanceList}" status="i" var="mesotherapyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mesotherapyInstance.id}">${fieldValue(bean: mesotherapyInstance, field: "method")}</g:link></td>
					
						<td>${fieldValue(bean: mesotherapyInstance, field: "ploblemCauses")}</td>
					
						<td>${fieldValue(bean: mesotherapyInstance, field: "previousAttempts")}</td>
					
						<td>${fieldValue(bean: mesotherapyInstance, field: "sesionControl")}</td>
					
						<td>${fieldValue(bean: mesotherapyInstance, field: "treatAreas")}</td>
					
						<td>${fieldValue(bean: mesotherapyInstance, field: "treatment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mesotherapyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

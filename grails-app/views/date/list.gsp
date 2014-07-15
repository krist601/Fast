
<%@ page import="fastchacaito.Date" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'date.label', default: 'Date')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-date" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-date" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="date.beginDate.label" default="Begin Date" /></th>
					
						<g:sortableColumn property="dateType" title="${message(code: 'date.dateType.label', default: 'Date Type')}" />
					
						<th><g:message code="date.endDate.label" default="End Date" /></th>
					
						<th><g:message code="date.patient.label" default="Patient" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dateInstanceList}" status="i" var="dateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dateInstance.id}">${fieldValue(bean: dateInstance, field: "beginDate")}</g:link></td>
					
						<td>${fieldValue(bean: dateInstance, field: "dateType")}</td>
					
						<td>${fieldValue(bean: dateInstance, field: "endDate")}</td>
					
						<td>${fieldValue(bean: dateInstance, field: "patient")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dateInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

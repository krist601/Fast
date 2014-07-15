
<%@ page import="fastchacaito.ApplicationControl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicationControl.label', default: 'ApplicationControl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-applicationControl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-applicationControl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="applicationControl.application.label" default="Application" /></th>
					
						<th><g:message code="applicationControl.balance.label" default="Balance" /></th>
					
						<g:sortableColumn property="currentWeight" title="${message(code: 'applicationControl.currentWeight.label', default: 'Current Weight')}" />
					
						<th><g:message code="applicationControl.date.label" default="Date" /></th>
					
						<g:sortableColumn property="differenceWeight" title="${message(code: 'applicationControl.differenceWeight.label', default: 'Difference Weight')}" />
					
						<g:sortableColumn property="identifierNumber" title="${message(code: 'applicationControl.identifierNumber.label', default: 'Identifier Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${applicationControlInstanceList}" status="i" var="applicationControlInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${applicationControlInstance.id}">${fieldValue(bean: applicationControlInstance, field: "application")}</g:link></td>
					
						<td>${fieldValue(bean: applicationControlInstance, field: "balance")}</td>
					
						<td>${fieldValue(bean: applicationControlInstance, field: "currentWeight")}</td>
					
						<td>${fieldValue(bean: applicationControlInstance, field: "date")}</td>
					
						<td>${fieldValue(bean: applicationControlInstance, field: "differenceWeight")}</td>
					
						<td>${fieldValue(bean: applicationControlInstance, field: "identifierNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${applicationControlInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="fastchacaito.MeasuresControl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'measuresControl.label', default: 'MeasuresControl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-measuresControl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-measuresControl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="measuresControl.machine.label" default="Machine" /></th>
					
						<g:sortableColumn property="abdomen" title="${message(code: 'measuresControl.abdomen.label', default: 'Abdomen')}" />
					
						<g:sortableColumn property="achieved" title="${message(code: 'measuresControl.achieved.label', default: 'Achieved')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'measuresControl.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="hips" title="${message(code: 'measuresControl.hips.label', default: 'Hips')}" />
					
						<g:sortableColumn property="identifierNumber" title="${message(code: 'measuresControl.identifierNumber.label', default: 'Identifier Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${measuresControlInstanceList}" status="i" var="measuresControlInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${measuresControlInstance.id}">${fieldValue(bean: measuresControlInstance, field: "machine")}</g:link></td>
					
						<td>${fieldValue(bean: measuresControlInstance, field: "abdomen")}</td>
					
						<td>${fieldValue(bean: measuresControlInstance, field: "achieved")}</td>
					
						<td><g:formatDate date="${measuresControlInstance.date}" /></td>
					
						<td>${fieldValue(bean: measuresControlInstance, field: "hips")}</td>
					
						<td>${fieldValue(bean: measuresControlInstance, field: "identifierNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${measuresControlInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="fastchacaito.Machine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'machine.label', default: 'Machine')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-machine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-machine" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="machineType" title="${message(code: 'machine.machineType.label', default: 'Machine Type')}" />
					
						<th><g:message code="machine.treatment.label" default="Treatment" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${machineInstanceList}" status="i" var="machineInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${machineInstance.id}">${fieldValue(bean: machineInstance, field: "machineType")}</g:link></td>
					
						<td>${fieldValue(bean: machineInstance, field: "treatment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${machineInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

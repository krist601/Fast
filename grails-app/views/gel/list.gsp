
<%@ page import="fastchacaito.Gel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gel.label', default: 'Gel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="gel.closure.label" default="Closure" /></th>
					
						<g:sortableColumn property="outType" title="${message(code: 'gel.outType.label', default: 'Out Type')}" />
					
						<th><g:message code="gel.receivedDate.label" default="Received Date" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gelInstanceList}" status="i" var="gelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gelInstance.id}">${fieldValue(bean: gelInstance, field: "closure")}</g:link></td>
					
						<td>${fieldValue(bean: gelInstance, field: "outType")}</td>
					
						<td>${fieldValue(bean: gelInstance, field: "receivedDate")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gelInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="fastchacaito.Closure" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'closure.label', default: 'Closure')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-closure" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-closure" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="closure.closureDate.label" default="Closure Date" /></th>
					
						<g:sortableColumn property="reportX" title="${message(code: 'closure.reportX.label', default: 'Report X')}" />
					
						<g:sortableColumn property="reportZ" title="${message(code: 'closure.reportZ.label', default: 'Report Z')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${closureInstanceList}" status="i" var="closureInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${closureInstance.id}">${fieldValue(bean: closureInstance, field: "closureDate")}</g:link></td>
					
						<td>${fieldValue(bean: closureInstance, field: "reportX")}</td>
					
						<td>${fieldValue(bean: closureInstance, field: "reportZ")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${closureInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

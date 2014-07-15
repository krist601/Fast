
<%@ page import="fastchacaito.Vacutainer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vacutainer.label', default: 'Vacutainer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vacutainer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vacutainer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="vacutainer.arrivalDate.label" default="Arrival Date" /></th>
					
						<g:sortableColumn property="identifier" title="${message(code: 'vacutainer.identifier.label', default: 'Identifier')}" />
					
						<th><g:message code="vacutainer.lostDate.label" default="Lost Date" /></th>
					
						<g:sortableColumn property="vacutainerType" title="${message(code: 'vacutainer.vacutainerType.label', default: 'Vacutainer Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vacutainerInstanceList}" status="i" var="vacutainerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vacutainerInstance.id}">${fieldValue(bean: vacutainerInstance, field: "arrivalDate")}</g:link></td>
					
						<td>${fieldValue(bean: vacutainerInstance, field: "identifier")}</td>
					
						<td>${fieldValue(bean: vacutainerInstance, field: "lostDate")}</td>
					
						<td>${fieldValue(bean: vacutainerInstance, field: "vacutainerType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vacutainerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

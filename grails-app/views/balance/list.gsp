
<%@ page import="fastchacaito.Balance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'balance.label', default: 'Balance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-balance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-balance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="applicationAmount" title="${message(code: 'balance.applicationAmount.label', default: 'Application Amount')}" />
					
						<g:sortableColumn property="idealWeight" title="${message(code: 'balance.idealWeight.label', default: 'Ideal Weight')}" />
					
						<th><g:message code="balance.treatment.label" default="Treatment" /></th>
					
						<g:sortableColumn property="type" title="${message(code: 'balance.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${balanceInstanceList}" status="i" var="balanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${balanceInstance.id}">${fieldValue(bean: balanceInstance, field: "applicationAmount")}</g:link></td>
					
						<td>${fieldValue(bean: balanceInstance, field: "idealWeight")}</td>
					
						<td>${fieldValue(bean: balanceInstance, field: "treatment")}</td>
					
						<td>${fieldValue(bean: balanceInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${balanceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

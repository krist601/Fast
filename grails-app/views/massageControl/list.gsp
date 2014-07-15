
<%@ page import="fastchacaito.MassageControl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'massageControl.label', default: 'MassageControl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-massageControl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-massageControl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="massageControl.bodyTherapy.label" default="Body Therapy" /></th>
					
						<th><g:message code="massageControl.massageDate.label" default="Massage Date" /></th>
					
						<g:sortableColumn property="massageNumber" title="${message(code: 'massageControl.massageNumber.label', default: 'Massage Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${massageControlInstanceList}" status="i" var="massageControlInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${massageControlInstance.id}">${fieldValue(bean: massageControlInstance, field: "bodyTherapy")}</g:link></td>
					
						<td>${fieldValue(bean: massageControlInstance, field: "massageDate")}</td>
					
						<td>${fieldValue(bean: massageControlInstance, field: "massageNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${massageControlInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

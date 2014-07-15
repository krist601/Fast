
<%@ page import="fastchacaito.SesionControl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sesionControl.label', default: 'SesionControl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sesionControl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sesionControl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="abdomen" title="${message(code: 'sesionControl.abdomen.label', default: 'Abdomen')}" />
					
						<g:sortableColumn property="achieved" title="${message(code: 'sesionControl.achieved.label', default: 'Achieved')}" />
					
						<g:sortableColumn property="hips" title="${message(code: 'sesionControl.hips.label', default: 'Hips')}" />
					
						<g:sortableColumn property="leftArm" title="${message(code: 'sesionControl.leftArm.label', default: 'Left Arm')}" />
					
						<g:sortableColumn property="leftCrotch" title="${message(code: 'sesionControl.leftCrotch.label', default: 'Left Crotch')}" />
					
						<g:sortableColumn property="leftThigh" title="${message(code: 'sesionControl.leftThigh.label', default: 'Left Thigh')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sesionControlInstanceList}" status="i" var="sesionControlInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sesionControlInstance.id}">${fieldValue(bean: sesionControlInstance, field: "abdomen")}</g:link></td>
					
						<td><g:formatBoolean boolean="${sesionControlInstance.achieved}" /></td>
					
						<td><g:formatBoolean boolean="${sesionControlInstance.hips}" /></td>
					
						<td><g:formatBoolean boolean="${sesionControlInstance.leftArm}" /></td>
					
						<td><g:formatBoolean boolean="${sesionControlInstance.leftCrotch}" /></td>
					
						<td><g:formatBoolean boolean="${sesionControlInstance.leftThigh}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sesionControlInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

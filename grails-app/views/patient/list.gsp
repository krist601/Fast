
<%@ page import="fastchacaito.Patient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-patient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-patient" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="address" title="${message(code: 'patient.address.label', default: 'Address')}" />
					
						<th><g:message code="patient.admisionDate.label" default="Admision Date" /></th>
					
						<g:sortableColumn property="allergy" title="${message(code: 'patient.allergy.label', default: 'Allergy')}" />
					
						<g:sortableColumn property="bornDate" title="${message(code: 'patient.bornDate.label', default: 'Born Date')}" />
					
						<g:sortableColumn property="cedula" title="${message(code: 'patient.cedula.label', default: 'Cedula')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'patient.firstName.label', default: 'First Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${patientInstanceList}" status="i" var="patientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${patientInstance.id}">${fieldValue(bean: patientInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: patientInstance, field: "admisionDate")}</td>
					
						<td>${fieldValue(bean: patientInstance, field: "allergy")}</td>
					
						<td>${fieldValue(bean: patientInstance, field: "bornDate")}</td>
					
						<td>${fieldValue(bean: patientInstance, field: "cedula")}</td>
					
						<td>${fieldValue(bean: patientInstance, field: "firstName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${patientInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

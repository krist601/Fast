
<%@ page import="fastchacaito.BloodSample" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bloodSample.label', default: 'BloodSample')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bloodSample" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bloodSample" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="bloodSample.patient.label" default="Patient" /></th>
					
						<th><g:message code="bloodSample.receiptData.label" default="Receipt Data" /></th>
					
						<th><g:message code="bloodSample.receivedDate.label" default="Received Date" /></th>
					
						<th><g:message code="bloodSample.shippingDate.label" default="Shipping Date" /></th>
					
						<g:sortableColumn property="testType" title="${message(code: 'bloodSample.testType.label', default: 'Test Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bloodSampleInstanceList}" status="i" var="bloodSampleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bloodSampleInstance.id}">${fieldValue(bean: bloodSampleInstance, field: "patient")}</g:link></td>
					
						<td>${fieldValue(bean: bloodSampleInstance, field: "receiptData")}</td>
					
						<td>${fieldValue(bean: bloodSampleInstance, field: "receivedDate")}</td>
					
						<td>${fieldValue(bean: bloodSampleInstance, field: "shippingDate")}</td>
					
						<td>${fieldValue(bean: bloodSampleInstance, field: "testType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bloodSampleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="fastchacaito.Treatment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'treatment.label', default: 'Treatment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-treatment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-treatment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="treatment.beginDate.label" default="Begin Date" /></th>
					
						<th><g:message code="treatment.date.label" default="Date" /></th>
					
						<th><g:message code="treatment.endDate.label" default="End Date" /></th>
					
						<th><g:message code="treatment.packages.label" default="Packages" /></th>
					
						<th><g:message code="treatment.paymentMethod.label" default="Payment Method" /></th>
					
						<th><g:message code="treatment.totalPrice.label" default="Total Price" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${treatmentInstanceList}" status="i" var="treatmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${treatmentInstance.id}">${fieldValue(bean: treatmentInstance, field: "beginDate")}</g:link></td>
					
						<td>${fieldValue(bean: treatmentInstance, field: "date")}</td>
					
						<td>${fieldValue(bean: treatmentInstance, field: "endDate")}</td>
					
						<td>${fieldValue(bean: treatmentInstance, field: "packages")}</td>
					
						<td>${fieldValue(bean: treatmentInstance, field: "paymentMethod")}</td>
					
						<td>${fieldValue(bean: treatmentInstance, field: "totalPrice")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${treatmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

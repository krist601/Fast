
<%@ page import="fastchacaito.PaymentMethod" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'paymentMethod.label', default: 'PaymentMethod')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-paymentMethod" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-paymentMethod" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'paymentMethod.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="bank" title="${message(code: 'paymentMethod.bank.label', default: 'Bank')}" />
					
						<g:sortableColumn property="paymentMethodType" title="${message(code: 'paymentMethod.paymentMethodType.label', default: 'Payment Method Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${paymentMethodInstanceList}" status="i" var="paymentMethodInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${paymentMethodInstance.id}">${fieldValue(bean: paymentMethodInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: paymentMethodInstance, field: "bank")}</td>
					
						<td>${fieldValue(bean: paymentMethodInstance, field: "paymentMethodType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${paymentMethodInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="fastchacaito.MedicHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicHistory.label', default: 'MedicHistory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-medicHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-medicHistory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="medicHistory.date.label" default="Date" /></th>
					
						<g:sortableColumn property="familyHistory" title="${message(code: 'medicHistory.familyHistory.label', default: 'Family History')}" />
					
						<g:sortableColumn property="funtionalTestCardiovascular" title="${message(code: 'medicHistory.funtionalTestCardiovascular.label', default: 'Funtional Test Cardiovascular')}" />
					
						<g:sortableColumn property="funtionalTestDigestive" title="${message(code: 'medicHistory.funtionalTestDigestive.label', default: 'Funtional Test Digestive')}" />
					
						<g:sortableColumn property="funtionalTestGynecological" title="${message(code: 'medicHistory.funtionalTestGynecological.label', default: 'Funtional Test Gynecological')}" />
					
						<g:sortableColumn property="funtionalTestMetabolicEndocrine" title="${message(code: 'medicHistory.funtionalTestMetabolicEndocrine.label', default: 'Funtional Test Metabolic Endocrine')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${medicHistoryInstanceList}" status="i" var="medicHistoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${medicHistoryInstance.id}">${fieldValue(bean: medicHistoryInstance, field: "date")}</g:link></td>
					
						<td>${fieldValue(bean: medicHistoryInstance, field: "familyHistory")}</td>
					
						<td>${fieldValue(bean: medicHistoryInstance, field: "funtionalTestCardiovascular")}</td>
					
						<td>${fieldValue(bean: medicHistoryInstance, field: "funtionalTestDigestive")}</td>
					
						<td>${fieldValue(bean: medicHistoryInstance, field: "funtionalTestGynecological")}</td>
					
						<td>${fieldValue(bean: medicHistoryInstance, field: "funtionalTestMetabolicEndocrine")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medicHistoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="fastchacaito.MeasuresControl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'measuresControl.label', default: 'MeasuresControl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-measuresControl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-measuresControl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="bellyAfter" title="${message(code: 'measuresControl.bellyAfter.label', default: 'Belly After')}" />
					
						<g:sortableColumn property="bellyBefore" title="${message(code: 'measuresControl.bellyBefore.label', default: 'Belly Before')}" />
					
						<g:sortableColumn property="hipAfter" title="${message(code: 'measuresControl.hipAfter.label', default: 'Hip After')}" />
					
						<g:sortableColumn property="hipBefore" title="${message(code: 'measuresControl.hipBefore.label', default: 'Hip Before')}" />
					
						<g:sortableColumn property="leftCrotchAfter" title="${message(code: 'measuresControl.leftCrotchAfter.label', default: 'Left Crotch After')}" />
					
						<g:sortableColumn property="leftCrotchBefore" title="${message(code: 'measuresControl.leftCrotchBefore.label', default: 'Left Crotch Before')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${measuresControlInstanceList}" status="i" var="measuresControlInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${measuresControlInstance.id}">${fieldValue(bean: measuresControlInstance, field: "bellyAfter")}</g:link></td>
					
						<td>${fieldValue(bean: measuresControlInstance, field: "bellyBefore")}</td>
					
						<td>${fieldValue(bean: measuresControlInstance, field: "hipAfter")}</td>
					
						<td>${fieldValue(bean: measuresControlInstance, field: "hipBefore")}</td>
					
						<td>${fieldValue(bean: measuresControlInstance, field: "leftCrotchAfter")}</td>
					
						<td>${fieldValue(bean: measuresControlInstance, field: "leftCrotchBefore")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${measuresControlInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

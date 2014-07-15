
<%@ page import="fastchacaito.MeasuresControl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'measuresControl.label', default: 'MeasuresControl')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-measuresControl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-measuresControl" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list measuresControl">
			
				<g:if test="${measuresControlInstance?.bellyAfter}">
				<li class="fieldcontain">
					<span id="bellyAfter-label" class="property-label"><g:message code="measuresControl.bellyAfter.label" default="Belly After" /></span>
					
						<span class="property-value" aria-labelledby="bellyAfter-label"><g:fieldValue bean="${measuresControlInstance}" field="bellyAfter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.bellyBefore}">
				<li class="fieldcontain">
					<span id="bellyBefore-label" class="property-label"><g:message code="measuresControl.bellyBefore.label" default="Belly Before" /></span>
					
						<span class="property-value" aria-labelledby="bellyBefore-label"><g:fieldValue bean="${measuresControlInstance}" field="bellyBefore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.hipAfter}">
				<li class="fieldcontain">
					<span id="hipAfter-label" class="property-label"><g:message code="measuresControl.hipAfter.label" default="Hip After" /></span>
					
						<span class="property-value" aria-labelledby="hipAfter-label"><g:fieldValue bean="${measuresControlInstance}" field="hipAfter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.hipBefore}">
				<li class="fieldcontain">
					<span id="hipBefore-label" class="property-label"><g:message code="measuresControl.hipBefore.label" default="Hip Before" /></span>
					
						<span class="property-value" aria-labelledby="hipBefore-label"><g:fieldValue bean="${measuresControlInstance}" field="hipBefore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.leftCrotchAfter}">
				<li class="fieldcontain">
					<span id="leftCrotchAfter-label" class="property-label"><g:message code="measuresControl.leftCrotchAfter.label" default="Left Crotch After" /></span>
					
						<span class="property-value" aria-labelledby="leftCrotchAfter-label"><g:fieldValue bean="${measuresControlInstance}" field="leftCrotchAfter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.leftCrotchBefore}">
				<li class="fieldcontain">
					<span id="leftCrotchBefore-label" class="property-label"><g:message code="measuresControl.leftCrotchBefore.label" default="Left Crotch Before" /></span>
					
						<span class="property-value" aria-labelledby="leftCrotchBefore-label"><g:fieldValue bean="${measuresControlInstance}" field="leftCrotchBefore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.leftThighAfter}">
				<li class="fieldcontain">
					<span id="leftThighAfter-label" class="property-label"><g:message code="measuresControl.leftThighAfter.label" default="Left Thigh After" /></span>
					
						<span class="property-value" aria-labelledby="leftThighAfter-label"><g:fieldValue bean="${measuresControlInstance}" field="leftThighAfter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.leftThighBefore}">
				<li class="fieldcontain">
					<span id="leftThighBefore-label" class="property-label"><g:message code="measuresControl.leftThighBefore.label" default="Left Thigh Before" /></span>
					
						<span class="property-value" aria-labelledby="leftThighBefore-label"><g:fieldValue bean="${measuresControlInstance}" field="leftThighBefore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.machine}">
				<li class="fieldcontain">
					<span id="machine-label" class="property-label"><g:message code="measuresControl.machine.label" default="Machine" /></span>
					
						<span class="property-value" aria-labelledby="machine-label"><g:link controller="machine" action="show" id="${measuresControlInstance?.machine?.id}">${measuresControlInstance?.machine?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.measureDate}">
				<li class="fieldcontain">
					<span id="measureDate-label" class="property-label"><g:message code="measuresControl.measureDate.label" default="Measure Date" /></span>
					
						<span class="property-value" aria-labelledby="measureDate-label"><g:link controller="date" action="show" id="${measuresControlInstance?.measureDate?.id}">${measuresControlInstance?.measureDate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.rightCrotchAfter}">
				<li class="fieldcontain">
					<span id="rightCrotchAfter-label" class="property-label"><g:message code="measuresControl.rightCrotchAfter.label" default="Right Crotch After" /></span>
					
						<span class="property-value" aria-labelledby="rightCrotchAfter-label"><g:fieldValue bean="${measuresControlInstance}" field="rightCrotchAfter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.rightCrotchBefore}">
				<li class="fieldcontain">
					<span id="rightCrotchBefore-label" class="property-label"><g:message code="measuresControl.rightCrotchBefore.label" default="Right Crotch Before" /></span>
					
						<span class="property-value" aria-labelledby="rightCrotchBefore-label"><g:fieldValue bean="${measuresControlInstance}" field="rightCrotchBefore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.rightThighAfter}">
				<li class="fieldcontain">
					<span id="rightThighAfter-label" class="property-label"><g:message code="measuresControl.rightThighAfter.label" default="Right Thigh After" /></span>
					
						<span class="property-value" aria-labelledby="rightThighAfter-label"><g:fieldValue bean="${measuresControlInstance}" field="rightThighAfter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.rightThighBefore}">
				<li class="fieldcontain">
					<span id="rightThighBefore-label" class="property-label"><g:message code="measuresControl.rightThighBefore.label" default="Right Thigh Before" /></span>
					
						<span class="property-value" aria-labelledby="rightThighBefore-label"><g:fieldValue bean="${measuresControlInstance}" field="rightThighBefore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.waistAfter}">
				<li class="fieldcontain">
					<span id="waistAfter-label" class="property-label"><g:message code="measuresControl.waistAfter.label" default="Waist After" /></span>
					
						<span class="property-value" aria-labelledby="waistAfter-label"><g:fieldValue bean="${measuresControlInstance}" field="waistAfter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.waistBefore}">
				<li class="fieldcontain">
					<span id="waistBefore-label" class="property-label"><g:message code="measuresControl.waistBefore.label" default="Waist Before" /></span>
					
						<span class="property-value" aria-labelledby="waistBefore-label"><g:fieldValue bean="${measuresControlInstance}" field="waistBefore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.weightAfter}">
				<li class="fieldcontain">
					<span id="weightAfter-label" class="property-label"><g:message code="measuresControl.weightAfter.label" default="Weight After" /></span>
					
						<span class="property-value" aria-labelledby="weightAfter-label"><g:fieldValue bean="${measuresControlInstance}" field="weightAfter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.weightBefore}">
				<li class="fieldcontain">
					<span id="weightBefore-label" class="property-label"><g:message code="measuresControl.weightBefore.label" default="Weight Before" /></span>
					
						<span class="property-value" aria-labelledby="weightBefore-label"><g:fieldValue bean="${measuresControlInstance}" field="weightBefore"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${measuresControlInstance?.id}" />
					<g:link class="edit" action="edit" id="${measuresControlInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

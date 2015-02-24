
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
			
				<g:if test="${measuresControlInstance?.machine}">
				<li class="fieldcontain">
					<span id="machine-label" class="property-label"><g:message code="measuresControl.machine.label" default="Machine" /></span>
					
						<span class="property-value" aria-labelledby="machine-label"><g:link controller="machine" action="show" id="${measuresControlInstance?.machine?.id}">${measuresControlInstance?.machine?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.abdomen}">
				<li class="fieldcontain">
					<span id="abdomen-label" class="property-label"><g:message code="measuresControl.abdomen.label" default="Abdomen" /></span>
					
						<span class="property-value" aria-labelledby="abdomen-label"><g:fieldValue bean="${measuresControlInstance}" field="abdomen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.achieved}">
				<li class="fieldcontain">
					<span id="achieved-label" class="property-label"><g:message code="measuresControl.achieved.label" default="Achieved" /></span>
					
						<span class="property-value" aria-labelledby="achieved-label"><g:fieldValue bean="${measuresControlInstance}" field="achieved"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.balance}">
				<li class="fieldcontain">
					<span id="balance-label" class="property-label"><g:message code="measuresControl.balance.label" default="Balance" /></span>
					
						<span class="property-value" aria-labelledby="balance-label"><g:link controller="applicationControl" action="show" id="${measuresControlInstance?.balance?.id}">${measuresControlInstance?.balance?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="measuresControl.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${measuresControlInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.hips}">
				<li class="fieldcontain">
					<span id="hips-label" class="property-label"><g:message code="measuresControl.hips.label" default="Hips" /></span>
					
						<span class="property-value" aria-labelledby="hips-label"><g:fieldValue bean="${measuresControlInstance}" field="hips"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.identifierNumber}">
				<li class="fieldcontain">
					<span id="identifierNumber-label" class="property-label"><g:message code="measuresControl.identifierNumber.label" default="Identifier Number" /></span>
					
						<span class="property-value" aria-labelledby="identifierNumber-label"><g:fieldValue bean="${measuresControlInstance}" field="identifierNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.leftArm}">
				<li class="fieldcontain">
					<span id="leftArm-label" class="property-label"><g:message code="measuresControl.leftArm.label" default="Left Arm" /></span>
					
						<span class="property-value" aria-labelledby="leftArm-label"><g:fieldValue bean="${measuresControlInstance}" field="leftArm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.leftCrotch}">
				<li class="fieldcontain">
					<span id="leftCrotch-label" class="property-label"><g:message code="measuresControl.leftCrotch.label" default="Left Crotch" /></span>
					
						<span class="property-value" aria-labelledby="leftCrotch-label"><g:fieldValue bean="${measuresControlInstance}" field="leftCrotch"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.leftThigh}">
				<li class="fieldcontain">
					<span id="leftThigh-label" class="property-label"><g:message code="measuresControl.leftThigh.label" default="Left Thigh" /></span>
					
						<span class="property-value" aria-labelledby="leftThigh-label"><g:fieldValue bean="${measuresControlInstance}" field="leftThigh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.mesotherapy}">
				<li class="fieldcontain">
					<span id="mesotherapy-label" class="property-label"><g:message code="measuresControl.mesotherapy.label" default="Mesotherapy" /></span>
					
						<span class="property-value" aria-labelledby="mesotherapy-label"><g:link controller="sesionControl" action="show" id="${measuresControlInstance?.mesotherapy?.id}">${measuresControlInstance?.mesotherapy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.rightArm}">
				<li class="fieldcontain">
					<span id="rightArm-label" class="property-label"><g:message code="measuresControl.rightArm.label" default="Right Arm" /></span>
					
						<span class="property-value" aria-labelledby="rightArm-label"><g:fieldValue bean="${measuresControlInstance}" field="rightArm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.rightCrotch}">
				<li class="fieldcontain">
					<span id="rightCrotch-label" class="property-label"><g:message code="measuresControl.rightCrotch.label" default="Right Crotch" /></span>
					
						<span class="property-value" aria-labelledby="rightCrotch-label"><g:fieldValue bean="${measuresControlInstance}" field="rightCrotch"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.rightThigh}">
				<li class="fieldcontain">
					<span id="rightThigh-label" class="property-label"><g:message code="measuresControl.rightThigh.label" default="Right Thigh" /></span>
					
						<span class="property-value" aria-labelledby="rightThigh-label"><g:fieldValue bean="${measuresControlInstance}" field="rightThigh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.secAppUser}">
				<li class="fieldcontain">
					<span id="secAppUser-label" class="property-label"><g:message code="measuresControl.secAppUser.label" default="Sec App User" /></span>
					
						<span class="property-value" aria-labelledby="secAppUser-label"><g:link controller="secAppUser" action="show" id="${measuresControlInstance?.secAppUser?.id}">${measuresControlInstance?.secAppUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${measuresControlInstance?.waist}">
				<li class="fieldcontain">
					<span id="waist-label" class="property-label"><g:message code="measuresControl.waist.label" default="Waist" /></span>
					
						<span class="property-value" aria-labelledby="waist-label"><g:fieldValue bean="${measuresControlInstance}" field="waist"/></span>
					
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

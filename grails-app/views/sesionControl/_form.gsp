<%@ page import="fastchacaito.SesionControl" %>



<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'abdomen', 'error')} ">
	<label for="abdomen">
		<g:message code="sesionControl.abdomen.label" default="Abdomen" />
		
	</label>
	<g:checkBox name="abdomen" value="${sesionControlInstance?.abdomen}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'achieved', 'error')} ">
	<label for="achieved">
		<g:message code="sesionControl.achieved.label" default="Achieved" />
		
	</label>
	<g:checkBox name="achieved" value="${sesionControlInstance?.achieved}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'hips', 'error')} ">
	<label for="hips">
		<g:message code="sesionControl.hips.label" default="Hips" />
		
	</label>
	<g:checkBox name="hips" value="${sesionControlInstance?.hips}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'leftArm', 'error')} ">
	<label for="leftArm">
		<g:message code="sesionControl.leftArm.label" default="Left Arm" />
		
	</label>
	<g:checkBox name="leftArm" value="${sesionControlInstance?.leftArm}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'leftCrotch', 'error')} ">
	<label for="leftCrotch">
		<g:message code="sesionControl.leftCrotch.label" default="Left Crotch" />
		
	</label>
	<g:checkBox name="leftCrotch" value="${sesionControlInstance?.leftCrotch}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'leftThigh', 'error')} ">
	<label for="leftThigh">
		<g:message code="sesionControl.leftThigh.label" default="Left Thigh" />
		
	</label>
	<g:checkBox name="leftThigh" value="${sesionControlInstance?.leftThigh}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'rightArm', 'error')} ">
	<label for="rightArm">
		<g:message code="sesionControl.rightArm.label" default="Right Arm" />
		
	</label>
	<g:checkBox name="rightArm" value="${sesionControlInstance?.rightArm}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'rightCrotch', 'error')} ">
	<label for="rightCrotch">
		<g:message code="sesionControl.rightCrotch.label" default="Right Crotch" />
		
	</label>
	<g:checkBox name="rightCrotch" value="${sesionControlInstance?.rightCrotch}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'rightThigh', 'error')} ">
	<label for="rightThigh">
		<g:message code="sesionControl.rightThigh.label" default="Right Thigh" />
		
	</label>
	<g:checkBox name="rightThigh" value="${sesionControlInstance?.rightThigh}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'secAppUser', 'error')} required">
	<label for="secAppUser">
		<g:message code="sesionControl.secAppUser.label" default="Sec App User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secAppUser" name="secAppUser.id" from="${user.SecAppUser.list()}" optionKey="id" required="" value="${sesionControlInstance?.secAppUser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'sesionNumber', 'error')} required">
	<label for="sesionNumber">
		<g:message code="sesionControl.sesionNumber.label" default="Sesion Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sesionNumber" type="number" value="${sesionControlInstance.sesionNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'vacutainer', 'error')} required">
	<label for="vacutainer">
		<g:message code="sesionControl.vacutainer.label" default="Vacutainer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vacutainer" name="vacutainer.id" from="${fastchacaito.Vacutainer.list()}" optionKey="id" required="" value="${sesionControlInstance?.vacutainer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'waist', 'error')} ">
	<label for="waist">
		<g:message code="sesionControl.waist.label" default="Waist" />
		
	</label>
	<g:checkBox name="waist" value="${sesionControlInstance?.waist}" />
</div>


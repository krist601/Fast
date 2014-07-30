<%@ page import="fastchacaito.MassageControl" %>



<div class="fieldcontain ${hasErrors(bean: massageControlInstance, field: 'bodyTherapy', 'error')} required">
	<label for="bodyTherapy">
		<g:message code="massageControl.bodyTherapy.label" default="Body Therapy" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bodyTherapy" name="bodyTherapy.id" from="${fastchacaito.BodyTherapy.list()}" optionKey="id" required="" value="${massageControlInstance?.bodyTherapy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: massageControlInstance, field: 'massageDate', 'error')} required">
	<label for="massageDate">
		<g:message code="massageControl.massageDate.label" default="Massage Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="massageDate" precision="day"  value="${massageControlInstance?.massageDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: massageControlInstance, field: 'massageNumber', 'error')} required">
	<label for="massageNumber">
		<g:message code="massageControl.massageNumber.label" default="Massage Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="massageNumber" type="number" value="${massageControlInstance.massageNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: massageControlInstance, field: 'secAppUser', 'error')} required">
	<label for="secAppUser">
		<g:message code="massageControl.secAppUser.label" default="Sec App User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secAppUser" name="secAppUser.id" from="${user.SecAppUser.list()}" optionKey="id" required="" value="${massageControlInstance?.secAppUser?.id}" class="many-to-one"/>
</div>


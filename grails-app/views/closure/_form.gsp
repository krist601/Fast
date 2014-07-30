<%@ page import="fastchacaito.Closure" %>



<div class="fieldcontain ${hasErrors(bean: closureInstance, field: 'closureDate', 'error')} required">
	<label for="closureDate">
		<g:message code="closure.closureDate.label" default="Closure Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="closureDate" precision="day"  value="${closureInstance?.closureDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: closureInstance, field: 'reportX', 'error')} required">
	<label for="reportX">
		<g:message code="closure.reportX.label" default="Report X" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="reportX" type="number" value="${closureInstance.reportX}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: closureInstance, field: 'reportZ', 'error')} required">
	<label for="reportZ">
		<g:message code="closure.reportZ.label" default="Report Z" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="reportZ" type="number" value="${closureInstance.reportZ}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: closureInstance, field: 'secAppUser', 'error')} required">
	<label for="secAppUser">
		<g:message code="closure.secAppUser.label" default="Sec App User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secAppUser" name="secAppUser.id" from="${user.SecAppUser.list()}" optionKey="id" required="" value="${closureInstance?.secAppUser?.id}" class="many-to-one"/>
</div>


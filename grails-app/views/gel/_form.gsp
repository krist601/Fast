<%@ page import="fastchacaito.Gel" %>



<div class="fieldcontain ${hasErrors(bean: gelInstance, field: 'closure', 'error')} required">
	<label for="closure">
		<g:message code="gel.closure.label" default="Closure" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="closure" name="closure.id" from="${fastchacaito.Closure.list()}" optionKey="id" required="" value="${gelInstance?.closure?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gelInstance, field: 'outType', 'error')} ">
	<label for="outType">
		<g:message code="gel.outType.label" default="Out Type" />
		
	</label>
	<g:textField name="outType" value="${gelInstance?.outType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gelInstance, field: 'receivedDate', 'error')} required">
	<label for="receivedDate">
		<g:message code="gel.receivedDate.label" default="Received Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="receivedDate" precision="day"  value="${gelInstance?.receivedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: gelInstance, field: 'secAppUser', 'error')} required">
	<label for="secAppUser">
		<g:message code="gel.secAppUser.label" default="Sec App User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secAppUser" name="secAppUser.id" from="${user.SecAppUser.list()}" optionKey="id" required="" value="${gelInstance?.secAppUser?.id}" class="many-to-one"/>
</div>


<%@ page import="fastchacaito.Machine" %>



<div class="fieldcontain ${hasErrors(bean: machineInstance, field: 'machineType', 'error')} ">
	<label for="machineType">
		<g:message code="machine.machineType.label" default="Machine Type" />
		
	</label>
	<g:textField name="machineType" value="${machineInstance?.machineType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: machineInstance, field: 'treatment', 'error')} required">
	<label for="treatment">
		<g:message code="machine.treatment.label" default="Treatment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="treatment" name="treatment.id" from="${fastchacaito.Treatment.list()}" optionKey="id" required="" value="${machineInstance?.treatment?.id}" class="many-to-one"/>
</div>


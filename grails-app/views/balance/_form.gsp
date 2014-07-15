<%@ page import="fastchacaito.Balance" %>



<div class="fieldcontain ${hasErrors(bean: balanceInstance, field: 'applicationAmount', 'error')} required">
	<label for="applicationAmount">
		<g:message code="balance.applicationAmount.label" default="Application Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="applicationAmount" type="number" value="${balanceInstance.applicationAmount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: balanceInstance, field: 'idealWeight', 'error')} required">
	<label for="idealWeight">
		<g:message code="balance.idealWeight.label" default="Ideal Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idealWeight" type="number" value="${balanceInstance.idealWeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: balanceInstance, field: 'treatment', 'error')} required">
	<label for="treatment">
		<g:message code="balance.treatment.label" default="Treatment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="treatment" name="treatment.id" from="${fastchacaito.Treatment.list()}" optionKey="id" required="" value="${balanceInstance?.treatment?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: balanceInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="balance.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${balanceInstance?.type}"/>
</div>


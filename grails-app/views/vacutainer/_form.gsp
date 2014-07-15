<%@ page import="fastchacaito.Vacutainer" %>



<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'arrivalDate', 'error')} required">
	<label for="arrivalDate">
		<g:message code="vacutainer.arrivalDate.label" default="Arrival Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="arrivalDate" name="arrivalDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${vacutainerInstance?.arrivalDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'identifier', 'error')} ">
	<label for="identifier">
		<g:message code="vacutainer.identifier.label" default="Identifier" />
		
	</label>
	<g:textField name="identifier" value="${vacutainerInstance?.identifier}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'lostDate', 'error')} required">
	<label for="lostDate">
		<g:message code="vacutainer.lostDate.label" default="Lost Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lostDate" name="lostDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${vacutainerInstance?.lostDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'vacutainerType', 'error')} ">
	<label for="vacutainerType">
		<g:message code="vacutainer.vacutainerType.label" default="Vacutainer Type" />
		
	</label>
	<g:textField name="vacutainerType" value="${vacutainerInstance?.vacutainerType}"/>
</div>


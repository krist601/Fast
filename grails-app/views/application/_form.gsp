<%@ page import="fastchacaito.Application" %>



<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'arrivalDate', 'error')} required">
	<label for="arrivalDate">
		<g:message code="application.arrivalDate.label" default="Arrival Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="arrivalDate" name="arrivalDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${applicationInstance?.arrivalDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'identifier', 'error')} ">
	<label for="identifier">
		<g:message code="application.identifier.label" default="Identifier" />
		
	</label>
	<g:textField name="identifier" value="${applicationInstance?.identifier}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'lostDate', 'error')} required">
	<label for="lostDate">
		<g:message code="application.lostDate.label" default="Lost Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lostDate" name="lostDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${applicationInstance?.lostDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'vacutainer', 'error')} required">
	<label for="vacutainer">
		<g:message code="application.vacutainer.label" default="Vacutainer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vacutainer" name="vacutainer.id" from="${fastchacaito.Vacutainer.list()}" optionKey="id" required="" value="${applicationInstance?.vacutainer?.id}" class="many-to-one"/>
</div>


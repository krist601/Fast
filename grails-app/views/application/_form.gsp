<%@ page import="fastchacaito.Application" %>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'arrivalDate', 'error')} required">
	<label for="arrivalDate">
		<g:message code="application.arrivalDate.label" default="Fecha de Llegada" />
	</label>
        <g:datePicker name="arrivalDate" precision="day"  value="${applicationInstance?.arrivalDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'identifier', 'error')} ">
	<label for="identifier">
		<g:message code="application.identifier.label" default="Identificador" />
		
	</label>
	<g:textField name="identifier" value="${applicationInstance?.identifier}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'lostDate', 'error')} required">
	<label for="lostDate">
		<g:message code="application.lostDate.label" default="Fecha de Perdida" />
	</label>
        <g:datePicker name="lostDate" precision="day"  value="${applicationInstance?.lostDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'vacutainer', 'error')} required">
	<label for="vacutainer">
		<g:message code="application.vacutainer.label" default="Vacutainer" />
	</label>
	<g:select id="vacutainer" name="vacutainer.id" from="${fastchacaito.Vacutainer.list()}" optionKey="id" required="" value="${applicationInstance?.vacutainer?.id}" class="many-to-one"/>
</div>


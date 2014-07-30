<%@ page import="fastchacaito.Vacutainer" %>



<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'arrivalDate', 'error')} required">
	<label for="arrivalDate">
		<g:message code="vacutainer.arrivalDate.label" default="Fecha de Llegada" />
	</label>
        <g:datePicker name="arrivalDate" precision="day"  value="${vacutainerInstance?.arrivalDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'identifier', 'error')} ">
	<label for="identifier">
		<g:message code="vacutainer.identifier.label" default="Identificador" />
	</label>
	<g:textField name="identifier" value="${vacutainerInstance?.identifier}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'lostDate', 'error')} required">
	<label for="lostDate">
		<g:message code="vacutainer.lostDate.label" default="Fecha de Perdida" />
	</label>
        <g:datePicker name="lostDate" precision="day"  value="${vacutainerInstance?.lostDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'vacutainerType', 'error')} ">
	<label for="vacutainerType">
		<g:message code="vacutainer.vacutainerType.label" default="Tipo de Vacutainer" />	
	</label>
	<g:textField name="vacutainerType" value="${vacutainerInstance?.vacutainerType}"/>
</div>


<%@ page import="fastchacaito.SesionControl" %>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="sesionControl.date.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${sesionControlInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'kit', 'error')} ">
	<label for="kit">
		<g:message code="sesionControl.kit.label" default="Kit" />
		
	</label>
	<g:textField name="kit" value="${sesionControlInstance?.kit}"/>
</div>

<g:hiddenField name="mesotherapy.id" value="${sesionControlInstance?.mesotherapy?.id}"/>
<g:hiddenField name="secAppUser.id" value="${sesionControlInstance?.secAppUser?.id}"/>


<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'sesionNumber', 'error')} required">
	<label for="sesionNumber">
		<g:message code="sesionControl.sesionNumber.label" default="Número de Sesión" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sesionNumber" type="number" value="${sesionControlInstance.sesionNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'vacutainer', 'error')} required">
	<label for="vacutainer">
		<g:message code="sesionControl.vacutainer.label" default="Vacutainer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vacutainer" name="vacutainer.id" from="${fastchacaito.Vacutainer.avaliableVacutainers()}" optionKey="id" required="" value="${sesionControlInstance?.vacutainer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'vacutainer2', 'error')} ">
	<label for="vacutainer2">
		<g:message code="sesionControl.vacutainer2.label" default="Vacutainer" />
		
	</label>
	<g:select id="vacutainer2" name="vacutainer2.id" from="${fastchacaito.Vacutainer.avaliableVacutainers()}" optionKey="id" value="${sesionControlInstance?.vacutainer2?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

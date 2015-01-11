<%@ page import="fastchacaito.Application" %>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'arrivalDate', 'error')} ">
    <label>Fecha de Llegada</label>
    <span class="field"><input id="datepicker" type="text" name="arrivalDate" class="input-small" /></span>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'identifier', 'error')} ">
	<label for="identifier">
		<g:message code="application.identifier.label" default="Identificador" />
		
	</label>
	<g:textField name="identifier" value="${applicationInstance?.identifier}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'applicationType', 'error')} ">
	<label for="applicationType">
		<g:message code="application.identifier.label" default="Tipo de Aplicación" />
		
	</label>
	<g:select name="applicationType" from="${['Balance Clásico', 'Balance Plus']}"/>
</div>

<g:hiddenField name="vacutainer.id" value="${applicationInstance?.vacutainer?.id}"/>



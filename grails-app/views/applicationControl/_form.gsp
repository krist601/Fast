<%@ page import="fastchacaito.ApplicationControl" %>



<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'application', 'error')} required">
	<label for="application">
		<g:message code="applicationControl.application.label" default="Aplicación" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="application" name="application.id" from="${fastchacaito.Application.list()}" optionKey="id" required="" value="${applicationControlInstance?.application?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'balance', 'error')} required">
	<label for="balance">
		<g:message code="applicationControl.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="balance" name="balance.id" from="${fastchacaito.Balance.list()}" optionKey="id" required="" value="${applicationControlInstance?.balance?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'currentWeight', 'error')} required">
	<label for="currentWeight">
		<g:message code="applicationControl.currentWeight.label" default="Peso Actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="currentWeight" type="number" value="${applicationControlInstance.currentWeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="applicationControl.date.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	
                <g:datePicker name="date" precision="day"  value="${applicationControlInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'differenceWeight', 'error')} required">
	<label for="differenceWeight">
		<g:message code="applicationControl.differenceWeight.label" default="Peso de Diferencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="differenceWeight" type="number" value="${applicationControlInstance.differenceWeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'identifierNumber', 'error')} required">
	<label for="identifierNumber">
		<g:message code="applicationControl.identifierNumber.label" default="Número de Identificador" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="identifierNumber" type="number" value="${applicationControlInstance.identifierNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'nControl', 'error')} ">
	<label for="nControl">
		<g:message code="applicationControl.nControl.label" default="Control N" />
		
	</label>
	<g:textField name="nControl" value="${applicationControlInstance?.nControl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'observation', 'error')} ">
	<label for="observation">
		<g:message code="applicationControl.observation.label" default="Observación" />
		
	</label>
	<g:textField name="observation" value="${applicationControlInstance?.observation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'reachedWeight', 'error')} required">
	<label for="reachedWeight">
		<g:message code="applicationControl.reachedWeight.label" default="Peso Alcanzado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="reachedWeight" type="number" value="${applicationControlInstance.reachedWeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'wasApplied', 'error')} ">
	<label for="wasApplied">
		<g:message code="applicationControl.wasApplied.label" default="Aplicado?" />
		
	</label>
	<g:checkBox name="wasApplied" value="${applicationControlInstance?.wasApplied}" />
</div>


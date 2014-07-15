<%@ page import="fastchacaito.ApplicationControl" %>



<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'application', 'error')} required">
	<label for="application">
		<g:message code="applicationControl.application.label" default="Application" />
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
		<g:message code="applicationControl.currentWeight.label" default="Current Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="currentWeight" type="number" value="${applicationControlInstance.currentWeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="applicationControl.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="date" name="date.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${applicationControlInstance?.date?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'differenceWeight', 'error')} required">
	<label for="differenceWeight">
		<g:message code="applicationControl.differenceWeight.label" default="Difference Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="differenceWeight" type="number" value="${applicationControlInstance.differenceWeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'identifierNumber', 'error')} required">
	<label for="identifierNumber">
		<g:message code="applicationControl.identifierNumber.label" default="Identifier Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="identifierNumber" type="number" value="${applicationControlInstance.identifierNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'nControl', 'error')} ">
	<label for="nControl">
		<g:message code="applicationControl.nControl.label" default="NC ontrol" />
		
	</label>
	<g:textField name="nControl" value="${applicationControlInstance?.nControl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'observation', 'error')} ">
	<label for="observation">
		<g:message code="applicationControl.observation.label" default="Observation" />
		
	</label>
	<g:textField name="observation" value="${applicationControlInstance?.observation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'reachedWeight', 'error')} required">
	<label for="reachedWeight">
		<g:message code="applicationControl.reachedWeight.label" default="Reached Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="reachedWeight" type="number" value="${applicationControlInstance.reachedWeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'wasApplied', 'error')} ">
	<label for="wasApplied">
		<g:message code="applicationControl.wasApplied.label" default="Was Applied" />
		
	</label>
	<g:checkBox name="wasApplied" value="${applicationControlInstance?.wasApplied}" />
</div>


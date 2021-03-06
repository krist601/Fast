<%@ page import="fastchacaito.Mesotherapy" %>



<div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'method', 'error')} ">
	<label for="method">
		<g:message code="mesotherapy.method.label" default="Method" />
		
	</label>
	<g:textField name="method" value="${mesotherapyInstance?.method}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'ploblemCauses', 'error')} ">
	<label for="ploblemCauses">
		<g:message code="mesotherapy.ploblemCauses.label" default="Ploblem Causes" />
		
	</label>
	<g:textField name="ploblemCauses" value="${mesotherapyInstance?.ploblemCauses}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'previousAttempts', 'error')} ">
	<label for="previousAttempts">
		<g:message code="mesotherapy.previousAttempts.label" default="Previous Attempts" />
		
	</label>
	<g:textField name="previousAttempts" value="${mesotherapyInstance?.previousAttempts}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'sesionControl', 'error')} ">
	<label for="sesionControl">
		<g:message code="mesotherapy.sesionControl.label" default="Sesion Control" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${mesotherapyInstance?.sesionControl?}" var="s">
    <li><g:link controller="sesionControl" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sesionControl" action="create" params="['mesotherapy.id': mesotherapyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sesionControl.label', default: 'SesionControl')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'treatAreas', 'error')} ">
	<label for="treatAreas">
		<g:message code="mesotherapy.treatAreas.label" default="Treat Areas" />
		
	</label>
	<g:textField name="treatAreas" value="${mesotherapyInstance?.treatAreas}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'treatment', 'error')} required">
	<label for="treatment">
		<g:message code="mesotherapy.treatment.label" default="Treatment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="treatment" name="treatment.id" from="${fastchacaito.Treatment.list()}" optionKey="id" required="" value="${mesotherapyInstance?.treatment?.id}" class="many-to-one"/>
</div>


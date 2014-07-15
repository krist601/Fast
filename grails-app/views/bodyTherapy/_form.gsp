<%@ page import="fastchacaito.BodyTherapy" %>



<div class="fieldcontain ${hasErrors(bean: bodyTherapyInstance, field: 'massageType', 'error')} ">
	<label for="massageType">
		<g:message code="bodyTherapy.massageType.label" default="Massage Type" />
		
	</label>
	<g:textField name="massageType" value="${bodyTherapyInstance?.massageType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bodyTherapyInstance, field: 'treatment', 'error')} required">
	<label for="treatment">
		<g:message code="bodyTherapy.treatment.label" default="Treatment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="treatment" name="treatment.id" from="${fastchacaito.Treatment.list()}" optionKey="id" required="" value="${bodyTherapyInstance?.treatment?.id}" class="many-to-one"/>
</div>


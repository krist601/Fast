<%@ page import="fastchacaito.Treatment" %>



<div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'beginDate', 'error')} required">
	<label for="beginDate">
		<g:message code="treatment.beginDate.label" default="Begin Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="beginDate" precision="day"  value="${treatmentInstance?.beginDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="treatment.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${treatmentInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="treatment.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${treatmentInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'packages', 'error')} required">
	<label for="packages">
		<g:message code="treatment.packages.label" default="Packages" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="packages" name="packages.id" from="${fastchacaito.Package.list()}" optionKey="id" required="" value="${treatmentInstance?.packages?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'paymentMethod', 'error')} required">
	<label for="paymentMethod">
		<g:message code="treatment.paymentMethod.label" default="Payment Method" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="paymentMethod" name="paymentMethod.id" from="${fastchacaito.PaymentMethod.list()}" optionKey="id" required="" value="${treatmentInstance?.paymentMethod?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'totalPrice', 'error')} required">
	<label for="totalPrice">
		<g:message code="treatment.totalPrice.label" default="Total Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalPrice" type="number" value="${treatmentInstance.totalPrice}" required=""/>
</div>


<%@ page import="fastchacaito.PaymentMethod" %>



<div class="fieldcontain ${hasErrors(bean: paymentMethodInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="paymentMethod.amount.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${paymentMethodInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentMethodInstance, field: 'bank', 'error')} ">
	<label for="bank">
		<g:message code="paymentMethod.bank.label" default="Banco" />
		
	</label>
	<g:textField name="bank" value="${paymentMethodInstance?.bank}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentMethodInstance, field: 'paymentMethodType', 'error')} ">
	<label for="paymentMethodType">
		<g:message code="paymentMethod.paymentMethodType.label" default="Método de Pago" />
		
	</label>
	<g:textField name="paymentMethodType" value="${paymentMethodInstance?.paymentMethodType}"/>
</div>
<g:hiddenField name="treatment.id" value="${paymentMethodInstance?.treatment?.id}"/>



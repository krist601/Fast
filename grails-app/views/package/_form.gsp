<%@ page import="fastchacaito.Package" %>



<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'packageType', 'error')} required">
	<label for="packageType">
		<g:message code="package.packageType.label" default="Package Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="packageType" type="number" value="${packageInstance.packageType}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="package.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${packageInstance.price}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'sesionAmount', 'error')} required">
	<label for="sesionAmount">
		<g:message code="package.sesionAmount.label" default="Sesion Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sesionAmount" type="number" value="${packageInstance.sesionAmount}" required=""/>
</div>


<%@ page import="fastchacaito.Package" %>



<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'packageType', 'error')} required">
	<label for="packageType">
		<g:message code="package.packageType.label" default="Tipo de Paquete" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="packageType" from="${['Balance Clásico', 'Balance Plus','Mesoterapia']}" value="${packageInstance.packageType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="package.price.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${packageInstance.price}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'sesionAmount', 'error')} required">
	<label for="sesionAmount">
		<g:message code="package.sesionAmount.label" default="Cantidad de Aplicaciones" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sesionAmount" type="number" value="${packageInstance.sesionAmount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="package.description.label" default="Descripción" />
		
	</label>
	<g:field name="description" type="text" value="${packageInstance.description}" />
</div>
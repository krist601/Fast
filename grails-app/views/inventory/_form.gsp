<%@ page import="fastchacaito.Inventory" %>



<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'closure', 'error')} required">
	<label for="closure">
		<g:message code="inventory.closure.label" default="Closure" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="closure" name="closure.id" from="${fastchacaito.Closure.list()}" optionKey="id" required="" value="${inventoryInstance?.closure?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'inventoryType', 'error')} ">
	<label for="inventoryType">
		<g:message code="inventory.inventoryType.label" default="Inventory Type" />
		
	</label>
	<g:textField name="inventoryType" value="${inventoryInstance?.inventoryType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'receivedDate', 'error')} required">
	<label for="receivedDate">
		<g:message code="inventory.receivedDate.label" default="Received Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receivedDate" name="receivedDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${inventoryInstance?.receivedDate?.id}" class="many-to-one"/>
</div>



<%@ page import="fastchacaito.PaymentMethod" %>

   <div class="fieldcontain ${hasErrors(bean: paymentMethodInstance, field: 'date', 'error')} ">
                                            <label>Fecha del pago</label>
                                            <span class="field">
                                                <input id="datepicker" type="text" name="date" class="input-small" required/>
                                            </span>
                                        </div>

<div class="fieldcontain ${hasErrors(bean: paymentMethodInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="paymentMethod.amount.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<input name="amount" type="number"  required/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentMethodInstance, field: 'paymentMethodType', 'error')} ">
	<label for="paymentMethodType">
		<g:message code="paymentMethod.paymentMethodType.label" default="Método de Pago" />
		
	</label>
    <select class="default form-control" name="paymentMethodType" id="paymentMethodType" value="">
        <option value="Efectivo">Efectivo</option>
        <option value="Tajeta de Débito">Tajeta de Débito</option>
        <option value="Tajeta de Crédito">Tajeta de Crédito</option>
        <option value="Cheque">Cheque</option>
    </select>
</div>
<div id="showMe">
   <div class="fieldcontain ${hasErrors(bean: paymentMethodInstance, field: 'bank', 'error')} ">
	<label for="bank">
		<g:message code="paymentMethod.bank.label" default="Banco" />
		
	</label>
	<g:textField name="bank" value="${paymentMethodInstance?.bank}"/>
</div>
</div>

<g:hiddenField name="treatment.id" value="${paymentMethodInstance?.treatment?.id}"/>

<script>
    var elem = document.getElementById("paymentMethodType");
    elem.onchange = function(){
    var hiddenDiv = document.getElementById("showMe");
    if (this.value!="Efectivo") {
    hiddenDiv.style.display = (this.value == "") ? "none":"block";
    }
    if (this.value=="Efectivo") {
    hiddenDiv.style.display = "none";
    }
    };
</script>
<style>
    #showMe{
    display:none;
    }
</style>




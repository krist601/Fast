<%@ page import="fastchacaito.Vacutainer" %>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'bornDate', 'error')} ">
    <label>Fecha de Llegada</label>
    <span class="field"><input id="datepicker" type="text" name="arrivalDate" class="input-small" /></span>
</div>

<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'identifier', 'error')} ">
    <label for="identifier">
        <g:message code="vacutainer.identifier.label" default="Identificador" />

    </label>
    <g:textField name="identifier" value="${vacutainerInstance?.identifier}"/>
</div>



<div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'vacutainerType', 'error')} ">
    <label for="vacutainerType">
        <g:message code="vacutainer.vacutainerType.label" default="Tipo de Vacutainer" />
    </label>
    <select class="default form-control" name="vacutainerType" id="vacutainerType" value="">
        <option value="Mesoterapia">Mesoterapia</option>
        <option value="Balance Clásico">Balance Clásico</option>
        <option value="Balance Plus">Balance Plus</option>
    </select>
</div>
<div id="showMe">
    <div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'vacutainerType', 'error')} ">
        <label for="vacutainerType">
            <g:message code="vacutainer.vacutainerType.label" default="Cantidad de Aplicaciones" />

        </label>
        <g:textField name="vacutainerAmount" value=""/>
    </div>
    <br>
</div>


<script>
    var elem = document.getElementById("vacutainerType");
    elem.onchange = function(){
    var hiddenDiv = document.getElementById("showMe");
    if (this.value!="Mesoterapia") {
    hiddenDiv.style.display = (this.value == "") ? "none":"block";
    }
    if (this.value=="Mesoterapia") {
    hiddenDiv.style.display = "none";
    }
    };
</script>
<style>
    #showMe{
    display:none;
    }
</style>
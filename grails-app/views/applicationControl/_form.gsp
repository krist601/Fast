<%@ page import="fastchacaito.ApplicationControl" %>
<%@ page import="fastchacaito.Balance" %>

<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'currentWeight', 'error')} required">
    <label for="currentWeight">
        <g:message code="applicationControl.currentWeight.label" default="Peso Actual" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="currentWeight" value="${fieldValue(bean: applicationControlInstance, field: 'currentWeight')}" required=""/>
</div><br>

<g:if test="${ApplicationControl.getLastWeight(params.foo)}">

    <div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'wasApplied', 'error')} ">
        <label for="wasApplied">
            <g:message code="applicationControl.wasApplied.label" default="Fue Aplicada?" />

        </label>
        <g:checkBox name="wasApplied" value="${applicationControlInstance?.wasApplied}" /> <a style="color: red;">No debe aplicarse si el paciente tiene <g:if test="${Balance.get(params.foo).type.equals("Balance Plus")}">${ApplicationControl.getLastWeight(params.foo)-0.5}</g:if><g:else>${ApplicationControl.getLastWeight(params.foo)-0.3}</g:else> Kg o más</a>
        </div><br>
    <div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'application', 'error')} required">
        <label for="application">
            <g:message code="applicationControl.application.label" default="Applicación" />
            <span class="required-indicator">*</span>
        </label>
        <g:select id="application" name="application.id" noSelection="${['null':'Selecione una Aplicación']}" from="${fastchacaito.Application.list()}" optionKey="id" required="" value="${applicationControlInstance?.application?.id}" class="many-to-one"/>
    </div>

</g:if>
<div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'observation', 'error')} ">
    <label for="observation">
        <g:message code="applicationControl.observation.label" default="Observación" />

    </label>
    <g:textArea style="width: 60%;" name="observation" value="${applicationControlInstance?.observation}"/>
</div>


<g:hiddenField name="balance.id" value="${applicationControlInstance?.balance?.id}"/>

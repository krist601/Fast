<%@ page import="fastchacaito.SesionControl" %>

<table>
    
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'leftArm', 'error')} required">
                <label for="leftArm">
                    <g:message code="sesionControl.leftArm.label" default="Brazo Izquierdo" />
                    
                </label>
                <g:field name="leftArm" value="${fieldValue(bean: sesionControlInstance, field: 'leftArm')}" required=""/>
            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'rightArm', 'error')} required">
                <label for="rightArm">
                    <g:message code="sesionControl.rightArm.label" default="Brazo Derecho" />
                    
                </label>
                <g:field name="rightArm" value="${fieldValue(bean: sesionControlInstance, field: 'rightArm')}" required=""/>
            </div>
        </td>
    </tr>
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'leftThigh', 'error')} required">
                <label for="leftThigh">
                    <g:message code="sesionControl.leftThigh.label" default="Muslo Izquierdo" />
                    
                </label>
                <g:field name="leftThigh" value="${fieldValue(bean: sesionControlInstance, field: 'leftThigh')}" required=""/>
            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'rightThigh', 'error')} required">
                <label for="rightThigh">
                    <g:message code="sesionControl.rightThigh.label" default="Muslo Derecho" />
                    
                </label>
                <g:field name="rightThigh" value="${fieldValue(bean: sesionControlInstance, field: 'rightThigh')}" required=""/>
            </div>
        </td>
    </tr>
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'leftCrotch', 'error')} required">
                <label for="leftCrotch">
                    <g:message code="sesionControl.leftCrotch.label" default="Entrepierna Izquierda" />
                    
                </label>
                <g:field name="leftCrotch" value="${fieldValue(bean: sesionControlInstance, field: 'leftCrotch')}" required=""/>
            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'rightCrotch', 'error')} required">
                <label for="rightCrotch">
                    <g:message code="sesionControl.rightCrotch.label" default="Entrepierna Derecha" />
                    
                </label>
                <g:field name="rightCrotch" value="${fieldValue(bean: sesionControlInstance, field: 'rightCrotch')}" required=""/>
            </div>
        </td>
    </tr>
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'hips', 'error')} required">
                <label for="hips">
                    <g:message code="sesionControl.hips.label" default="Caderas" />
                    
                </label>
                <g:field name="hips" value="${fieldValue(bean: sesionControlInstance, field: 'hips')}" required=""/>
            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'waist', 'error')} required">
                <label for="waist">
                    <g:message code="sesionControl.waist.label" default="Cintura" />
                    
                </label>
                <g:field name="waist" value="${fieldValue(bean: sesionControlInstance, field: 'waist')}" required=""/>
            </div>
        </td>
    </tr>
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'abdomen', 'error')} required">
                <label for="abdomen">
                    <g:message code="sesionControl.abdomen.label" default="Abdomen" />
                    
                </label>
                <g:field name="abdomen" value="${fieldValue(bean: sesionControlInstance, field: 'abdomen')}" required=""/>

            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
        </td>
    </tr>
    
</table>
 <g:hiddenField name="mesotherapy.id" value="${sesionControlInstance?.mesotherapy?.id}"/>

<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'vacutainer', 'error')} required">
    <label for="vacutainer">
        <g:message code="sesionControl.vacutainer.label" default="Vacutainer" />
        
    </label>
    <g:select id="vacutainer" name="vacutainer.id" from="${fastchacaito.Vacutainer.findBySesionControl(null)}" optionKey="id" required="" value="${sesionControlInstance?.vacutainer?.id}" class="many-to-one"/>
</div>
<div class="fieldcontain ${hasErrors(bean: sesionControlInstance, field: 'vacutainer', 'error')} required">
    <label for="vacutainer">
        <g:message code="sesionControl.vacutainer.label" default="Vacutainer" />
        
    </label>
    <g:select id="vacutainer2" name="vacutainer2.id" noSelection="${['null':'Selecione un Vacutainer']}" from="${fastchacaito.Vacutainer.list()}" optionKey="id" required="" value="${sesionControlInstance?.vacutainer?.id}" class="many-to-one"/>
</div>


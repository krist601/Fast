<%@ page import="fastchacaito.MeasuresControl" %>

<table>
    
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftArm', 'error')} required">
                <label for="leftArm">
                    <g:message code="measuresControl.leftArm.label" default="Brazo Izquierdo" />
                    
                </label>
                <g:field name="leftArm" value="${fieldValue(bean: measuresControlInstance, field: 'leftArm')}" required=""/>
            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightArm', 'error')} required">
                <label for="rightArm">
                    <g:message code="measuresControl.rightArm.label" default="Brazo Derecho" />
                    
                </label>
                <g:field name="rightArm" value="${fieldValue(bean: measuresControlInstance, field: 'rightArm')}" required=""/>
            </div>
        </td>
    </tr>
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftThigh', 'error')} required">
                <label for="leftThigh">
                    <g:message code="measuresControl.leftThigh.label" default="Muslo Izquierdo" />
                    
                </label>
                <g:field name="leftThigh" value="${fieldValue(bean: measuresControlInstance, field: 'leftThigh')}" required=""/>
            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightThigh', 'error')} required">
                <label for="rightThigh">
                    <g:message code="measuresControl.rightThigh.label" default="Muslo Derecho" />
                    
                </label>
                <g:field name="rightThigh" value="${fieldValue(bean: measuresControlInstance, field: 'rightThigh')}" required=""/>
            </div>
        </td>
    </tr>
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftCrotch', 'error')} required">
                <label for="leftCrotch">
                    <g:message code="measuresControl.leftCrotch.label" default="Entrepierna Izquierda" />
                    
                </label>
                <g:field name="leftCrotch" value="${fieldValue(bean: measuresControlInstance, field: 'leftCrotch')}" required=""/>
            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightCrotch', 'error')} required">
                <label for="rightCrotch">
                    <g:message code="measuresControl.rightCrotch.label" default="Entrepierna Derecha" />
                    
                </label>
                <g:field name="rightCrotch" value="${fieldValue(bean: measuresControlInstance, field: 'rightCrotch')}" required=""/>
            </div>
        </td>
    </tr>
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'hips', 'error')} required">
                <label for="hips">
                    <g:message code="measuresControl.hips.label" default="Caderas" />
                    
                </label>
                <g:field name="hips" value="${fieldValue(bean: measuresControlInstance, field: 'hips')}" required=""/>
            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'waist', 'error')} required">
                <label for="waist">
                    <g:message code="measuresControl.waist.label" default="Cintura" />
                    
                </label>
                <g:field name="waist" value="${fieldValue(bean: measuresControlInstance, field: 'waist')}" required=""/>
            </div>
        </td>
    </tr>
    <tr>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
            <div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'abdomen', 'error')} required">
                <label for="abdomen">
                    <g:message code="measuresControl.abdomen.label" default="Abdomen" />
                    
                </label>
                <g:field name="abdomen" value="${fieldValue(bean: measuresControlInstance, field: 'abdomen')}" required=""/>

            </div>
        </td>
        <td style="margin-bottom: 10px; padding-bottom: 10px;">
        </td>
    </tr>
    
</table>

<g:hiddenField name="balance.id" value="${measuresControlInstance?.balance?.id}"/>
<g:hiddenField name="mesotherapy.id" value="${measuresControlInstance?.mesotherapy?.id}"/>
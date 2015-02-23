<%@ page import="fastchacaito.MeasuresControl" %>



<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'machine', 'error')} ">
	<label for="machine">
		<g:message code="measuresControl.machine.label" default="Machine" />
		
	</label>
	<g:select id="machine" name="machine.id" from="${fastchacaito.Machine.list()}" optionKey="id" value="${measuresControlInstance?.machine?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'abdomen', 'error')} required">
	<label for="abdomen">
		<g:message code="measuresControl.abdomen.label" default="Abdomen" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="abdomen" value="${fieldValue(bean: measuresControlInstance, field: 'abdomen')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'achieved', 'error')} required">
	<label for="achieved">
		<g:message code="measuresControl.achieved.label" default="Achieved" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="achieved" value="${fieldValue(bean: measuresControlInstance, field: 'achieved')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="measuresControl.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${measuresControlInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'hips', 'error')} required">
	<label for="hips">
		<g:message code="measuresControl.hips.label" default="Hips" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hips" value="${fieldValue(bean: measuresControlInstance, field: 'hips')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'identifierNumber', 'error')} required">
	<label for="identifierNumber">
		<g:message code="measuresControl.identifierNumber.label" default="Identifier Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="identifierNumber" type="number" value="${measuresControlInstance.identifierNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftArm', 'error')} required">
	<label for="leftArm">
		<g:message code="measuresControl.leftArm.label" default="Left Arm" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="leftArm" value="${fieldValue(bean: measuresControlInstance, field: 'leftArm')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftCrotch', 'error')} required">
	<label for="leftCrotch">
		<g:message code="measuresControl.leftCrotch.label" default="Left Crotch" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="leftCrotch" value="${fieldValue(bean: measuresControlInstance, field: 'leftCrotch')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftThigh', 'error')} required">
	<label for="leftThigh">
		<g:message code="measuresControl.leftThigh.label" default="Left Thigh" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="leftThigh" value="${fieldValue(bean: measuresControlInstance, field: 'leftThigh')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightArm', 'error')} required">
	<label for="rightArm">
		<g:message code="measuresControl.rightArm.label" default="Right Arm" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rightArm" value="${fieldValue(bean: measuresControlInstance, field: 'rightArm')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightCrotch', 'error')} required">
	<label for="rightCrotch">
		<g:message code="measuresControl.rightCrotch.label" default="Right Crotch" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rightCrotch" value="${fieldValue(bean: measuresControlInstance, field: 'rightCrotch')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightThigh', 'error')} required">
	<label for="rightThigh">
		<g:message code="measuresControl.rightThigh.label" default="Right Thigh" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rightThigh" value="${fieldValue(bean: measuresControlInstance, field: 'rightThigh')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'secAppUser', 'error')} required">
	<label for="secAppUser">
		<g:message code="measuresControl.secAppUser.label" default="Sec App User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secAppUser" name="secAppUser.id" from="${user.SecAppUser.list()}" optionKey="id" required="" value="${measuresControlInstance?.secAppUser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'waist', 'error')} required">
	<label for="waist">
		<g:message code="measuresControl.waist.label" default="Waist" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="waist" value="${fieldValue(bean: measuresControlInstance, field: 'waist')}" required=""/>
</div>






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
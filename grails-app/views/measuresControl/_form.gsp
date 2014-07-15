<%@ page import="fastchacaito.MeasuresControl" %>



<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'bellyAfter', 'error')} required">
	<label for="bellyAfter">
		<g:message code="measuresControl.bellyAfter.label" default="Belly After" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bellyAfter" type="number" value="${measuresControlInstance.bellyAfter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'bellyBefore', 'error')} required">
	<label for="bellyBefore">
		<g:message code="measuresControl.bellyBefore.label" default="Belly Before" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bellyBefore" type="number" value="${measuresControlInstance.bellyBefore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'hipAfter', 'error')} required">
	<label for="hipAfter">
		<g:message code="measuresControl.hipAfter.label" default="Hip After" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hipAfter" type="number" value="${measuresControlInstance.hipAfter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'hipBefore', 'error')} required">
	<label for="hipBefore">
		<g:message code="measuresControl.hipBefore.label" default="Hip Before" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hipBefore" type="number" value="${measuresControlInstance.hipBefore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftCrotchAfter', 'error')} required">
	<label for="leftCrotchAfter">
		<g:message code="measuresControl.leftCrotchAfter.label" default="Left Crotch After" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="leftCrotchAfter" type="number" value="${measuresControlInstance.leftCrotchAfter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftCrotchBefore', 'error')} required">
	<label for="leftCrotchBefore">
		<g:message code="measuresControl.leftCrotchBefore.label" default="Left Crotch Before" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="leftCrotchBefore" type="number" value="${measuresControlInstance.leftCrotchBefore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftThighAfter', 'error')} required">
	<label for="leftThighAfter">
		<g:message code="measuresControl.leftThighAfter.label" default="Left Thigh After" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="leftThighAfter" type="number" value="${measuresControlInstance.leftThighAfter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'leftThighBefore', 'error')} required">
	<label for="leftThighBefore">
		<g:message code="measuresControl.leftThighBefore.label" default="Left Thigh Before" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="leftThighBefore" type="number" value="${measuresControlInstance.leftThighBefore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'machine', 'error')} required">
	<label for="machine">
		<g:message code="measuresControl.machine.label" default="Machine" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="machine" name="machine.id" from="${fastchacaito.Machine.list()}" optionKey="id" required="" value="${measuresControlInstance?.machine?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'measureDate', 'error')} required">
	<label for="measureDate">
		<g:message code="measuresControl.measureDate.label" default="Measure Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="measureDate" name="measureDate.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${measuresControlInstance?.measureDate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightCrotchAfter', 'error')} required">
	<label for="rightCrotchAfter">
		<g:message code="measuresControl.rightCrotchAfter.label" default="Right Crotch After" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rightCrotchAfter" type="number" value="${measuresControlInstance.rightCrotchAfter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightCrotchBefore', 'error')} required">
	<label for="rightCrotchBefore">
		<g:message code="measuresControl.rightCrotchBefore.label" default="Right Crotch Before" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rightCrotchBefore" type="number" value="${measuresControlInstance.rightCrotchBefore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightThighAfter', 'error')} required">
	<label for="rightThighAfter">
		<g:message code="measuresControl.rightThighAfter.label" default="Right Thigh After" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rightThighAfter" type="number" value="${measuresControlInstance.rightThighAfter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'rightThighBefore', 'error')} required">
	<label for="rightThighBefore">
		<g:message code="measuresControl.rightThighBefore.label" default="Right Thigh Before" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rightThighBefore" type="number" value="${measuresControlInstance.rightThighBefore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'waistAfter', 'error')} required">
	<label for="waistAfter">
		<g:message code="measuresControl.waistAfter.label" default="Waist After" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="waistAfter" type="number" value="${measuresControlInstance.waistAfter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'waistBefore', 'error')} required">
	<label for="waistBefore">
		<g:message code="measuresControl.waistBefore.label" default="Waist Before" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="waistBefore" type="number" value="${measuresControlInstance.waistBefore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'weightAfter', 'error')} required">
	<label for="weightAfter">
		<g:message code="measuresControl.weightAfter.label" default="Weight After" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weightAfter" type="number" value="${measuresControlInstance.weightAfter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: measuresControlInstance, field: 'weightBefore', 'error')} required">
	<label for="weightBefore">
		<g:message code="measuresControl.weightBefore.label" default="Weight Before" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weightBefore" type="number" value="${measuresControlInstance.weightBefore}" required=""/>
</div>


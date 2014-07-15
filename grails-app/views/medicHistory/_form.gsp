<%@ page import="fastchacaito.MedicHistory" %>



<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="medicHistory.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="date" name="date.id" from="${fastchacaito.Date.list()}" optionKey="id" required="" value="${medicHistoryInstance?.date?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'familyHistory', 'error')} ">
	<label for="familyHistory">
		<g:message code="medicHistory.familyHistory.label" default="Family History" />
		
	</label>
	<g:textField name="familyHistory" value="${medicHistoryInstance?.familyHistory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestCardiovascular', 'error')} ">
	<label for="funtionalTestCardiovascular">
		<g:message code="medicHistory.funtionalTestCardiovascular.label" default="Funtional Test Cardiovascular" />
		
	</label>
	<g:textField name="funtionalTestCardiovascular" value="${medicHistoryInstance?.funtionalTestCardiovascular}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestDigestive', 'error')} ">
	<label for="funtionalTestDigestive">
		<g:message code="medicHistory.funtionalTestDigestive.label" default="Funtional Test Digestive" />
		
	</label>
	<g:textField name="funtionalTestDigestive" value="${medicHistoryInstance?.funtionalTestDigestive}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestGynecological', 'error')} ">
	<label for="funtionalTestGynecological">
		<g:message code="medicHistory.funtionalTestGynecological.label" default="Funtional Test Gynecological" />
		
	</label>
	<g:textField name="funtionalTestGynecological" value="${medicHistoryInstance?.funtionalTestGynecological}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestMetabolicEndocrine', 'error')} ">
	<label for="funtionalTestMetabolicEndocrine">
		<g:message code="medicHistory.funtionalTestMetabolicEndocrine.label" default="Funtional Test Metabolic Endocrine" />
		
	</label>
	<g:textField name="funtionalTestMetabolicEndocrine" value="${medicHistoryInstance?.funtionalTestMetabolicEndocrine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestNeurologicalPsychic', 'error')} ">
	<label for="funtionalTestNeurologicalPsychic">
		<g:message code="medicHistory.funtionalTestNeurologicalPsychic.label" default="Funtional Test Neurological Psychic" />
		
	</label>
	<g:textField name="funtionalTestNeurologicalPsychic" value="${medicHistoryInstance?.funtionalTestNeurologicalPsychic}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestRespiratory', 'error')} ">
	<label for="funtionalTestRespiratory">
		<g:message code="medicHistory.funtionalTestRespiratory.label" default="Funtional Test Respiratory" />
		
	</label>
	<g:textField name="funtionalTestRespiratory" value="${medicHistoryInstance?.funtionalTestRespiratory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestUnitary', 'error')} ">
	<label for="funtionalTestUnitary">
		<g:message code="medicHistory.funtionalTestUnitary.label" default="Funtional Test Unitary" />
		
	</label>
	<g:textField name="funtionalTestUnitary" value="${medicHistoryInstance?.funtionalTestUnitary}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'habits', 'error')} ">
	<label for="habits">
		<g:message code="medicHistory.habits.label" default="Habits" />
		
	</label>
	<g:textField name="habits" value="${medicHistoryInstance?.habits}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'medicine', 'error')} ">
	<label for="medicine">
		<g:message code="medicHistory.medicine.label" default="Medicine" />
		
	</label>
	<g:textField name="medicine" value="${medicHistoryInstance?.medicine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'obstetricalGynecologicalHistory', 'error')} ">
	<label for="obstetricalGynecologicalHistory">
		<g:message code="medicHistory.obstetricalGynecologicalHistory.label" default="Obstetrical Gynecological History" />
		
	</label>
	<g:textField name="obstetricalGynecologicalHistory" value="${medicHistoryInstance?.obstetricalGynecologicalHistory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="medicHistory.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${fastchacaito.Patient.list()}" optionKey="id" required="" value="${medicHistoryInstance?.patient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'presentDisease', 'error')} ">
	<label for="presentDisease">
		<g:message code="medicHistory.presentDisease.label" default="Present Disease" />
		
	</label>
	<g:textField name="presentDisease" value="${medicHistoryInstance?.presentDisease}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'surgicalPathologicalHistory', 'error')} ">
	<label for="surgicalPathologicalHistory">
		<g:message code="medicHistory.surgicalPathologicalHistory.label" default="Surgical Pathological History" />
		
	</label>
	<g:textField name="surgicalPathologicalHistory" value="${medicHistoryInstance?.surgicalPathologicalHistory}"/>
</div>


<%@ page import="fastchacaito.MedicHistory" %>

<h2 style="text-align: center;color:#3462c7;">Datos Generales</h2><br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'presentDisease', 'error')} ">
	<label for="presentDisease">
		<g:message code="medicHistory.presentDisease.label" default="Enfermedad Actual" />
		
	</label>
	<g:textArea style="width: 60%;"  name="presentDisease" value="${medicHistoryInstance?.presentDisease}"/>
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'medicine', 'error')} ">
	<label for="medicine">
		<g:message code="medicHistory.medicine.label" default="Medicina en Uso" />
		
	</label>
	<g:textArea style="width: 60%;"  name="medicine" value="${medicHistoryInstance?.medicine}"/>
</div>
<br>

<h2 style="text-align: center;color:#3462c7;">Antecedentes</h2><br>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'familyHistory', 'error')} ">
	<label for="familyHistory">
		<g:message code="medicHistory.familyHistory.label" default="Familiares" />
		
	</label>
	<g:textArea style="width: 60%;" name="familyHistory" value="${medicHistoryInstance?.familyHistory}"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'surgicalPathologicalHistory', 'error')} ">
	<label for="surgicalPathologicalHistory">
		<g:message code="medicHistory.surgicalPathologicalHistory.label" default="Quirurgicos-Patológicos" />
		
	</label>
	<g:textArea style="width: 60%;"  name="surgicalPathologicalHistory" value="${medicHistoryInstance?.surgicalPathologicalHistory}"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'obstetricalGynecologicalHistory', 'error')} ">
	<label for="obstetricalGynecologicalHistory">
		<g:message code="medicHistory.obstetricalGynecologicalHistory.label" default="Obstetricos-Ginecológicos" />
		
	</label>
	<g:textArea style="width: 60%;"  name="obstetricalGynecologicalHistory" value="${medicHistoryInstance?.obstetricalGynecologicalHistory}"/>
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'habits', 'error')} ">
	<label for="habits">
		<g:message code="medicHistory.habits.label" default="Hábitos" />
		
	</label>
	<g:textArea style="width: 60%;"  name="habits" value="${medicHistoryInstance?.habits}"/>
</div>
<br>




<h2 style="text-align: center;color:#3462c7;">Examen Funcional</h2><br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestCardiovascular', 'error')} ">
	<label for="funtionalTestCardiovascular">
		<g:message code="medicHistory.funtionalTestCardiovascular.label" default="Cardiovascular" />
		
	</label>
	<g:textArea style="width: 60%;" name="funtionalTestCardiovascular" value="${medicHistoryInstance?.funtionalTestCardiovascular}" placeholder="Palpitaciones, Dolor Precordial, Ortopnea, Cansancio, Edema, H.T.A, Varices"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestRespiratory', 'error')} ">
	<label for="funtionalTestRespiratory">
		<g:message code="medicHistory.funtionalTestRespiratory.label" default="Respiratorio" />
		
	</label>
	<g:textArea style="width: 60%;"  name="funtionalTestRespiratory" value="${medicHistoryInstance?.funtionalTestRespiratory}" placeholder="Atopías, O.R.L., Cianosís, Disnea, Dolor Pleuritico, T.B.C., Asma, Neumonía"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestDigestive', 'error')} ">
	<label for="funtionalTestDigestive">
		<g:message code="medicHistory.funtionalTestDigestive.label" default="Digestivo" />
		
	</label>
	<g:textArea style="width: 60%;" name="funtionalTestDigestive" value="${medicHistoryInstance?.funtionalTestDigestive}" placeholder="Ritmo de Evacuación, Ictericia, Transtorno Hepático, Ulcus Péctico-Duodenal, Reflujo, Pat. Anal"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestUnitary', 'error')} ">
	<label for="funtionalTestUnitary">
		<g:message code="medicHistory.funtionalTestUnitary.label" default="Urinario" />
		
	</label>
	<g:textArea style="width: 60%;"  name="funtionalTestUnitary" value="${medicHistoryInstance?.funtionalTestUnitary}" placeholder="I.T.U., Disuría, Proporción, Ingesta, Micción, Litiasis, Malformacion Congénita, Edema Injustificado"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestNeurologicalPsychic', 'error')} ">
	<label for="funtionalTestNeurologicalPsychic">
		<g:message code="medicHistory.funtionalTestNeurologicalPsychic.label" default="Neurológico" />
		
	</label>
	<g:textArea style="width: 60%;"  name="funtionalTestNeurologicalPsychic" value="${medicHistoryInstance?.funtionalTestNeurologicalPsychic}" placeholder="Convulsiones, Sensorio, Cefalea, Ansiedad, Rasgos Psicóticos, Depresion"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestMetabolicEndocrine', 'error')} ">
	<label for="funtionalTestMetabolicEndocrine">
		<g:message code="medicHistory.funtionalTestMetabolicEndocrine.label" default="Metabolic-Endocrino"/>
		
	</label>
	<g:textArea style="width: 60%;"  name="funtionalTestMetabolicEndocrine" value="${medicHistoryInstance?.funtionalTestMetabolicEndocrine}" placeholder="Bocio, Caída del Cabello, Intoleracia al Frio, Astenia, Hiperlipemia, Galactorrea"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: medicHistoryInstance, field: 'funtionalTestGynecological', 'error')} ">
	<label for="funtionalTestGynecological">
		<g:message code="medicHistory.funtionalTestGynecological.label" default="Ginecológico" />
		
	</label>
	<g:textArea style="width: 60%;"  name="funtionalTestGynecological" value="${medicHistoryInstance?.funtionalTestGynecological}" placeholder="Menárquia, Ritmo Mestrual, Hirsutismo, Uso de A.C.O., Menopausia, Leucorrea"/>
</div>
<br>

<g:hiddenField name="patient.id" value="${medicHistoryInstance?.patient?.id}"/>
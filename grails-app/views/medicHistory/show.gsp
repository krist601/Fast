
<%@ page import="fastchacaito.MedicHistory" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'medicHistory.label', default: 'MedicHistory')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/MedicHistory/List')}">Historia Médica</a> <span class="separator"></span></li>
            <li>Mostrar Historia Médica</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Historia Médica: ${medicHistoryInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-medicHistory" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list medicHistory">

                                <g:if test="${medicHistoryInstance?.date}">
                                    <li class="fieldcontain">
                                        <span id="date-label" class="property-label"><g:message code="medicHistory.date.label" default="Date" /></span>

                                        <span class="property-value" aria-labelledby="date-label"><g:link controller="date" action="show" id="${medicHistoryInstance?.date?.id}">${medicHistoryInstance?.date?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.familyHistory}">
                                    <li class="fieldcontain">
                                        <span id="familyHistory-label" class="property-label"><g:message code="medicHistory.familyHistory.label" default="Family History" /></span>

                                        <span class="property-value" aria-labelledby="familyHistory-label"><g:fieldValue bean="${medicHistoryInstance}" field="familyHistory"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.funtionalTestCardiovascular}">
                                    <li class="fieldcontain">
                                        <span id="funtionalTestCardiovascular-label" class="property-label"><g:message code="medicHistory.funtionalTestCardiovascular.label" default="Funtional Test Cardiovascular" /></span>

                                        <span class="property-value" aria-labelledby="funtionalTestCardiovascular-label"><g:fieldValue bean="${medicHistoryInstance}" field="funtionalTestCardiovascular"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.funtionalTestDigestive}">
                                    <li class="fieldcontain">
                                        <span id="funtionalTestDigestive-label" class="property-label"><g:message code="medicHistory.funtionalTestDigestive.label" default="Funtional Test Digestive" /></span>

                                        <span class="property-value" aria-labelledby="funtionalTestDigestive-label"><g:fieldValue bean="${medicHistoryInstance}" field="funtionalTestDigestive"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.funtionalTestGynecological}">
                                    <li class="fieldcontain">
                                        <span id="funtionalTestGynecological-label" class="property-label"><g:message code="medicHistory.funtionalTestGynecological.label" default="Funtional Test Gynecological" /></span>

                                        <span class="property-value" aria-labelledby="funtionalTestGynecological-label"><g:fieldValue bean="${medicHistoryInstance}" field="funtionalTestGynecological"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.funtionalTestMetabolicEndocrine}">
                                    <li class="fieldcontain">
                                        <span id="funtionalTestMetabolicEndocrine-label" class="property-label"><g:message code="medicHistory.funtionalTestMetabolicEndocrine.label" default="Funtional Test Metabolic Endocrine" /></span>

                                        <span class="property-value" aria-labelledby="funtionalTestMetabolicEndocrine-label"><g:fieldValue bean="${medicHistoryInstance}" field="funtionalTestMetabolicEndocrine"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.funtionalTestNeurologicalPsychic}">
                                    <li class="fieldcontain">
                                        <span id="funtionalTestNeurologicalPsychic-label" class="property-label"><g:message code="medicHistory.funtionalTestNeurologicalPsychic.label" default="Funtional Test Neurological Psychic" /></span>

                                        <span class="property-value" aria-labelledby="funtionalTestNeurologicalPsychic-label"><g:fieldValue bean="${medicHistoryInstance}" field="funtionalTestNeurologicalPsychic"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.funtionalTestRespiratory}">
                                    <li class="fieldcontain">
                                        <span id="funtionalTestRespiratory-label" class="property-label"><g:message code="medicHistory.funtionalTestRespiratory.label" default="Funtional Test Respiratory" /></span>

                                        <span class="property-value" aria-labelledby="funtionalTestRespiratory-label"><g:fieldValue bean="${medicHistoryInstance}" field="funtionalTestRespiratory"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.funtionalTestUnitary}">
                                    <li class="fieldcontain">
                                        <span id="funtionalTestUnitary-label" class="property-label"><g:message code="medicHistory.funtionalTestUnitary.label" default="Funtional Test Unitary" /></span>

                                        <span class="property-value" aria-labelledby="funtionalTestUnitary-label"><g:fieldValue bean="${medicHistoryInstance}" field="funtionalTestUnitary"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.habits}">
                                    <li class="fieldcontain">
                                        <span id="habits-label" class="property-label"><g:message code="medicHistory.habits.label" default="Habits" /></span>

                                        <span class="property-value" aria-labelledby="habits-label"><g:fieldValue bean="${medicHistoryInstance}" field="habits"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.medicine}">
                                    <li class="fieldcontain">
                                        <span id="medicine-label" class="property-label"><g:message code="medicHistory.medicine.label" default="Medicine" /></span>

                                        <span class="property-value" aria-labelledby="medicine-label"><g:fieldValue bean="${medicHistoryInstance}" field="medicine"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.obstetricalGynecologicalHistory}">
                                    <li class="fieldcontain">
                                        <span id="obstetricalGynecologicalHistory-label" class="property-label"><g:message code="medicHistory.obstetricalGynecologicalHistory.label" default="Obstetrical Gynecological History" /></span>

                                        <span class="property-value" aria-labelledby="obstetricalGynecologicalHistory-label"><g:fieldValue bean="${medicHistoryInstance}" field="obstetricalGynecologicalHistory"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.patient}">
                                    <li class="fieldcontain">
                                        <span id="patient-label" class="property-label"><g:message code="medicHistory.patient.label" default="Patient" /></span>

                                        <span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${medicHistoryInstance?.patient?.id}">${medicHistoryInstance?.patient?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.presentDisease}">
                                    <li class="fieldcontain">
                                        <span id="presentDisease-label" class="property-label"><g:message code="medicHistory.presentDisease.label" default="Present Disease" /></span>

                                        <span class="property-value" aria-labelledby="presentDisease-label"><g:fieldValue bean="${medicHistoryInstance}" field="presentDisease"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${medicHistoryInstance?.surgicalPathologicalHistory}">
                                    <li class="fieldcontain">
                                        <span id="surgicalPathologicalHistory-label" class="property-label"><g:message code="medicHistory.surgicalPathologicalHistory.label" default="Surgical Pathological History" /></span>

                                        <span class="property-value" aria-labelledby="surgicalPathologicalHistory-label"><g:fieldValue bean="${medicHistoryInstance}" field="surgicalPathologicalHistory"/></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${medicHistoryInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${medicHistoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
                        </div>
                    </div><!--widgetcontent-->
                </div><!--widget-->

                <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2014. Fast CA. Todos los derechos reservados.</span>
                    </div>
                    <div class="footer-right">
                        <span>Diseñado por: <a href="http://themepixels.com/">Kristian Cortés</a></span>
                    </div>
                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->
    </body>
</html>

<%@ page import="fastchacaito.Patient" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Patient/List')}">Paciente</a> <span class="separator"></span></li>
            <li>Editar Paciente</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Editar Paciente: ${patientInstance?.firstName} ${patientInstance?.lastName}</h4>
                    <div class="widgetcontent">
                        <div id="edit-patient" class="content scaffold-edit" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${patientInstance}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${patientInstance}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                        </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form method="post" >
                                <g:hiddenField name="id" value="${patientInstance?.id}" />
                                <g:hiddenField name="version" value="${patientInstance?.version}" />
                                <fieldset class="form">
                                    <%@ page import="fastchacaito.Patient" %>

                                    <h2 style="text-align: center;color:#3462c7;">Datos Personales</h2>
                                    <br>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'cedula', 'error')} required">
                                        <label for="cedula">
                                            <g:message code="patient.cedula.label" default="Cédula"/>
                                        </label>
                                        <g:textField name="cedula" value="${patientInstance.cedula}" required="" />
                                    </div>

                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'fisrtName', 'error')} ">
                                        <label for="firstName">
                                            <g:message code="patient.firstName.label" default="Nombre" />

                                        </label>
                                        <g:textField name="firstName" value="${patientInstance?.firstName}"/>
                                    </div>

                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'lastName', 'error')} ">
                                        <label for="lastName">
                                            <g:message code="patient.lastName.label" default="Apellido" />

                                        </label>
                                        <g:textField name="lastName" value="${patientInstance?.lastName}"/>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'phone', 'error')} ">
                                        <label for="phone">
                                            <g:message code="patient.phone.label" default="Teléfono" />

                                        </label>
                                        <g:textField name="phone" value="${patientInstance?.phone}"/>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'email', 'error')} ">
                                        <label for="email">
                                            <g:message code="patient.email.label" default="Correo Electrónico" />

                                        </label>
                                        <g:textField name="email" value="${patientInstance?.email}"/>
                                    </div>

                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'bornDate', 'error')} ">
                                        <label>Fecha de Nacimiento</label>
                                        <span class="field"><input value="${patientInstance?.bornDate.format('MM/dd/yyyy')}" id="datepicker" type="text" name="bornDate" class="input-small" /></span>
                                    </div> 

                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'ocupation', 'error')} ">
                                        <label for="ocupation">
                                            <g:message code="patient.ocupation.label" default="Ocupación" />

                                        </label>
                                        <g:textField name="ocupation" value="${patientInstance?.ocupation}"/>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'civilStatus', 'error')} ">
                                        <label for="civilStatus">
                                            <g:message code="patient.civilStatus.label" default="Estado Civil" />

                                        </label>
                                        <g:textField name="civilStatus" value="${patientInstance?.civilStatus}"/>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'haveKids', 'error')} ">
                                        <label for="civilStatus">
                                            <g:message code="patient.haveKids.label" default="Número de Hijos" />

                                        </label>
                                        <g:select name="haveKids" from="${0..10}" value="${patientInstance?.haveKids}" />
                                    </div>

                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'address', 'error')} ">
                                        <label for="address">
                                            <g:message code="patient.address.label" default="Dirección" />

                                        </label>
                                        <g:textArea name="address" value="${patientInstance?.address}"/>
                                    </div>

                                    <br><br>
                                    <h2 style="text-align: center;color:#3462c7;">Datos Generales</h2>
                                    <br>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'height', 'error')} ">
                                        <label for="height">
                                            <g:message code="patient.height.label" default="Altura" />

                                        </label>
                                        <div class="input-append bootstrap-timepicker">
                                            <g:textField name="height" value="${patientInstance?.height}"/>
                                            <span class="add-on">Metros</span>
                                        </div>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'initialWeight', 'error')} ">
                                        <label for="initialWeight">
                                            <g:message code="patient.initialWeight.label" default="Peso Inicial" />

                                        </label>
                                        <div class="input-append bootstrap-timepicker">
                                            <g:field name="initialWeight" value="${patientInstance?.initialWeight}"/>
                                            <span class="add-on">Metros</span>
                                        </div>
                                    </div>

                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'problematicsAreas', 'error')} ">
                                        <label for="problematicsAreas">
                                            <g:message code="patient.problematicsAreas.label" default="Áreas Problematicas" />

                                        </label>
                                        <div class="input-append bootstrap-timepicker">
                                            <g:textArea name="problematicsAreas" value="${patientInstance?.problematicsAreas}"/>
                                        </div>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'problemCauses', 'error')} ">
                                        <label for="problemCauses">
                                            <g:message code="patient.problemCauses.label" default="Causas del Problema" />

                                        </label>
                                        <div class="input-append bootstrap-timepicker">
                                            <g:textArea name="problemCauses" value="${patientInstance?.problemCauses}"/>
                                        </div>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'usedMethod', 'error')} ">
                                        <label for="usedMethod">
                                            <g:message code="patient.usedMethod.label" default="Metodos Usados" />
                                        </label>
                                        <div class="input-append bootstrap-timepicker">
                                            <g:textArea name="usedMethod" value="${patientInstance?.usedMethod}"/>
                                        </div>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'anotherTreatments', 'error')} ">
                                        <label for="anotherTreatments">
                                            <g:message code="patient.anotherTreatments.label" default="Otros Tratamientos Usados" />

                                        </label>
                                        <div class="input-append bootstrap-timepicker">
                                            <g:textArea name="anotherTreatments" value="${patientInstance?.anotherTreatments}"/>
                                        </div>
                                    </div>
                                    <br><br>
                                    <h2 style="text-align: center;color:#3462c7;">Datos Médicos</h2>
                                    <br>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'allergy', 'error')} ">
                                        <label for="allergy">
                                            <g:message code="patient.allergy.label" default="Alergias" />

                                        </label>
                                        <g:textField name="allergy" value="${patientInstance?.allergy}"/>
                                    </div>
                                    <table>
                                        <tr>
                                            <td>
                                                <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferDiabetes', 'error')} ">
                                                    <label for="sufferDiabetes">
                                                        <g:message code="patient.sufferDiabetes.label" default="Sufre Diabetes" />

                                                    </label>
                                                    <g:checkBox id="box2" name="sufferDiabetes" value="${patientInstance?.sufferDiabetes}" />
                                                </div>
                                            </td>
                                            <td>
                                                <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferFever', 'error')} ">
                                                    <label for="sufferFever">
                                                        <g:message code="patient.sufferFever.label" default="Sufre Fiebre" />

                                                    </label>
                                                    <g:checkBox id="box2" name="sufferFever" value="${patientInstance?.sufferFever}" />
                                                </div>
                                            </td>
                                            <td>
                                                <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferHernias', 'error')}">
                                                    <label for="sufferHernias">
                                                        <g:message code="patient.sufferHernias.label" default="Sufre de Hernias" />

                                                    </label>
                                                    <g:checkBox id="box2" name="sufferHernias" value="${patientInstance?.sufferHernias}" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferHypertension', 'error')} ">
                                                    <label for="sufferHypertension">
                                                        <g:message code="patient.sufferHypertension.label" default="Sufre de Hipertensión" />

                                                    </label>
                                                    <g:checkBox id="box2" name="sufferHypertension" value="${patientInstance?.sufferHypertension}" />
                                                </div>
                                            </td>
                                            <td>
                                                <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferRenalInsufficiency', 'error')} ">
                                                    <label for="sufferRenalInsufficiency">
                                                        <g:message code="patient.sufferRenalInsufficiency.label" default="Sufre de Insuficiencia Renal" />

                                                    </label>
                                                    <g:checkBox id="box2" name="sufferRenalInsufficiency" value="${patientInstance?.sufferRenalInsufficiency}" />
                                                </div>
                                            </td>
                                            <td>
                                                <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferhemorrhoid', 'error')} ">
                                                    <label for="sufferhemorrhoid">
                                                        <g:message code="patient.sufferhemorrhoid.label" default="Sufre de Hemorroides" />

                                                    </label>
                                                    <g:checkBox id="box2" name="sufferhemorrhoid" value="${patientInstance?.sufferhemorrhoid}" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sufferHeartFailure', 'error')} ">
                                                    <label for="sufferHeartFailure">
                                                        <g:message code="patient.sufferHeartFailure.label" default="Sufre del Corazón" />

                                                    </label>
                                                    <g:checkBox id="box2" id="box1" name="sufferHeartFailure" value="${patientInstance?.sufferHeartFailure}" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>


                                    <br>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'heartMedicine', 'error')}">
                                        <label for="heartMedicine">
                                            <g:message code="patient.heartMedicine.label" default="Medicina Cardiaca" />

                                        </label>
                                        <g:textField name="heartMedicine" value="${patientInstance?.heartMedicine}"/>
                                        <br>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'medicine', 'error')} " >
                                        <label for="medicine">
                                            <g:message code="patient.medicine.label" default="Medicina" />

                                        </label>
                                        <g:textField name="medicine" value="${patientInstance?.medicine}"/>
                                    </div>
                                    <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'otherSuffer', 'error')} " >
                                        <label for="medicine">
                                            <g:message code="patient.medicine.label" default="Otra Insuficiencia" />

                                        </label>
                                        <g:textArea name="medicine" value="${patientInstance?.otherSuffer}"/>
                                    </div>




                                </fieldset>
                                <fieldset class="buttons">
                                    <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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

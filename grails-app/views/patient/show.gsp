
<%@ page import="fastchacaito.Patient" %>
<%@ page import="fastchacaito.Balance"%>
<%@ page import="fastchacaito.Mesotherapy"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Patient/List')}">Paciente</a> <span class="separator"></span></li>
            <li>Mostrar Paciente</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <center><h4 style="font-size: 30px; color: #3461c6">Paciente: ${patientInstance?.firstName} ${patientInstance?.lastName}</h4></center>
                <br>
                <div id="show-patient" class="content scaffold-show" role="main">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <ol class="property-list patient">

                        <table class="table table-bordered table-invoice">
                            <tr>
                                <td class="width30">Nombre</td>
                                <td class="width70">${patientInstance?.firstName} ${patientInstance?.lastName}</td>
                            </tr>
                            <tr>
                                <td>Cédula</td>
                                <td>${patientInstance?.cedula}</td>
                            </tr>
                            <tr>
                                <td>Edad</td>
                                <td>${patientInstance?.getPatientAge()} años ( <g:formatDate format="dd MMMM yyyy" date="${patientInstance?.bornDate}"/> )</td>
                            </tr>
                            <tr>
                                <td>Ocupación</td>
                                <td>${patientInstance?.ocupation}</td>
                            </tr>
                            <tr>
                                <td>Dirección</td>
                                <td>${patientInstance?.address}</td>
                            </tr>
                            <tr>
                                <td>Teléfono</td>
                                <td>${patientInstance?.phone}</td>
                            </tr>
                            <tr>
                                <td>Correo Electrónico</td>
                                <td>${patientInstance?.email}</td>
                            </tr>
                            <tr>
                                <td>Estado Civil</td>
                                <td>${patientInstance?.civilStatus}</td>
                            </tr>
                            <tr>
                                <td>Número de Hijos</td>
                                <g:if test="${patientInstance.haveKids.equals("0")}">
                                    <td>N/A</td>
                                </g:if>
                                <g:else>
                                    <g:if test="${patientInstance.haveKids.equals("1")}">
                                        <td>${patientInstance?.haveKids} hijo</td>
                                    </g:if>
                                    <g:else>
                                        <td>${patientInstance?.haveKids} hijos</td>
                                    </g:else>

                                </g:else>
                            </tr>
                            <tr>
                                <td>Fecha de Ingreso</td>
                                <td><g:formatDate format="dd MMMM yyyy" date="${patientInstance?.admisionDate}"/></td>
                            </tr>
                        </table>

                    </ol>


                    <div class="tabbedwidget tab-primary">
                        <ul>
                            <g:if test="${patientInstance.treatments}">
                                <li><a href="#a-1">Facturas</a></li>
                                </g:if>
                            <li><a href="#a-2">Insuficiencias</a></li> 
                            <li><a href="#a-3">Datos Generales</a></li> 
                                <g:if test="${patientInstance.medicHistory}">
                                <li><a href="#a-4">Historia Médica</a></li> 
                                </g:if>
                                <g:if test="${patientInstance.haveBalance(patientInstance.id)}">
                                <li><a href="#a-5">Balance</a></li>
                                </g:if>
                                <g:if test="${patientInstance.haveMesotherapy(patientInstance.id)}">
                                <li><a href="#a-6">Mesoterapia</a></li>
                                </g:if>
                                <g:if test="${patientInstance.haveBodyTherapy(patientInstance.id)}">
                                <li><a href="#a-7">Terapia Corporal</a></li>
                                </g:if>
                                <g:if test="${patientInstance.haveMachine(patientInstance.id)}">
                                <li><a href="#a-8">Máquina</a></li>
                                </g:if>
                                <g:if test="${patientInstance.bloodSample}">
                                <li><a href="#a-9">Muestras de sangre</a></li> 
                                </g:if>
                                <g:if test="${patientInstance.getMeasuresControl(patientInstance.id)}">
                                <li><a href="#a-10">Control de Medidas</a></li>
                                </g:if>
                                <g:if test="${patientInstance.hasAppointment(patientInstance)}">
                                <li><a href="#a-11">Control de Citas </a></li>
                                </g:if>
                            <li><a href="#a-12">Opciones </a></li>

                        </ul>
                        <g:if test="${patientInstance.treatments}">
                            <div id="a-1">
                                <table class="table responsive">
                                    <thead>
                                        <tr>
                                            <th class="center"></th>
                                            <th class="center">Tratamiento</th>
                                            <th class="center">Monto</th>
                                            <th class="center">Fecha de Pago</th>
                                            <th class="center">Fecha de Inicio</th>
                                            <th class="center">Fecha de Vencimiento</th>
                                            <th class="center">Total Abonado</th>
                                            <th class="center">Abonar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <g:each in="${patientInstance.treatments}" var="item">
                                            <tr>
                                                <td class="center"></td>
                                                <td class="center">${patientInstance?.getTreatments(item.id)}</td>
                                                <td class="center">${item.totalPrice} Bsf</td>
                                                <td class="center"><g:formatDate date="${item.date}" format="dd MMMM yyyy"/></td>
                                                <td class="center"><g:formatDate date="${item.beginDate}" format="dd MMMM yyyy"/></td>
                                                <td class="center"><g:formatDate date="${item.endDate}" format="dd MMMM yyyy"/></td>
                                                <td class="center">
                                                    <a href="${createLink(controller:'paymentMethod', action:'list', params:[foo:item.id])}">
                                                        <span class="iconfa-money">
                                                        </span> ${patientInstance?.getMontoAbonado(patientInstance?.id,item.id)} BsF</td>
                                                </a> 

                                                <td class="center">
                                                    <g:if test="${patientInstance?.getMontoAbonado(patientInstance?.id,item.id) < item.totalPrice}">
                                                        <a href="${createLink(controller:'paymentMethod', action:'create', params:[foo:item.id])}">
                                                            <span class="iconfa-money">
                                                            </span> Pagar ${item.totalPrice-patientInstance?.getMontoAbonado(patientInstance?.id,item.id)} BsF
                                                        </a> 
                                                    </g:if>
                                                    <g:else>
                                                        Pagó totalidad
                                                    </g:else>

                                                </td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </div>
                        </g:if>
                        <div id="a-2">
                            <table class="table table-bordered table-invoice">
                                <tr>
                                    <td>Sufre de Insuficiencia Renal</td>
                                    <g:if test="${patientInstance?.sufferRenalInsufficiency}">
                                        <td>Si</td>   
                                    </g:if>
                                    <g:else>
                                        <td>No</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Sufre de Hipertensión</td>
                                    <g:if test="${patientInstance?.sufferHypertension}">
                                        <td>Si</td>   
                                    </g:if>
                                    <g:else>
                                        <td>No</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Sufre de Hernias</td>
                                    <g:if test="${patientInstance?.sufferHernias}">
                                        <td>Si</td>   
                                    </g:if>
                                    <g:else>
                                        <td>No</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Sufre del Corazón</td>
                                    <g:if test="${patientInstance?.sufferHeartFailure}">
                                        <td>Si</td>   
                                    </g:if>
                                    <g:else>
                                        <td>No</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Medicina Cardiaca</td>
                                    <g:if test="${patientInstance?.heartMedicine}">
                                        <td>${patientInstance?.heartMedicine}</td>   
                                    </g:if>
                                    <g:else>
                                        <td>El paciente no tiene tratamiento con medicinas para el corazón</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Sufre de Fiebre</td>
                                    <g:if test="${patientInstance?.sufferFever}">
                                        <td>Si</td>   
                                    </g:if>
                                    <g:else>
                                        <td>No</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Sufre de Diabetes</td>
                                    <g:if test="${patientInstance?.sufferDiabetes}">
                                        <td>Si</td>   
                                    </g:if>
                                    <g:else>
                                        <td>No</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Sufre de Hemorroides</td>
                                    <g:if test="${patientInstance?.sufferhemorrhoid}">
                                        <td>Si</td>   
                                    </g:if>
                                    <g:else>
                                        <td>No</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Alergia a</td>
                                    <g:if test="${patientInstance?.allergy}">
                                        <td>${patientInstance?.allergy}</td>   
                                    </g:if>
                                    <g:else>
                                        <td>No</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Medicinas</td>
                                    <g:if test="${patientInstance?.medicine}">
                                        <td>${patientInstance?.medicine}</td>   
                                    </g:if>
                                    <g:else>
                                        <td>El paciente no tiene tratamiencto con medicínas</td> 
                                    </g:else>
                                </tr>
                                <tr>
                                    <td>Otras Insuficiencias</td>
                                    <g:if test="${patientInstance?.otherSuffer}">
                                        <td>${patientInstance?.otherSuffer}</td>   
                                    </g:if>
                                    <g:else>
                                        <td>El paciente no tiene otro tipos de insuficiencia</td> 
                                    </g:else>
                                </tr>


                            </table>
                        </div>
                        <div id="a-3">
                            <table class="table table-bordered table-invoice">
                                <tr>
                                    <td>Altura</td>
                                    <td>${patientInstance?.height} m</td>   
                                </tr>
                                <tr>
                                    <td>Peso Inicial</td>
                                    <td>${patientInstance?.initialWeight} Kg</td> 
                                </tr>
                                <tr>
                                    <td>Áreas Problemáticas</td>
                                    <td>${patientInstance?.problematicsAreas}</td>  
                                </tr>
                                <tr>
                                    <td>Causas del Problema</td>
                                    <td>${patientInstance?.problemCauses}</td>  
                                </tr>
                                <tr>
                                    <td>Metodos Usados</td>
                                    <td>${patientInstance?.usedMethod}</td>  
                                </tr>
                                <tr>
                                    <td>Otros Tratamientos</td>
                                    <td>${patientInstance?.anotherTreatments}</td>  
                                </tr>
                            </table>
                        </div>
                        <g:if test="${patientInstance.medicHistory}">
                            <div id="a-4">
                                <div class="accordion accordion-info" style="width: 100%;">
                                    <g:each in="${patientInstance.medicHistory.reverse()}" var="item">

                                        <h3><a href="#">Historia Médica del <g:formatDate date="${item.date}" format="dd MMMM yyyy"/> </a></h3>
                                        <div>
                                            <h3>Datos Generales</h3>
                                            <table class="table table-bordered table-invoice">
                                                <tr>
                                                    <td style="width: 30%">Enfermedad Actual:</td>
                                                    <td>${item.presentDisease}</td>
                                                </tr>
                                                <tr>
                                                    <td>Medicamentos en uso:</td>
                                                    <td>${item.medicine}</td>
                                                </tr>
                                            </table>
                                            <h3>Antecedentes</h3>
                                            <table class="table table-bordered table-invoice">
                                                <tr>
                                                    <td style="width: 30%">Familiares:</td>
                                                    <td>${item.familyHistory}</td>
                                                </tr>
                                                <tr>
                                                    <td>Quirurgicos-Patológicos:</td>
                                                    <td>${item.surgicalPathologicalHistory}</td>
                                                </tr>
                                                <tr>
                                                    <td>Obstetricos-Ginecológicos:</td>
                                                    <td>${item.obstetricalGynecologicalHistory}</td>
                                                </tr>
                                                <tr>
                                                    <td>Hábitos:</td>
                                                    <td>${item.habits}</td>
                                                </tr>
                                            </table>
                                            <h3>Examen Funcional</h3>
                                            <table class="table table-bordered table-invoice">
                                                <tr>
                                                    <td style="width: 30%">Cardiovascular:</td>
                                                    <td>${item.funtionalTestCardiovascular}</td>
                                                </tr>
                                                <tr>
                                                    <td>Respiratorio:</td>
                                                    <td>${item.funtionalTestRespiratory}</td>
                                                </tr>
                                                <tr>
                                                    <td>Digestivo:</td>
                                                    <td>${item.funtionalTestDigestive}</td>
                                                </tr>
                                                <tr>
                                                    <td>Urinario:</td>
                                                    <td>${item.funtionalTestUnitary}</td>
                                                </tr>
                                                <tr>
                                                    <td>Neurológico:</td>
                                                    <td>${item.funtionalTestNeurologicalPsychic}</td>
                                                </tr>
                                                <tr>
                                                    <td>Metabolico-Endocrino:</td>
                                                    <td>${item.funtionalTestMetabolicEndocrine}</td>
                                                </tr>
                                                <tr>
                                                    <td>Ginecológico:</td>
                                                    <td>${item.funtionalTestGynecological}</td>
                                                </tr>
                                            </table>
                                        </div>

                                    </g:each>
                                </div><!--#accordion-->
                            </div>
                        </g:if>
                        <div id="a-5">

                            <g:if test="${patientInstance.treatments}">
                                <div class="accordion accordion-info" style="width: 100%;">
                                    <g:each in="${patientInstance.treatments.reverse()}" var="item">
                                        <g:if test="${patientInstance.getBalance(item.id)}">
                                            <g:each in="${patientInstance.getBalance(item.id)}" var="item2">
                                                <h1><a href="#">Balance ${item2.type}: <g:formatDate date="${item.beginDate}" format="dd MMMM yyyy"/> - <g:formatDate date="${item.endDate}" format="dd MMMM yyyy"/></a></h1>
                                                <div>
                                                    <g:if test="${fastchacaito.Balance.isHalfOfApplication(item2.id) == true}"> 
                                                        <div class="alert alert-error" role="status">Paciente Moroso</div>
                                                    </g:if>
                                                    <table class="table table-bordered table-invoice">
                                                        <tr>
                                                            <td style="width: 30%">Tipo de Balance: </td>
                                                            <td>Balance ${item2.type}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Cantidad de Aplicaciones:</td>
                                                            <td>${item2.applicationAmount} Aplicaciones</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Peso a lograr:</td>
                                                            <td>${item2.idealWeight} Kg</td>
                                                        </tr>
                                                    </table>
                                                    <g:if test="${item2.applicationControl}">
                                                        <h3>Control de Aplicaciones</h3>
                                                        <table class="table responsive">
                                                            <thead>
                                                                <tr>
                                                                    <th></th>
                                                                    <th class="center">Nº</th>
                                                                    <th class="center">Fecha</th>
                                                                    <th class="center">P Actual</th>
                                                                    <th class="center">P Diferencia</th>
                                                                    <th class="center">P Alcanzado</th>
                                                                    <th class="center">Media</th>
                                                                    <th class="center">¿Aplicado?</th>
                                                                    <th class="center">IMC</th>
                                                                    <th class="center">Asistente</th>
                                                                    <th class="center">Observación</th>
                                                                </tr>

                                                            </thead>
                                                            <g:each in="${item2.applicationControl}" var="item3">
                                                                <tr>
                                                                    <td></td>
                                                                    <td class="center">${item3.identifierNumber}</td>
                                                                    <td class="center"><g:formatDate format="dd MMM yyyy" date="${item3.date}"/></td>
                                                                    <td class="center">${item3.currentWeight} Kg</td>
                                                                    <g:if test="${item3.differenceWeight<0}">
                                                                        <td class="center" style="color: red;">${item3.differenceWeight} Kg</td>
                                                                    </g:if>
                                                                    <g:else>
                                                                        <td class="center" style="color: green;">${item3.differenceWeight} Kg</td>
                                                                    </g:else>
                                                                    <td class="center">${item3.reachedWeight} Kg</td>
                                                                    <td class="center">${item3.reachedWeight/item3.identifierNumber} Kg</td>
                                                                    <td class="center"><g:if test="${item3.wasApplied}">SI</g:if><g:else>NO</g:else></td>
                                                                    <td class="center"><g:formatNumber number="${item3.currentWeight/(patientInstance.height*patientInstance.height)}"maxFractionDigits="2" /></td>
                                                                    <td class="center" style=" width:23%;">${item3.user}</td>
                                                                    <td class="center" style=" width:23%;">${item3.observation}</td>
                                                                </tr>
                                                            </g:each>
                                                        </table>
                                                        <g:if test="${item2.applicationControl.size()<item2.applicationAmount}">                                                        
                                                            <g:if test="${item2.treatment.endDate.compareTo(new Date().toTimestamp()) >= 0}"> 
                                                            <g:if test="${fastchacaito.Balance.applyControl(item2.id) == true}"> 
                                                                    <a class="btn btn-info dropdown-toggle" style="color: white;" href="${createLink(controller:'measuresControl', action:'create', params:[foo:item2?.id,type:1])}">
                                                                        Control de Medidas
                                                                    </a>
                                                                </g:if>
                                                                <g:if test="${fastchacaito.Balance.isHalfOfApplication(item2.id) == false}"> 
                                                                    <a class="btn btn-info dropdown-toggle" style="color: white;" href="${createLink(controller:'applicationControl', action:'create', params:[foo:item2?.id])}">
                                                                        Agregar Control de Aplicación
                                                                    </a>
                                                                </g:if>
                                                                <g:else>
                                                                    <a class="btn btn-danger dropdown-toggle" disabled> 
                                                                        Agregar Control de Aplicación
                                                                    </a>
                                                                    <font style="color: red;margin-left: 5px; padding-left: 5px;">
                                                                    La persona debe cancelar el monto restante del tratamiento
                                                                    </font>
                                                                </g:else>
                                                            </g:if>

                                                        </g:if>
                                                    </g:if>
                                                    <g:else>    
                                                        <g:if test="${item2.treatment.endDate.compareTo(new Date().toTimestamp()) >= 0}"> 
                                                        <g:if test="${fastchacaito.Balance.applyControl(item2.id) == true}">
                                                                <a class="btn btn-info dropdown-toggle" style="color: white;" href="${createLink(controller:'measuresControl', action:'create', params:[foo:item2?.id,type:1])}">
                                                                    Control de Medidas
                                                                </a>
                                                            </g:if>
                                                            <g:if test="${fastchacaito.Balance.isHalfOfApplication(item2.id) == false}"> 

                                                                <a class="btn btn-info dropdown-toggle" style="color: white;" href="${createLink(controller:'applicationControl', action:'create', params:[foo:item2?.id])}">
                                                                    Agregar Control de Aplicación 
                                                                </a>

                                                            </g:if>
                                                        </g:if>
                                                    </g:else>
                                                </div>
                                            </g:each>
                                        </g:if>
                                    </g:each>
                                </div>
                            </g:if>
                        </div>
                        <div id="a-6">
                            <g:if test="${patientInstance.treatments}">
                                <div class="accordion accordion-info" style="width: 100%;">
                                    <g:each in="${patientInstance.treatments.reverse()}" var="item">
                                        <g:if test="${patientInstance.getMesotherapy(item.id)}">
                                            <g:each in="${patientInstance.getMesotherapy(item.id)}" var="item2">
                                                <h3><a href="#">Mesoterapia: <g:formatDate date="${item.beginDate}" format="dd MMMM yyyy"/> - <g:formatDate date="${item.endDate}" format="dd MMMM yyyy"/></a></h3>
                                                <div>
                                                    <g:if test="${fastchacaito.Mesotherapy.isHalfOfApplication(item2.id) == true}"> 
                                                        <div class="alert alert-error" role="status">Paciente Moroso</div>
                                                    </g:if>
                                                    <table class="table table-bordered table-invoice">
                                                        <tr>
                                                            <td style="width: 30%">Areas a Tratar:</td>
                                                            <td>${item2.treatAreas}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Intentos Anteriores:</td>
                                                            <td>${item2.previousAttempts}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Causas del Problema:</td>
                                                            <td>${item2.ploblemCauses}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Metodos:</td>
                                                            <td>${item2.method}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Cantidad de Sesiones:</td>
                                                            <td>${item2.applicationAmount}</td>
                                                        </tr>
                                                    </table>
                                                    <g:if test="${item2.sesionControl}">
                                                        <h3>Control de Sesión</h3>
                                                        <table class="table responsive">
                                                            <thead>
                                                                <tr>
                                                                    <th></th>
                                                                    <th class="center">Nº</th>
                                                                    <th class="center">Fecha</th>
                                                                    <th class="center">Kit</th>
                                                                    <th class="center">Vacutainer</th>
                                                                    <th class="center">Vacutainer 2</th>
                                                                    <th class="center">Aplicado por</th>
                                                                </tr>

                                                            </thead>
                                                            <g:each in="${item2.sesionControl}" var="item3">
                                                                <tr>
                                                                    <td></td>
                                                                    <td class="center">${item3.sesionNumber}</td>
                                                                    <td class="center"><g:formatDate format="dd MMM yyyy" date="${item3.date}"/></td>
                                                                    <td class="center">${item3.kit} cm</td>
                                                                    <td class="center">${item3.vacutainer} </td>
                                                                    <td class="center">${item3.vacutainer2}</td>
                                                                    <td class="center">${item3.secAppUser} </td>
                                                                    <%--  <td class="center">${item3.hips} cm</td>
                                                                     <td class="center">${item3.leftThigh} cm</td>
                                                                     <td class="center">${item3.rightThigh} cm</td>
                                                                     <td class="center">${item3.leftCrotch} cm</td>
                                                                     <td class="center">${item3.rightCrotch} cm</td>
                                                                     <td class="center">${item3.achieved} cm</td> --%>
                                                                </tr>
                                                            </g:each>
                                                        </table>
                                                        <g:if test="${item2.sesionControl.size()<item2.treatment.packages.sesionAmount}">                                                        

                                                            <g:if test="${fastchacaito.Mesotherapy.applyControl(item2.id) == true}"> 
                                                                <a class="btn btn-info dropdown-toggle" style="color: white;" href="${createLink(controller:'measuresControl', action:'create', params:[foo:item2?.id,type:2])}">
                                                                    Control de Medidas
                                                                </a>
                                                            </g:if>
                                                            <g:if test="${item2.treatment.endDate.compareTo(new Date().toTimestamp()) >= 0}">
                                                            <g:if test="${fastchacaito.Mesotherapy.isHalfOfApplication(item2.id)==false}">
                                                                    <a class="btn btn-info dropdown-toggle" style="color: white;" href="${createLink(controller:'sesionControl', action:'create', params:[foo:item2?.id])}">Agregar Control de Sesión</a>
                                                                </g:if>
                                                                <g:else>
                                                                    <a class="btn btn-danger dropdown-toggle" disabled>Agregar Control de Sesión </a>
                                                                    <font style="color: red;margin-left: 5px; padding-left: 5px;">
                                                                    La persona debe cancelar el monto restante del tratamiento
                                                                    </font>
                                                                </g:else>
                                                            </g:if>
                                                        </g:if>
                                                    </g:if>
                                                    <g:else>
                                                        <g:if test="${item2.treatment.endDate.compareTo(new Date().toTimestamp()) >= 0}">
                                                        <g:if test="${fastchacaito.Mesotherapy.applyControl(item2.id) == true}"> 
                                                                <a class="btn btn-info dropdown-toggle" style="color: white;" href="${createLink(controller:'measuresControl', action:'create', params:[foo:item2?.id,type:2])}">
                                                                    Control de Medidas
                                                                </a>
                                                            </g:if>
                                                            <g:if test="${fastchacaito.Mesotherapy.isHalfOfApplication(item2.id)==false}">
                                                                <a class="btn btn-info dropdown-toggle" style="color: white;" href="${createLink(controller:'sesionControl', action:'create', params:[foo:item2?.id])}">Agregar Control de Sesión </a>
                                                            </g:if>
                                                        </g:if>        
                                                    </g:else>
                                                </div>
                                            </g:each>
                                        </g:if>
                                    </g:each>
                                </div>
                            </g:if>
                        </div>
                        <g:if test="${patientInstance.treatments}">
                            <g:each in="${patientInstance.treatments.reverse()}" var="item">
                                <g:if test="${patientInstance.getBodyTherapy(item.id)}">
                                    <div id="a-7">
                                        <g:each in="${patientInstance.getBodyTherapy(item.id)}" var="item2">
                                            <div class="accordion accordion-info" style="width: 100%;">
                                                <h3><a href="#">${item2.massageType} </a></h3>
                                                <div>
                                                    <table class="table table-bordered table-invoice">
                                                        <tr>
                                                            <td>Tipo de Masaje</td>
                                                            <td>${item2.massageType}</td>
                                                        </tr>
                                                        <g:if test="${item2.massageControl}">
                                                            <tr>
                                                                <td>Fecha</td>
                                                                <td>${item2.massageType}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Tipo de Masaje</td>
                                                                <td>${item2.massageType}</td>
                                                            </tr>
                                                        </g:if>
                                                    </table>
                                                </div>
                                            </div>
                                        </g:each>
                                    </div>
                                </g:if>
                            </g:each>
                        </g:if>
                        <g:if test="${patientInstance.treatments}">
                            <g:each in="${patientInstance.treatments.reverse()}" var="item">
                                <g:if test="${patientInstance.getMachine(item.id)}">
                                    <div id="a-8">
                                        <div class="accordion accordion-info" style="width: 100%;">
                                            <h3><a href="#">tab 1 </a></h3>
                                            <div>
                                            </div>
                                        </div>
                                    </div>
                                </g:if>
                            </g:each>
                        </g:if>
                        <g:if test="${patientInstance.bloodSample}">
                            <div id="a-9">
                                <div class="accordion accordion-info" style="width: 100%;">
                                    <g:each in="${patientInstance.bloodSample.reverse()}" var="item">

                                        <h3><a href="#">${item.testType} con muestra de sangre del <g:formatDate date="${item.receiptData}" format="dd MMMM yyyy"/> </a></h3>
                                        <div>
                                            <table class="table table-bordered table-invoice">
                                                <tr>
                                                    <td style="width: 30%">Muestra obtenida el día:</td>
                                                    <td><g:formatDate date="${item.receiptData}" format="dd MMMM yyyy"/> </td>
                                                </tr>
                                                <tr>
                                                    <td>Tipo de Prueba de Sangre:</td>
                                                    <td>${item.testType}</td>
                                                </tr>
                                                <tr>
                                                    <td>Fecha de Envío:</td>
                                                    <td><g:if test="${item.shippingDate}"><g:formatDate date="${item.shippingDate}" format="dd MMMM yyyy"/></g:if><g:else>La Muestra no ha sido envíada</g:else> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha de Recibida:</td>
                                                            <td><g:if test="${item.receivedDate}"><g:formatDate date="${item.receivedDate}" format="dd MMMM yyyy"/></g:if><g:else>La Muestra no ha sido recibída</g:else> </td>
                                                    </tr>
                                                </table>
                                            </div>

                                    </g:each>
                                </div><!--#accordion-->
                            </div>
                        </g:if>
                        <div id="a-12">
                            <div class="headtitle">
                                <div class="btn-group">
                                    <a class="btn dropdown-toggle" href="${createLink(controller:'medicHistory', action:'create', params:[foo:patientInstance?.id])}">Crear</a>
                                </div>
                                <h4 class="widgettitle title-info">Nueva Historia Médica</h4>
                            </div>
                            <div class="headtitle">
                                <div class="btn-group">
                                    <a class="btn dropdown-toggle" href="${createLink(controller:'BloodSample', action:'create', params:[foo:patientInstance?.id])}">Crear</a>
                                </div>
                                <h4 class="widgettitle title-info">Nueva Muestra de Sangre</h4>
                            </div>
                            <div class="headtitle">
                                <div class="btn-group">
                                    <a class="btn dropdown-toggle" href="${createLink(controller:'Treatment', action:'createBalance', params:[foo:patientInstance?.id])}">Crear</a>
                                </div>
                                <h4 class="widgettitle title-info">Contratar Nuevo Paquete Balance</h4>
                            </div>
                            <div class="headtitle">
                                <div class="btn-group">
                                    <a class="btn dropdown-toggle" href="${createLink(controller:'Treatment', action:'createMesotherapy', params:[foo:patientInstance?.id])}">Crear</a>
                                </div>
                                <h4 class="widgettitle title-info">Contratar Nuevo Paquete de Mesoterapia</h4>
                            </div>
                            <div class="headtitle">
                                <div class="btn-group">
                                    <a class="btn dropdown-toggle" href="${createLink(controller:'appointment', action:'create', params:[foo:patientInstance?.id])}">Crear</a>
                                </div>
                                <h4 class="widgettitle title-info">Nueva Cita</h4>
                            </div>
                        </div>
                        <g:if test="${patientInstance.getMeasuresControl(patientInstance.id)}">
                            <div id="a-10">
                                <table class="table responsive">
                                    <thead>
                                        <tr >
                                            <th class="center" style="font-size: 5px"></th>
                                            <th class="center">Ident.</th>
                                            <th class="center">Fecha</th>
                                            <th class="center">Tratamiento</th>
                                            <th class="center">Brazo Izq.</th>
                                            <th class="center">Brazo Der.</th>
                                            <th class="center">Muslo Izq.</th>
                                            <th class="center">Muslo Der.</th>
                                            <th class="center">Entrepier </br>Izq.</th>
                                            <th class="center">Entrepier </br> Der.</th>
                                            <th class="center">Caderas</th>
                                            <th class="center">Cintura</th>
                                            <th class="center">Abdomen</th>
                                            <th class="center">Total</th>


                                        </tr>
                                    </thead>
                                    <tbody>
                                        <g:each in="${patientInstance.getMeasuresControl(patientInstance.id)}" var="item">
                                            <tr>
                                                <td class="center"></td>
                                                <td class="center">${item.identifierNumber}</td>
                                                <td class="center"><g:formatDate date="${item.date}" format="dd-MM-yyyy"/></td>
                                                <td class="center">${item.getMeasureType(item.id)}</td>
                                                <td class="center">${item.leftArm}</td>
                                                <td class="center">${item.rightArm}</td>
                                                <td class="center">${item.leftThigh}</td>
                                                <td class="center">${item.rightThigh}</td>
                                                <td class="center">${item.leftCrotch}</td>
                                                <td class="center">${item.rightCrotch}</td>
                                                <td class="center">${item.hips}</td>
                                                <td class="center">${item.waist}</td>
                                                <td class="center">${item.abdomen}</td>
                                                <td class="center">${item.getTotal(item.id)}</td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>




                            </div>
                        </g:if>
                        <g:if test="${patientInstance.hasAppointment(patientInstance)}">
                            <div id="a-11">
                                <table class="table responsive">
                                    <thead>
                                        <tr >
                                            <th class="center" style="font-size: 5px"></th>

                                            <th class="center">Fecha</th>
                                            <th class="center">Hora Inicio</th>
                                            <th class="center">Hora Fin</th>
                                            <th class="center">Tratamiento</th>
                                            <th class="center">Usuario</th>
                                            <th class="center">Asistió</th>


                                        </tr>
                                    </thead>
                                    <tbody>
                                        <g:each in="${patientInstance.getAppointments(patientInstance)}" var="item">
                                            <tr>
                                                <td class="center"></td>
                                                <td class="center"> 
                                                    <g:if test="${!item.date.before(new Date())}">
                                                        <g:link  controller="appointment" action="edit" id="${item.id}" params="${[foo:item.treatment.patient.id]}">
                                                            <g:formatDate date="${item.date}" format="dd-MM-yyyy"/>
                                                        </g:link>
                                                    </g:if>
                                                    <g:else> 
                                                       <g:formatDate date="${item.date}" format="dd-MM-yyyy"/>
                                                    </g:else> 

                                                </td>
                                                
                                                <td class="center"><g:formatDate date="${item.startTime}" format="hh:mm a"/></td>
                                                <td class="center"><g:formatDate date="${item.endTime}" format="hh:mm a"/></td>
                                                <td class="center">${item.treatment.getType(item.treatment.id)}</td>


                                                <td class="center"> ${item.user} </td>
                                                <td class="center">
                                                    <g:if test="${item.attended == null}">
                                                        <g:if test="${item.date.before(new Date())}">
                                                            <ul class="list-nostyle list-inline">
                                                                <li><a href="${createLink(controller:'appointment', action:'changeAttendedStatus', id:item.id,params:[foo:1])}" class="btn btn-primary"><i class="iconfa-ok icon-white"></i>  Si</a>  </li>
                                                                <li><a href="${createLink(controller:'appointment', action:'changeAttendedStatus', id:item.id,params:[foo:2])}" class="btn btn-danger"><i class="iconfa-remove icon-white"></i>  No</a>  </li>
                                                            </ul>
                                                        </g:if>
                                                        <g:else> 
                                                            <ul class="list-nostyle list-inline">
                                                                <li><a href="" class="btn btn-primary" disabled><i class="iconfa-ok icon-white"></i>  Si</a>  </li>
                                                                <li><a href="" class="btn btn-danger" disabled><i class="iconfa-remove icon-white"></i>  No</a>  </li>
                                                            </ul>
                                                        </g:else>
                                                    </g:if>
                                                    <g:else>
                                                        <g:formatBoolean boolean="${item.attended}" true="Si" false="No" />
                                                    </g:else>
                                                </td>

                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>




                            </div>
                        </g:if>
                    </div><!--tabbedwidget-->
                    <br>
                    <g:form>
                        <fieldset class="buttons">
                            <g:hiddenField name="id" value="${patientInstance?.id}" />
                            <g:link class="btn btn-primary" action="edit" id="${patientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </div>

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
        <div id="myModal" class="modal hide fade" >

            <div id="modal-body">


                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Indicar Asistencia</h4>
                    <div class="widgetcontent">
                        <g:form controller="appointment" action="save"  >
                            <fieldset class="form">


                                <select name="attended">
                                    <label for="attended">
                                        <g:message code="vacutainer.vacutainerType.label" default="Indique" />
                                    </label>
                                    <option value="0" ${!active ? 'selected' : ''}>No asistió</option>
                                    <option value="1" ${active ? 'selected' : ''}>Si asistió</option>
                                </select>

                                <div class="fieldcontain ${hasErrors(bean: appointmentInstance, field: 'treatment', 'error')} required">
                                    <label for="treatment">
                                        <g:message code="appointment.treatment.label" default="Treatment" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:select id="treatment" name="treatment.id" from="${fastchacaito.Treatment.list()}" optionKey="id" required="" value="${appointmentInstance?.treatment?.id}" class="many-to-one"/>
                                    <input type="text" name="treatment" id="treatment" value="" />
                                </div>

                            </fieldset>
                            <fieldset class="buttons">
                                <g:submitButton name="create" class="btn btn-primary" value="Aceptar" />
                            </fieldset>
                        </g:form>
                    </div><!--widgetcontent-->
                </div><!--widget-->
            </div>
            <script>
                $(document).ready(function (e) {
                alert('abc');
                $('#myModal').on('show.bs.modal', function(e) {    
                var id = $(e.relatedTarget).data().id;
                $(e.currentTarget).find('#treatment').val(id);
                alert('abc');
                });
                });
            </script> 
    </body>
</html>

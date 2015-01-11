<%@ page import="fastchacaito.Treatment" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'treatment.label', default: 'Treatment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Treatment/List')}">Tratamiento</a> <span class="separator"></span></li>
            <li>Crear Nuevo Tratamiento</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Crear Tratamiento</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="saveMesotherapy" method="post">

                            <div id="create-treatment" class="content scaffold-create" role="main">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <g:hasErrors bean="${treatmentInstance}">
                                    <ul class="errors" role="alert">
                                        <g:eachError bean="${treatmentInstance}" var="error">
                                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                            </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form action="saveMesotherapy" >
                                    <fieldset class="form">

                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'beginDate', 'error')} required">
                                            <label for="beginDate">
                                                <g:message code="treatment.beginDate.label" default="Fecha de Inicio" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:datePicker name="beginDate" precision="day"  value="${treatmentInstance?.beginDate}"  />
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'endDate', 'error')} required">
                                            <label for="endDate">
                                                <g:message code="treatment.endDate.label" default="Fecha de Finalización" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:datePicker name="endDate" precision="day"  value="${treatmentInstance?.endDate}"  />
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'packages', 'error')} required">
                                            <label for="packages">
                                                <g:message code="treatment.packages.label" default="Paquete" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:select style="width: 40%;" id="packages" name="packages.id" from="${fastchacaito.Package.findAllByPackageType('Mesoterapia')}" optionKey="id" required="" value="${treatmentInstance?.packages?.id}" class="many-to-one"/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'treatAreas', 'error')} ">
                                            <label for="treatAreas">
                                                <g:message code="mesotherapy.treatAreas.label" default="Áreas a tratar" />

                                            </label>
                                            <g:textField name="treatAreas" value="${mesotherapyInstance?.treatAreas}"/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'ploblemCauses', 'error')} ">
                                            <label for="ploblemCauses">
                                                <g:message code="mesotherapy.ploblemCauses.label" default="Causas del Problema" />

                                            </label>
                                            <g:textField name="ploblemCauses" value="${mesotherapyInstance?.ploblemCauses}"/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'previousAttempts', 'error')} ">
                                            <label for="previousAttempts">
                                                <g:message code="mesotherapy.previousAttempts.label" default="Intentos Anteriores" />

                                            </label>
                                            <g:textField name="previousAttempts" value="${mesotherapyInstance?.previousAttempts}"/>
                                        </div>
                                        
                                        <div class="fieldcontain ${hasErrors(bean: mesotherapyInstance, field: 'method', 'error')} ">
                                            <label for="method">
                                                <g:message code="mesotherapy.method.label" default="Cuales metodos se Usaron" />

                                            </label>
                                            <g:textField name="method" value="${mesotherapyInstance?.method}"/>
                                        </div>
                                        <g:hiddenField name="patient.id" value="${treatmentInstance?.patient?.id}"/>

                                    </fieldset>
                                    <fieldset class="buttons">
                                        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                                    </fieldset>
                                </g:form>
                            </div>
                        </form>
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

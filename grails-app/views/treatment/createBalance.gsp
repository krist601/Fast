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
                        <form class="stdform" action="saveBalance" method="post">

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
                                <g:form action="saveBalance" >
                                    <fieldset class="form">
                                        <h2 style="text-align: center;color:#3462c7;">Datos de Facturación</h2><br>
                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'beginDate', 'error')} required">
                                            <label for="beginDate">
                                                <g:message code="treatment.beginDate.label" default="Fecha en que Inicia" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:datePicker name="beginDate" precision="day"  value="${treatmentInstance?.beginDate}"  />
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'endDate', 'error')} required">
                                            <label for="endDate">
                                                <g:message code="treatment.endDate.label" default="Fecha en que Finaliza" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:datePicker name="endDate" precision="day"  value="${treatmentInstance?.endDate}"  />
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'packages', 'error')} required">
                                            <label for="packages">
                                                <g:message code="treatment.packages.label" default="Paquete" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:select style="width: 40%;" id="packages" name="packages.id" from="${fastchacaito.Package.findAllByPackageTypeLike('Balance%')}" optionKey="id" required="" value="${treatmentInstance?.packages?.id}" class="many-to-one"/>
                                        </div>
                                        <br>
                                        <g:hiddenField name="patient.id" value="${treatmentInstance?.patient?.id}"/>
                                        <h2 style="text-align: center;color:#3462c7;">Datos del Balance</h2><br>
                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'idealWeight', 'error')} required">
                                            <label for="idealWeight">
                                                <g:message code="balance.idealWeight.label" default="Peso Ideal" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:field name="idealWeight" required=""/>
                                        </div>
                                        <br>
                                        <g:hiddenField name="type" value=""/>

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

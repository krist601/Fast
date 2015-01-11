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
                        <form class="stdform" action="saveMachine" method="post">

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
                                <g:form action="saveMachine" >
                                    <fieldset class="form">
                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'beginDate', 'error')} required">
                                            <label for="beginDate">
                                                <g:message code="treatment.beginDate.label" default="Begin Date" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:datePicker name="beginDate" precision="day"  value="${treatmentInstance?.beginDate}"  />
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'endDate', 'error')} required">
                                            <label for="endDate">
                                                <g:message code="treatment.endDate.label" default="End Date" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:datePicker name="endDate" precision="day"  value="${treatmentInstance?.endDate}"  />
                                        </div>
                                        
                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'packages', 'error')} required">
                                            <label for="packages">
                                                <g:message code="treatment.packages.label" default="Packages" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:select id="packages" name="packages.id" from="${fastchacaito.Package.list()}" optionKey="id" required="" value="${treatmentInstance?.packages?.id}" class="many-to-one"/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: treatmentInstance, field: 'totalPrice', 'error')} required">
                                            <label for="totalPrice">
                                                <g:message code="treatment.totalPrice.label" default="Total Price" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:field name="totalPrice" type="number" value="${treatmentInstance.totalPrice}" required=""/>
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

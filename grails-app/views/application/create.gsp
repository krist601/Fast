<%@ page import="fastchacaito.Application" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Application/List')}">Aplicación</a> <span class="separator"></span></li>
            <li>Crear Nueva Aplicación</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Crear Aplicación</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="save" method="post" data-toggle="validator">
                            <div id="create-application" class="content scaffold-create" role="main">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <g:hasErrors bean="${applicationInstance}">
                                    <ul class="errors" role="alert">
                                        <g:eachError bean="${applicationInstance}" var="error">
                                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                            </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form action="save" >
                                    <fieldset class="form">
                                        <div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'arrivalDate', 'error')} ">
                                            <label>Fecha de Llegada</label>
                                            <span class="field"><input id="datepicker" type="text" name="arrivalDate" class="input-small" required/></span>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'identifier', 'error')} ">
                                            <label for="identifier">
                                                <g:message code="application.identifier.label" default="Identificador" />

                                            </label>
                                            <input name="identifier" value="${applicationInstance?.identifier}" required/>
                                        </div> </br>
                                        <div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'applicationType', 'error')} ">
                                            <label for="applicationType">
                                                <g:message code="application.identifier.label" default="Tipo de Aplicación" />

                                            </label>
                                            <g:select name="applicationType" from="${['Balance Clásico', 'Balance Plus']}"/>
                                        </div>

                                        <g:hiddenField name="vacutainer.id" value="${applicationInstance?.vacutainer?.id}"/>

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

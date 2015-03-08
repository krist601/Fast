<%@ page import="fastchacaito.ApplicationControl" %>
<%@ page import="fastchacaito.Balance" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'applicationControl.label', default: 'ApplicationControl')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/ApplicationControl/List')}">Control de Aplicaciones</a> <span class="separator"></span></li>
            <li>Crear Nuevo Control de Aplicaciones</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Crear Control de Aplicaciones</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="save" method="post" data-toggle="validator">

                            <div id="create-applicationControl" class="content scaffold-create" role="main">

                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <g:hasErrors bean="${applicationControlInstance}">
                                    <ul class="errors" role="alert">
                                        <g:eachError bean="${applicationControlInstance}" var="error">
                                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                            </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form action="save" >
                                    <fieldset class="form">
                                        <div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'currentWeight', 'error')} required">
                                            <label for="currentWeight">
                                                <g:message code="applicationControl.currentWeight.label" default="Peso Actual" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                                <input type="number" name="currentWeight" step="any" required/>
                                        </div><br>

                                        <g:if test="${ApplicationControl.getLastWeight(params.foo)}">

                                            <div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'wasApplied', 'error')} ">
                                                <label for="wasApplied">
                                                    <g:message code="applicationControl.wasApplied.label" default="Fue Aplicada?" />

                                                </label>
                                                <g:checkBox name="wasApplied" value="${applicationControlInstance?.wasApplied}" onClick="showHideForm(this,'applicationall')"/> <a style="color: red;">No debe aplicarse si el paciente tiene <g:if test="${Balance.get(params.foo).type.equals("Balance Plus")}">${ApplicationControl.getLastWeight(params.foo)-0.5}</g:if><g:else>${ApplicationControl.getLastWeight(params.foo)-0.3}</g:else> Kg o más</a>

                                            </div><br>
                                            <div id="applicationall" style="display:none" class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'application', 'error')} required">
                                                <label for="application">
                                                    <g:message code="applicationControl.application.label" default="Aplicación" />
                                                    <span class="required-indicator">*</span>
                                                </label>
                                                <g:select id="application" name="application.id" noSelection="${['null':'Selecione una Aplicación']}" from="${fastchacaito.Application.avaliableApplications(Balance.get(params.foo).type)}" optionKey="id" required="" value="${applicationControlInstance?.application?.id}" class="many-to-one"/>
                                            </div>

                                        </g:if>
                                        <div class="fieldcontain ${hasErrors(bean: applicationControlInstance, field: 'observation', 'error')} ">
                                            <label for="observation">
                                                <g:message code="applicationControl.observation.label" default="Observación" />

                                            </label>
                                            <g:textArea style="width: 60%;" name="observation" value="${applicationControlInstance?.observation}"/>
                                        </div>


                                        <g:hiddenField name="balance.id" value="${applicationControlInstance?.balance?.id}"/>

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
        <script>
            function showHideForm(box, id) {
            var elm = document.getElementById(id);
            if(box.checked){
            elm.style.display = "";
            } else {
            elm.style.display = "none";
            }
            }
        </script>
    </body>
</html>

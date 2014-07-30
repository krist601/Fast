
<%@ page import="fastchacaito.Mesotherapy" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'mesotherapy.label', default: 'Mesotherapy')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Mesotherapy/List')}">Mesoterapia</a> <span class="separator"></span></li>
            <li>Mostrar Mesoterapia</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Mesoterapia: ${mesotherapyInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-mesotherapy" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list mesotherapy">

                                <g:if test="${mesotherapyInstance?.method}">
                                    <li class="fieldcontain">
                                        <span id="method-label" class="property-label"><g:message code="mesotherapy.method.label" default="Method" /></span>

                                        <span class="property-value" aria-labelledby="method-label"><g:fieldValue bean="${mesotherapyInstance}" field="method"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${mesotherapyInstance?.ploblemCauses}">
                                    <li class="fieldcontain">
                                        <span id="ploblemCauses-label" class="property-label"><g:message code="mesotherapy.ploblemCauses.label" default="Ploblem Causes" /></span>

                                        <span class="property-value" aria-labelledby="ploblemCauses-label"><g:fieldValue bean="${mesotherapyInstance}" field="ploblemCauses"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${mesotherapyInstance?.previousAttempts}">
                                    <li class="fieldcontain">
                                        <span id="previousAttempts-label" class="property-label"><g:message code="mesotherapy.previousAttempts.label" default="Previous Attempts" /></span>

                                        <span class="property-value" aria-labelledby="previousAttempts-label"><g:fieldValue bean="${mesotherapyInstance}" field="previousAttempts"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${mesotherapyInstance?.sesionControl}">
                                    <li class="fieldcontain">
                                        <span id="sesionControl-label" class="property-label"><g:message code="mesotherapy.sesionControl.label" default="Sesion Control" /></span>

                                        <span class="property-value" aria-labelledby="sesionControl-label"><g:link controller="sesionControl" action="show" id="${mesotherapyInstance?.sesionControl?.id}">${mesotherapyInstance?.sesionControl?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${mesotherapyInstance?.treatAreas}">
                                    <li class="fieldcontain">
                                        <span id="treatAreas-label" class="property-label"><g:message code="mesotherapy.treatAreas.label" default="Treat Areas" /></span>

                                        <span class="property-value" aria-labelledby="treatAreas-label"><g:fieldValue bean="${mesotherapyInstance}" field="treatAreas"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${mesotherapyInstance?.treatment}">
                                    <li class="fieldcontain">
                                        <span id="treatment-label" class="property-label"><g:message code="mesotherapy.treatment.label" default="Treatment" /></span>

                                        <span class="property-value" aria-labelledby="treatment-label"><g:link controller="treatment" action="show" id="${mesotherapyInstance?.treatment?.id}">${mesotherapyInstance?.treatment?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${mesotherapyInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${mesotherapyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

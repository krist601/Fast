
<%@ page import="fastchacaito.ApplicationControl" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'applicationControl.label', default: 'ApplicationControl')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Vacutainer/List')}">Control de Aplicaciones</a> <span class="separator"></span></li>
            <li>Mostrar Control de Aplicaciones</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Control de Aplicaciones: ${applicationControlInstance?.identifierNumber}</h4>
                    <div class="widgetcontent">
                        <div id="show-applicationControl" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list applicationControl">

                                <g:if test="${applicationControlInstance?.application}">
                                    <li class="fieldcontain">
                                        <span id="application-label" class="property-label"><g:message code="applicationControl.application.label" default="Application" /></span>

                                        <span class="property-value" aria-labelledby="application-label"><g:link controller="application" action="show" id="${applicationControlInstance?.application?.id}">${applicationControlInstance?.application?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${applicationControlInstance?.balance}">
                                    <li class="fieldcontain">
                                        <span id="balance-label" class="property-label"><g:message code="applicationControl.balance.label" default="Balance" /></span>

                                        <span class="property-value" aria-labelledby="balance-label"><g:link controller="balance" action="show" id="${applicationControlInstance?.balance?.id}">${applicationControlInstance?.balance?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${applicationControlInstance?.currentWeight}">
                                    <li class="fieldcontain">
                                        <span id="currentWeight-label" class="property-label"><g:message code="applicationControl.currentWeight.label" default="Current Weight" /></span>

                                        <span class="property-value" aria-labelledby="currentWeight-label"><g:fieldValue bean="${applicationControlInstance}" field="currentWeight"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${applicationControlInstance?.date}">
                                    <li class="fieldcontain">
                                        <span id="date-label" class="property-label"><g:message code="applicationControl.date.label" default="Date" /></span>

                                        <span class="property-value" aria-labelledby="date-label"><g:link controller="date" action="show" id="${applicationControlInstance?.date?.id}">${applicationControlInstance?.date?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${applicationControlInstance?.differenceWeight}">
                                    <li class="fieldcontain">
                                        <span id="differenceWeight-label" class="property-label"><g:message code="applicationControl.differenceWeight.label" default="Difference Weight" /></span>

                                        <span class="property-value" aria-labelledby="differenceWeight-label"><g:fieldValue bean="${applicationControlInstance}" field="differenceWeight"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${applicationControlInstance?.identifierNumber}">
                                    <li class="fieldcontain">
                                        <span id="identifierNumber-label" class="property-label"><g:message code="applicationControl.identifierNumber.label" default="Identifier Number" /></span>

                                        <span class="property-value" aria-labelledby="identifierNumber-label"><g:fieldValue bean="${applicationControlInstance}" field="identifierNumber"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${applicationControlInstance?.nControl}">
                                    <li class="fieldcontain">
                                        <span id="nControl-label" class="property-label"><g:message code="applicationControl.nControl.label" default="NC ontrol" /></span>

                                        <span class="property-value" aria-labelledby="nControl-label"><g:fieldValue bean="${applicationControlInstance}" field="nControl"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${applicationControlInstance?.observation}">
                                    <li class="fieldcontain">
                                        <span id="observation-label" class="property-label"><g:message code="applicationControl.observation.label" default="Observation" /></span>

                                        <span class="property-value" aria-labelledby="observation-label"><g:fieldValue bean="${applicationControlInstance}" field="observation"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${applicationControlInstance?.reachedWeight}">
                                    <li class="fieldcontain">
                                        <span id="reachedWeight-label" class="property-label"><g:message code="applicationControl.reachedWeight.label" default="Reached Weight" /></span>

                                        <span class="property-value" aria-labelledby="reachedWeight-label"><g:fieldValue bean="${applicationControlInstance}" field="reachedWeight"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${applicationControlInstance?.wasApplied}">
                                    <li class="fieldcontain">
                                        <span id="wasApplied-label" class="property-label"><g:message code="applicationControl.wasApplied.label" default="Was Applied" /></span>

                                        <span class="property-value" aria-labelledby="wasApplied-label"><g:formatBoolean boolean="${applicationControlInstance?.wasApplied}" /></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${applicationControlInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${applicationControlInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

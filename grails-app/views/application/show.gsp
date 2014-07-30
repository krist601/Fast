
<%@ page import="fastchacaito.Application" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Application/List')}">Aplicación</a> <span class="separator"></span></li>
            <li>Mostrar Aplicación</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Aplicación: ${applicationInstance?.identifier}</h4>
                    <div class="widgetcontent">
                                <div id="show-application" class="content scaffold-show" role="main">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <ol class="property-list application">

                                    <g:if test="${applicationInstance?.arrivalDate}">
                                        <li class="fieldcontain">
                                            <span id="arrivalDate-label" class="property-label"><g:message code="application.arrivalDate.label" default="Arrival Date" /></span>

                                            <span class="property-value" aria-labelledby="arrivalDate-label"><g:fieldValue bean="${applicationInstance}" field="arrivalDate"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${applicationInstance?.identifier}">
                                        <li class="fieldcontain">
                                            <span id="identifier-label" class="property-label"><g:message code="application.identifier.label" default="Identifier" /></span>

                                            <span class="property-value" aria-labelledby="identifier-label"><g:fieldValue bean="${applicationInstance}" field="identifier"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${applicationInstance?.lostDate}">
                                        <li class="fieldcontain">
                                            <span id="lostDate-label" class="property-label"><g:message code="application.lostDate.label" default="Lost Date" /></span>

                                            <span class="property-value" aria-labelledby="lostDate-label"><g:fieldValue bean="${applicationInstance}" field="lostDate"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${applicationInstance?.vacutainer}">
                                        <li class="fieldcontain">
                                            <span id="vacutainer-label" class="property-label"><g:message code="application.vacutainer.label" default="Vacutainer" /></span>

                                            <span class="property-value" aria-labelledby="vacutainer-label"><g:link controller="vacutainer" action="show" id="${applicationInstance?.vacutainer?.id}">${applicationInstance?.vacutainer?.encodeAsHTML()}</g:link></span>

                                        </li>
                                    </g:if>

                                </ol>
                                <g:form>
                                    <fieldset class="buttons">
                                        <g:hiddenField name="id" value="${applicationInstance?.id}" />
                                        <g:link class="btn btn-primary" action="edit" id="${applicationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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


<%@ page import="fastchacaito.Vacutainer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'vacutainer.label', default: 'Vacutainer')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Vacutainer/List')}">Vacutainer</a> <span class="separator"></span></li>
            <li>Mostrar Vacutainer</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Vacutainer: ${vacutainerInstance?.id}</h4>
                    <div class="widgetcontent">
                            
                                <div id="show-vacutainer" class="content scaffold-show" role="main">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <ol class="property-list vacutainer">

                                    <g:if test="${vacutainerInstance?.arrivalDate}">
                                        <li class="fieldcontain">
                                            <span id="arrivalDate-label" class="property-label"><g:message code="vacutainer.arrivalDate.label" default="Arrival Date" /></span>

                                            <span class="property-value" aria-labelledby="arrivalDate-label"><g:fieldValue bean="${vacutainerInstance}" field="arrivalDate"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vacutainerInstance?.identifier}">
                                        <li class="fieldcontain">
                                            <span id="identifier-label" class="property-label"><g:message code="vacutainer.identifier.label" default="Identifier" /></span>

                                            <span class="property-value" aria-labelledby="identifier-label"><g:fieldValue bean="${vacutainerInstance}" field="identifier"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vacutainerInstance?.lostDate}">
                                        <li class="fieldcontain">
                                            <span id="lostDate-label" class="property-label"><g:message code="vacutainer.lostDate.label" default="Lost Date" /></span>

                                            <span class="property-value" aria-labelledby="lostDate-label"><g:fieldValue bean="${vacutainerInstance}" field="lostDate"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vacutainerInstance?.vacutainerType}">
                                        <li class="fieldcontain">
                                            <span id="vacutainerType-label" class="property-label"><g:message code="vacutainer.vacutainerType.label" default="Vacutainer Type" /></span>

                                            <span class="property-value" aria-labelledby="vacutainerType-label"><g:fieldValue bean="${vacutainerInstance}" field="vacutainerType"/></span>

                                        </li>
                                    </g:if>

                                </ol>
                                <g:form>
                                    <fieldset class="buttons">
                                        <g:hiddenField name="id" value="${vacutainerInstance?.id}" />
                                        <g:link class="btn btn-primary" action="edit" id="${vacutainerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

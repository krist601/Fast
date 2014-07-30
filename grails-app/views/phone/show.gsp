
<%@ page import="fastchacaito.Phone" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'phone.label', default: 'Phone')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Phone/List')}">Teléfono</a> <span class="separator"></span></li>
            <li>Mostrar Teléfono</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Teléfono: ${phoneInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-phone" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list phone">

                                <g:if test="${phoneInstance?.areaCode}">
                                    <li class="fieldcontain">
                                        <span id="areaCode-label" class="property-label"><g:message code="phone.areaCode.label" default="Area Code" /></span>

                                        <span class="property-value" aria-labelledby="areaCode-label"><g:fieldValue bean="${phoneInstance}" field="areaCode"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${phoneInstance?.patient}">
                                    <li class="fieldcontain">
                                        <span id="patient-label" class="property-label"><g:message code="phone.patient.label" default="Patient" /></span>

                                        <span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${phoneInstance?.patient?.id}">${phoneInstance?.patient?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${phoneInstance?.phoneNumber}">
                                    <li class="fieldcontain">
                                        <span id="phoneNumber-label" class="property-label"><g:message code="phone.phoneNumber.label" default="Phone Number" /></span>

                                        <span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${phoneInstance}" field="phoneNumber"/></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${phoneInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${phoneInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

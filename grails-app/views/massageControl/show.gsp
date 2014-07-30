
<%@ page import="fastchacaito.MassageControl" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'massageControl.label', default: 'MassageControl')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/MassageControl/List')}">Control de Masajes</a> <span class="separator"></span></li>
            <li>Mostrar Control de Masajes</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Control de Masajes: ${massageControlInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-massageControl" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list massageControl">

                                <g:if test="${massageControlInstance?.bodyTherapy}">
                                    <li class="fieldcontain">
                                        <span id="bodyTherapy-label" class="property-label"><g:message code="massageControl.bodyTherapy.label" default="Body Therapy" /></span>

                                        <span class="property-value" aria-labelledby="bodyTherapy-label"><g:link controller="bodyTherapy" action="show" id="${massageControlInstance?.bodyTherapy?.id}">${massageControlInstance?.bodyTherapy?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${massageControlInstance?.massageDate}">
                                    <li class="fieldcontain">
                                        <span id="massageDate-label" class="property-label"><g:message code="massageControl.massageDate.label" default="Massage Date" /></span>

                                        <span class="property-value" aria-labelledby="massageDate-label"><g:link controller="date" action="show" id="${massageControlInstance?.massageDate?.id}">${massageControlInstance?.massageDate?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${massageControlInstance?.massageNumber}">
                                    <li class="fieldcontain">
                                        <span id="massageNumber-label" class="property-label"><g:message code="massageControl.massageNumber.label" default="Massage Number" /></span>

                                        <span class="property-value" aria-labelledby="massageNumber-label"><g:fieldValue bean="${massageControlInstance}" field="massageNumber"/></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${massageControlInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${massageControlInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

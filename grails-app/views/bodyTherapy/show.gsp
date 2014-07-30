
<%@ page import="fastchacaito.BodyTherapy" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'bodyTherapy.label', default: 'BodyTherapy')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/BodyTherapy/List')}">Terapia Corporal</a> <span class="separator"></span></li>
            <li>Mostrar Terapia Corporal</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Terapia Corporal: ${bodyTherapyInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-bodyTherapy" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list bodyTherapy">

                                <g:if test="${bodyTherapyInstance?.massageType}">
                                    <li class="fieldcontain">
                                        <span id="massageType-label" class="property-label"><g:message code="bodyTherapy.massageType.label" default="Massage Type" /></span>

                                        <span class="property-value" aria-labelledby="massageType-label"><g:fieldValue bean="${bodyTherapyInstance}" field="massageType"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${bodyTherapyInstance?.treatment}">
                                    <li class="fieldcontain">
                                        <span id="treatment-label" class="property-label"><g:message code="bodyTherapy.treatment.label" default="Treatment" /></span>

                                        <span class="property-value" aria-labelledby="treatment-label"><g:link controller="treatment" action="show" id="${bodyTherapyInstance?.treatment?.id}">${bodyTherapyInstance?.treatment?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${bodyTherapyInstance?.id}" />
                                    <g:link class="edit" action="edit" id="${bodyTherapyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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

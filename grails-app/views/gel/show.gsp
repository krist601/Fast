
<%@ page import="fastchacaito.Gel" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'gel.label', default: 'Gel')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Gel/List')}">Gel</a> <span class="separator"></span></li>
            <li>Mostrar Gel</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Gel: ${gelInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-gel" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list gel">

                                <g:if test="${gelInstance?.closure}">
                                    <li class="fieldcontain">
                                        <span id="closure-label" class="property-label"><g:message code="gel.closure.label" default="Closure" /></span>

                                        <span class="property-value" aria-labelledby="closure-label"><g:link controller="closure" action="show" id="${gelInstance?.closure?.id}">${gelInstance?.closure?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${gelInstance?.outType}">
                                    <li class="fieldcontain">
                                        <span id="outType-label" class="property-label"><g:message code="gel.outType.label" default="Out Type" /></span>

                                        <span class="property-value" aria-labelledby="outType-label"><g:fieldValue bean="${gelInstance}" field="outType"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${gelInstance?.receivedDate}">
                                    <li class="fieldcontain">
                                        <span id="receivedDate-label" class="property-label"><g:message code="gel.receivedDate.label" default="Received Date" /></span>

                                        <span class="property-value" aria-labelledby="receivedDate-label"><g:link controller="date" action="show" id="${gelInstance?.receivedDate?.id}">${gelInstance?.receivedDate?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${gelInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${gelInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

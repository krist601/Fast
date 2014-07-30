
<%@ page import="fastchacaito.Machine" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'machine.label', default: 'Machine')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Machine/List')}">Máquina</a> <span class="separator"></span></li>
            <li>Mostrar Máquina</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Máquina: ${machineInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-machine" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list machine">

                                <g:if test="${machineInstance?.machineType}">
                                    <li class="fieldcontain">
                                        <span id="machineType-label" class="property-label"><g:message code="machine.machineType.label" default="Machine Type" /></span>

                                        <span class="property-value" aria-labelledby="machineType-label"><g:fieldValue bean="${machineInstance}" field="machineType"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${machineInstance?.treatment}">
                                    <li class="fieldcontain">
                                        <span id="treatment-label" class="property-label"><g:message code="machine.treatment.label" default="Treatment" /></span>

                                        <span class="property-value" aria-labelledby="treatment-label"><g:link controller="treatment" action="show" id="${machineInstance?.treatment?.id}">${machineInstance?.treatment?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${machineInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${machineInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

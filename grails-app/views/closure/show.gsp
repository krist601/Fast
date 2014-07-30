
<%@ page import="fastchacaito.Closure" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'closure.label', default: 'Closure')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Closure/List')}">Cierre</a> <span class="separator"></span></li>
            <li>Mostrar Cierre</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Cierre: ${closureInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-closure" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list closure">

                                <g:if test="${closureInstance?.closureDate}">
                                    <li class="fieldcontain">
                                        <span id="closureDate-label" class="property-label"><g:message code="closure.closureDate.label" default="Closure Date" /></span>

                                        <span class="property-value" aria-labelledby="closureDate-label"><g:link controller="date" action="show" id="${closureInstance?.closureDate?.id}">${closureInstance?.closureDate?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${closureInstance?.reportX}">
                                    <li class="fieldcontain">
                                        <span id="reportX-label" class="property-label"><g:message code="closure.reportX.label" default="Report X" /></span>

                                        <span class="property-value" aria-labelledby="reportX-label"><g:fieldValue bean="${closureInstance}" field="reportX"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${closureInstance?.reportZ}">
                                    <li class="fieldcontain">
                                        <span id="reportZ-label" class="property-label"><g:message code="closure.reportZ.label" default="Report Z" /></span>

                                        <span class="property-value" aria-labelledby="reportZ-label"><g:fieldValue bean="${closureInstance}" field="reportZ"/></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${closureInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${closureInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

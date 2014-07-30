
<%@ page import="fastchacaito.Balance" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'balance.label', default: 'Balance')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Vacutainer/List')}">Balance</a> <span class="separator"></span></li>
            <li>Mostrar Balance</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Balance: ${balanceInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-balance" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list balance">

                                <g:if test="${balanceInstance?.applicationAmount}">
                                    <li class="fieldcontain">
                                        <span id="applicationAmount-label" class="property-label"><g:message code="balance.applicationAmount.label" default="Application Amount" /></span>

                                        <span class="property-value" aria-labelledby="applicationAmount-label"><g:fieldValue bean="${balanceInstance}" field="applicationAmount"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${balanceInstance?.idealWeight}">
                                    <li class="fieldcontain">
                                        <span id="idealWeight-label" class="property-label"><g:message code="balance.idealWeight.label" default="Ideal Weight" /></span>

                                        <span class="property-value" aria-labelledby="idealWeight-label"><g:fieldValue bean="${balanceInstance}" field="idealWeight"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${balanceInstance?.treatment}">
                                    <li class="fieldcontain">
                                        <span id="treatment-label" class="property-label"><g:message code="balance.treatment.label" default="Treatment" /></span>

                                        <span class="property-value" aria-labelledby="treatment-label"><g:link controller="treatment" action="show" id="${balanceInstance?.treatment?.id}">${balanceInstance?.treatment?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${balanceInstance?.type}">
                                    <li class="fieldcontain">
                                        <span id="type-label" class="property-label"><g:message code="balance.type.label" default="Type" /></span>

                                        <span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${balanceInstance}" field="type"/></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${balanceInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${balanceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
                        </div>
                    </div><!--widgetcontent-->
                </div><!--widget-->

                <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2014. Kristian Cortés. Todos los derechos reservados.</span>
                    </div>
                    <div class="footer-right">
                        <span>Diseñado por: <a href="http://themepixels.com/">Kristian Cortés</a></span>
                    </div>
                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->
    </body>
</html>

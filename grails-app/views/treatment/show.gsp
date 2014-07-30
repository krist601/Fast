
<%@ page import="fastchacaito.Treatment" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'treatment.label', default: 'Treatment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Treatment/List')}">Tratamiento</a> <span class="separator"></span></li>
            <li>Mostrar Tratamiento</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Tratamiento: ${treatmentInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-treatment" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list treatment">

                                <g:if test="${treatmentInstance?.beginDate}">
                                    <li class="fieldcontain">
                                        <span id="beginDate-label" class="property-label"><g:message code="treatment.beginDate.label" default="Begin Date" /></span>

                                        <span class="property-value" aria-labelledby="beginDate-label"><g:link controller="date" action="show" id="${treatmentInstance?.beginDate?.id}">${treatmentInstance?.beginDate?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${treatmentInstance?.date}">
                                    <li class="fieldcontain">
                                        <span id="date-label" class="property-label"><g:message code="treatment.date.label" default="Date" /></span>

                                        <span class="property-value" aria-labelledby="date-label"><g:link controller="date" action="show" id="${treatmentInstance?.date?.id}">${treatmentInstance?.date?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${treatmentInstance?.endDate}">
                                    <li class="fieldcontain">
                                        <span id="endDate-label" class="property-label"><g:message code="treatment.endDate.label" default="End Date" /></span>

                                        <span class="property-value" aria-labelledby="endDate-label"><g:link controller="date" action="show" id="${treatmentInstance?.endDate?.id}">${treatmentInstance?.endDate?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${treatmentInstance?.packages}">
                                    <li class="fieldcontain">
                                        <span id="packages-label" class="property-label"><g:message code="treatment.packages.label" default="Packages" /></span>

                                        <span class="property-value" aria-labelledby="packages-label"><g:link controller="package" action="show" id="${treatmentInstance?.packages?.id}">${treatmentInstance?.packages?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${treatmentInstance?.paymentMethod}">
                                    <li class="fieldcontain">
                                        <span id="paymentMethod-label" class="property-label"><g:message code="treatment.paymentMethod.label" default="Payment Method" /></span>

                                        <span class="property-value" aria-labelledby="paymentMethod-label"><g:link controller="paymentMethod" action="show" id="${treatmentInstance?.paymentMethod?.id}">${treatmentInstance?.paymentMethod?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${treatmentInstance?.totalPrice}">
                                    <li class="fieldcontain">
                                        <span id="totalPrice-label" class="property-label"><g:message code="treatment.totalPrice.label" default="Total Price" /></span>

                                        <span class="property-value" aria-labelledby="totalPrice-label"><g:link controller="date" action="show" id="${treatmentInstance?.totalPrice?.id}">${treatmentInstance?.totalPrice?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${treatmentInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${treatmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

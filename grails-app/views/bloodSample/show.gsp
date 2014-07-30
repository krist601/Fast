
<%@ page import="fastchacaito.BloodSample" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'bloodSample.label', default: 'BloodSample')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/BloodSample/List')}">Muestra de Sangre</a> <span class="separator"></span></li>
            <li>Mostrar Muestra de Sangre</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Muestra de Sangre: ${bloodSampleInstance?.patient}</h4>
                    <div class="widgetcontent">
                        <div id="show-bloodSample" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list bloodSample">

                                <g:if test="${bloodSampleInstance?.patient}">
                                    <li class="fieldcontain">
                                        <span id="patient-label" class="property-label"><g:message code="bloodSample.patient.label" default="Patient" /></span>

                                        <span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${bloodSampleInstance?.patient?.id}">${bloodSampleInstance?.patient?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${bloodSampleInstance?.receiptData}">
                                    <li class="fieldcontain">
                                        <span id="receiptData-label" class="property-label"><g:message code="bloodSample.receiptData.label" default="Receipt Data" /></span>

                                        <span class="property-value" aria-labelledby="receiptData-label"><g:link controller="date" action="show" id="${bloodSampleInstance?.receiptData?.id}">${bloodSampleInstance?.receiptData?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${bloodSampleInstance?.receivedDate}">
                                    <li class="fieldcontain">
                                        <span id="receivedDate-label" class="property-label"><g:message code="bloodSample.receivedDate.label" default="Received Date" /></span>

                                        <span class="property-value" aria-labelledby="receivedDate-label"><g:link controller="date" action="show" id="${bloodSampleInstance?.receivedDate?.id}">${bloodSampleInstance?.receivedDate?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${bloodSampleInstance?.shippingDate}">
                                    <li class="fieldcontain">
                                        <span id="shippingDate-label" class="property-label"><g:message code="bloodSample.shippingDate.label" default="Shipping Date" /></span>

                                        <span class="property-value" aria-labelledby="shippingDate-label"><g:link controller="date" action="show" id="${bloodSampleInstance?.shippingDate?.id}">${bloodSampleInstance?.shippingDate?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${bloodSampleInstance?.testType}">
                                    <li class="fieldcontain">
                                        <span id="testType-label" class="property-label"><g:message code="bloodSample.testType.label" default="Test Type" /></span>

                                        <span class="property-value" aria-labelledby="testType-label"><g:fieldValue bean="${bloodSampleInstance}" field="testType"/></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${bloodSampleInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${bloodSampleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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


<%@ page import="fastchacaito.PaymentMethod" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'paymentMethod.label', default: 'PaymentMethod')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/PaymentMethod/List')}">Metodo de Pago</a> <span class="separator"></span></li>
            <li>Mostrar Metodo de Pago</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Metodo de Pago: ${paymentMethodInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-paymentMethod" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list paymentMethod">

                                <g:if test="${paymentMethodInstance?.amount}">
                                    <li class="fieldcontain">
                                        <span id="amount-label" class="property-label"><g:message code="paymentMethod.amount.label" default="Amount" /></span>

                                        <span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${paymentMethodInstance}" field="amount"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${paymentMethodInstance?.bank}">
                                    <li class="fieldcontain">
                                        <span id="bank-label" class="property-label"><g:message code="paymentMethod.bank.label" default="Bank" /></span>

                                        <span class="property-value" aria-labelledby="bank-label"><g:fieldValue bean="${paymentMethodInstance}" field="bank"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${paymentMethodInstance?.paymentMethodType}">
                                    <li class="fieldcontain">
                                        <span id="paymentMethodType-label" class="property-label"><g:message code="paymentMethod.paymentMethodType.label" default="Payment Method Type" /></span>

                                        <span class="property-value" aria-labelledby="paymentMethodType-label"><g:fieldValue bean="${paymentMethodInstance}" field="paymentMethodType"/></span>

                                    </li>
                                </g:if>

                            </ol>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${paymentMethodInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${paymentMethodInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

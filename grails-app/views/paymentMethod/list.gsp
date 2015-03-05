
<%@ page import="fastchacaito.PaymentMethod" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'paymentMethod.label', default: 'PaymentMethod')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Pagos Recibidos</li>
        </ul>
        <div id="list-paymentMethod" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Pagos Recibidos</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="patient.amount.label" default="Fecha de Pago" /></th>
                                <th><g:message code="patient.amount.label" default="Tratamiento" /></th>
                                <th><g:message code="patient.amount.label" default="Paciente" /></th>
                      
                                <th><g:message code="patient.amount.label" default="Monto" /></th>


                                <th><g:message code="patient.paymentMethodType.label" default="Método de Pago" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${paymentMethodInstanceList}" status="i" var="paymentMethodInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${paymentMethodInstance.id}"><g:formatDate date="${paymentMethodInstance.date}" format="dd MMMM yyyy"/></g:link></td>

                                    <td>${paymentMethodInstance.treatment.getType(paymentMethodInstance.treatment.id)}</td>
                                    
                                     <td>${paymentMethodInstance.treatment.patient}</td>
                                     <td>${paymentMethodInstance.amount}</td>

                                    <td>${paymentMethodInstance.paymentMethodType}</td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <div class="footer">
                        <div class="footer-left">
                            <span>&copy; 2014. Fast CA. Todos los derechos reservados.</span>
                        </div>
                        <div class="footer-right">
                            <span>Diseñado por: <a href="http://themepixels.com/">Kristian Cortés</a></span>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>

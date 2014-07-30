
<%@ page import="fastchacaito.Treatment" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'treatment.label', default: 'Treatment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Vacutainers</li>
        </ul>
        <div id="list-treatment" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Tratamiento</h4>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="treatment.beginDate.label" default="Begin Date" /></th>

                                <th><g:message code="treatment.date.label" default="Date" /></th>

                                <th><g:message code="treatment.endDate.label" default="End Date" /></th>

                                <th><g:message code="treatment.packages.label" default="Packages" /></th>

                                <th><g:message code="treatment.paymentMethod.label" default="Payment Method" /></th>

                                <th><g:message code="treatment.totalPrice.label" default="Total Price" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${treatmentInstanceList}" status="i" var="treatmentInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${treatmentInstance.id}">${fieldValue(bean: treatmentInstance, field: "beginDate")}</g:link></td>

                                    <td>${fieldValue(bean: treatmentInstance, field: "date")}</td>

                                    <td>${fieldValue(bean: treatmentInstance, field: "endDate")}</td>

                                    <td>${fieldValue(bean: treatmentInstance, field: "packages")}</td>

                                    <td>${fieldValue(bean: treatmentInstance, field: "paymentMethod")}</td>

                                    <td>${fieldValue(bean: treatmentInstance, field: "totalPrice")}</td>

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
                    </div><!--footer-->
                </div>
            </div>
        </div>
    </body>
</html>

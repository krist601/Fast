
<%@ page import="fastchacaito.MedicHistory" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'medicHistory.label', default: 'MedicHistory')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Historias Médicas</li>
        </ul>
        <div id="list-medicHistory" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Historias Médicas</h4>
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

                                <th><g:message code="medicHistory.date.label" default="Fecha" /></th>

                                <th><g:message code="medicHistory.familyHistory.label" default="Antecedentes Familiares" /></th>

                                <th><g:message code="medicHistory.funtionalTestCardiovascular.label" default="funtionalTestCardiovascular" /></th>

                                <th><g:message code="medicHistory.funtionalTestDigestive.label" default="funtionalTestDigestive" /></th>

                                <th><g:message code="medicHistory.funtionalTestGynecological.label" default="funtionalTestGynecological" /></th>

                                <th><g:message code="medicHistory.funtionalTestMetabolicEndocrine.label" default="funtionalTestMetabolicEndocrine" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${medicHistoryInstanceList}" status="i" var="medicHistoryInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${medicHistoryInstance.id}">${fieldValue(bean: medicHistoryInstance, field: "date")}</g:link></td>

                                    <td>${fieldValue(bean: medicHistoryInstance, field: "familyHistory")}</td>

                                    <td>${fieldValue(bean: medicHistoryInstance, field: "funtionalTestCardiovascular")}</td>

                                    <td>${fieldValue(bean: medicHistoryInstance, field: "funtionalTestDigestive")}</td>

                                    <td>${fieldValue(bean: medicHistoryInstance, field: "funtionalTestGynecological")}</td>

                                    <td>${fieldValue(bean: medicHistoryInstance, field: "funtionalTestMetabolicEndocrine")}</td>

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


<%@ page import="fastchacaito.MeasuresControl" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'measuresControl.label', default: 'MeasuresControl')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Control de Masajes</li>
        </ul>
        <div id="list-measuresControl" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Control de Masajes</h4>
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

                                <th><g:message code="massageControl.bellyAfter.label" default="bellyAfter" /></th>

                                <th><g:message code="massageControl.bellyBefore.label" default="bellyBefore" /></th>

                                <th><g:message code="massageControl.hipAfter.label" default="hipAfter" /></th>

                                <th><g:message code="massageControl.hipBefore.label" default="hipBefore" /></th>

                                <th><g:message code="massageControl.leftCrotchAfter.label" default="leftCrotchAfter" /></th>

                                <th><g:message code="massageControl.leftCrotchBefore.label" default="leftCrotchBefore" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${measuresControlInstanceList}" status="i" var="measuresControlInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${measuresControlInstance.id}">${fieldValue(bean: measuresControlInstance, field: "bellyAfter")}</g:link></td>

                                    <td>${fieldValue(bean: measuresControlInstance, field: "bellyBefore")}</td>

                                    <td>${fieldValue(bean: measuresControlInstance, field: "hipAfter")}</td>

                                    <td>${fieldValue(bean: measuresControlInstance, field: "hipBefore")}</td>

                                    <td>${fieldValue(bean: measuresControlInstance, field: "leftCrotchAfter")}</td>

                                    <td>${fieldValue(bean: measuresControlInstance, field: "leftCrotchBefore")}</td>

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

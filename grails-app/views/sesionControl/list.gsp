
<%@ page import="fastchacaito.SesionControl" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'sesionControl.label', default: 'SesionControl')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Control de Sesion</li>
        </ul>
        <div id="list-sesionControl" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Control de Sesion</h4>
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

                                <th><g:message code="sesionControl.abdomen.label" default="abdomen" /></th>

                                <th><g:message code="sesionControl.achieved.label" default="achieved" /></th>

                                <th><g:message code="sesionControl.hips.label" default="hips" /></th>

                                <th><g:message code="sesionControl.leftArm.label" default="leftArm" /></th>

                                <th><g:message code="sesionControl.leftCrotch.label" default="leftCrotch" /></th>

                                <th><g:message code="sesionControl.leftThigh.label" default="leftThigh" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${sesionControlInstanceList}" status="i" var="sesionControlInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${sesionControlInstance.id}">${fieldValue(bean: sesionControlInstance, field: "abdomen")}</g:link></td>

                                    <td><g:formatBoolean boolean="${sesionControlInstance.achieved}" /></td>

                                    <td><g:formatBoolean boolean="${sesionControlInstance.hips}" /></td>

                                    <td><g:formatBoolean boolean="${sesionControlInstance.leftArm}" /></td>

                                    <td><g:formatBoolean boolean="${sesionControlInstance.leftCrotch}" /></td>

                                    <td><g:formatBoolean boolean="${sesionControlInstance.leftThigh}" /></td>

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

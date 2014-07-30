
<%@ page import="fastchacaito.Machine" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'machine.label', default: 'Machine')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Maquina</li>
        </ul>
        <div id="list-machine" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Maquina</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="machine.machineType.label" default="Tipo de Maquina" /></th>

                                <th><g:message code="machine.treatment.label" default="Tratamiento" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${machineInstanceList}" status="i" var="machineInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${machineInstance.id}">${fieldValue(bean: machineInstance, field: "machineType")}</g:link></td>

                                    <td>${fieldValue(bean: machineInstance, field: "treatment")}</td>

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

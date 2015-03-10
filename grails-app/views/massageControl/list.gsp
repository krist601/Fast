
<%@ page import="fastchacaito.MassageControl" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'massageControl.label', default: 'MassageControl')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Control de Masajes</li>
        </ul>
        <div id="list-massageControl" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Control de Masajes</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="massageControl.bodyTherapy.label" default="Terapia Corporal" /></th>

                                <th><g:message code="massageControl.massageDate.label" default="Fecha del Masaje" /></th>

                                <th><g:message code="massageControl.massageNumber.label" default="Número de Masaje" /></th> 

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${massageControlInstanceList}" status="i" var="massageControlInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${massageControlInstance.id}">${fieldValue(bean: massageControlInstance, field: "bodyTherapy")}</g:link></td>

                                    <td>${fieldValue(bean: massageControlInstance, field: "massageDate")}</td>

                                    <td>${fieldValue(bean: massageControlInstance, field: "massageNumber")}</td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <fieldset class="buttons">
                        <a class="btn btn-primary" href="${createLink(controller:'massageControl', action:'create')}">
                            Crear
                        </a>
                    </fieldset>
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

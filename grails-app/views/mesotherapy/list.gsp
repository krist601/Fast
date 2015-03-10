
<%@ page import="fastchacaito.Mesotherapy" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'mesotherapy.label', default: 'Mesotherapy')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Mesoterapias</li>
        </ul>
        <div id="list-mesotherapy" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Mesoterapias</h4>
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

                                <th><g:message code="mesotherapy.method.label" default="Metodo" /></th>

                                <th><g:message code="mesotherapy.ploblemCauses.label" default="Causas del Problema" /></th>

                                <th><g:message code="mesotherapy.previousAttempts.label" default="previousAttempts" /></th>

                                <th><g:message code="mesotherapy.sesionControl.label" default="Control de Sesion" /></th>

                                <th><g:message code="mesotherapy.treatAreas.label" default="Areas a Tratar" /></th>

                                <th><g:message code="mesotherapy.treatment.label" default="Tratamiento" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${mesotherapyInstanceList}" status="i" var="mesotherapyInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${mesotherapyInstance.id}">${fieldValue(bean: mesotherapyInstance, field: "method")}</g:link></td>

                                    <td>${fieldValue(bean: mesotherapyInstance, field: "ploblemCauses")}</td>

                                    <td>${fieldValue(bean: mesotherapyInstance, field: "previousAttempts")}</td>

                                    <td>${fieldValue(bean: mesotherapyInstance, field: "sesionControl")}</td>

                                    <td>${fieldValue(bean: mesotherapyInstance, field: "treatAreas")}</td>

                                    <td>${fieldValue(bean: mesotherapyInstance, field: "treatment")}</td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                      <fieldset class="buttons">
                        <a class="btn btn-primary" href="${createLink(controller:'mesotherapy', action:'create')}">
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


<%@ page import="fastchacaito.BodyTherapy" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'bodyTherapy.label', default: 'BodyTherapy')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Terapias Corporales</li>
        </ul>
        <div id="list-bodyTherapy" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Terapias Corporales</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="bodyTherapy.massageType.label" default="Tipo de Masaje" /></th>

                                <th><g:message code="bodyTherapy.treatment.label" default="Tratamiento" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${bodyTherapyInstanceList}" status="i" var="bodyTherapyInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${bodyTherapyInstance.id}">${fieldValue(bean: bodyTherapyInstance, field: "massageType")}</g:link></td>

                                    <td>${fieldValue(bean: bodyTherapyInstance, field: "treatment")}</td>

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

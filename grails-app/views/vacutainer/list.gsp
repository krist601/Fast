
<%@ page import="fastchacaito.Vacutainer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'vacutainer.label', default: 'Vacutainer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Vacutainers</li>
        </ul>
        <div id="list-vacutainer" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Vacutainers</h4>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="vacutainer.identifier.label" default="Identificador" /></th>

                                <th><g:message code="vacutainer.arrivalDate.label" default="Fecha de Llegada" /></th>

                                <th><g:message code="vacutainer.vacutainerType.label" default="Tipo de Vacutainer" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${vacutainerInstanceList}" status="i" var="vacutainerInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${vacutainerInstance.id}">${fieldValue(bean: vacutainerInstance, field: "identifier")}</g:link></td>

                                    <td><g:formatDate format="dd MMMM yyyy" date="${vacutainerInstance?.arrivalDate}"/></td>

                                    <td>${fieldValue(bean: vacutainerInstance, field: "vacutainerType")}</td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                      <fieldset class="buttons">
                        <a class="btn btn-primary" href="${createLink(controller:'vacutainer', action:'create')}">
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
                    </div><!--footer-->
                </div>
            </div>
        </div>
    </body>
</html>


<%@ page import="fastchacaito.Vacutainer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'vacutainer.label', default: 'Vacutainer')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Vacutainer/List')}">Vacutainer</a> <span class="separator"></span></li>
            <li>Mostrar Vacutainer</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Vacutainer ${vacutainerInstance?.identifier} <g:if test="${vacutainerInstance?.lostDate}"><t style="font-size: 30px; color: yellow;">(Perdido)</t></g:if></h4>
                    <div class="widgetcontent">
                        <table class="table table-bordered table-invoice">
                            <tr>
                                <td class="width30">Identificador</td>
                                <td class="width70">${vacutainerInstance?.identifier}</td>
                            </tr>
                            <tr>
                                <td>Fecha de llegada</td>
                                <td><g:formatDate format="dd MMMM yyyy" date="${vacutainerInstance?.arrivalDate}"/></td>
                            </tr>
                            <g:if test="${vacutainerInstance?.lostDate}">
                                <tr>
                                    <td>Fecha de Perdida</td>
                                    <td><g:formatDate format="dd MMMM yyyy" date="${vacutainerInstance?.lostDate}"/></td>
                                </tr>
                            </g:if>
                            <tr>
                                <td>Tipo de Vacutainer</td>
                                <td>${vacutainerInstance?.vacutainerType}</td>
                            </tr>

                        </table>

                        <div id="show-vacutainer" class="content scaffold-show" role="main">

                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${vacutainerInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${vacutainerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:if test="${!vacutainerInstance?.lostDate}">
                                    <g:link class="btn btn-primary" action="editLostDate" id="${vacutainerInstance?.id}"><g:message code="Perdida" default="Perdida" /></g:link>
                                    </g:if>
                                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
                        </div>
                        <br>
                        <g:if test="${!vacutainerInstance?.vacutainerType.equals("Mesoterapia")}">
                        <h2 class="widgettitle" style="font-size: 20px;">Aplicaciones del Vacutainer ${vacutainerInstance?.identifier}</h2>
                        <table class="table table-bordered table-infinite" id="dyntable2">
                            <colgroup>
                                <col class="con0" />
                                <col class="con1" />
                                <col class="con0" />
                                <col class="con1" />
                            </colgroup>
                            <thead>
                                <tr>

                                    <th><g:message code="application.vacutainer.label" default="Vacutainer" /></th>
                                    <th><g:message code="application.identifier.label" default="Identificador" /></th>
                                    <th><g:message code="application.arrivalDate.label" default="Fecha de Llegada" /></th>

                                    <th><g:message code="application.applicationType.label" default="Tipo de Aplicación" /></th>

                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${vacutainerInstance?.application}" status="i" var="applicationInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                        <td>${fieldValue(bean: applicationInstance, field: "vacutainer")}</td>

                                        <td><g:link action="show" controller="application" id="${applicationInstance.id}">${fieldValue(bean: applicationInstance, field: "identifier")}</g:link></td>

                                        <td><g:formatDate format="dd MMMM yyyy" date="${applicationInstance?.arrivalDate}"/></td>

                                        <td>${fieldValue(bean: applicationInstance, field: "applicationType")}</td>

                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <br>
                        <a class="btn btn-primary" href="${createLink(controller:'application', action:'create', params:[foo:vacutainerInstance?.id])}" style="color: white; text-align: center;">Agregar nueva Applicación</a>
</g:if>
                    </div><!--widgetcontent-->
                </div><!--widget-->

                <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2014. Fast CA. Todos los derechos reservados.</span>
                    </div>
                    <div class="footer-right">
                        <span>Diseñado por: <a href="http://themepixels.com/">Kristian Cortés</a></span>
                    </div>
                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->
    </body>
</html>

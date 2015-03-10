
<%@ page import="fastchacaito.Application" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Aplicaciones</li>
        </ul>
      
            <div class="maincontent">
                <div class="maincontentinner">
                    <h6 class="widgettitle" style="font-size: 30px;">Aplicaciones</h6>
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
                            <g:each in="${applicationInstanceList}" status="i" var="applicationInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td>${fieldValue(bean: applicationInstance, field: "vacutainer")}</td>

                                    <td><g:link action="show" id="${applicationInstance.id}">${fieldValue(bean: applicationInstance, field: "identifier")}</g:link></td>

                                    <td><g:formatDate format="dd MMMM yyyy" date="${applicationInstance?.arrivalDate}"/></td>

                                    <td>${fieldValue(bean: applicationInstance, field: "applicationType")}</td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                     <fieldset class="buttons">
                        <a class="btn btn-primary" href="${createLink(controller:'application', action:'create')}">
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
                </body>
                </html>

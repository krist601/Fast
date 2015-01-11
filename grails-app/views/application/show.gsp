
<%@ page import="fastchacaito.Application" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Application/List')}">Aplicación</a> <span class="separator"></span></li>
            <li>Mostrar Aplicación</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Aplicación: ${applicationInstance?.identifier} <g:if test="${applicationInstance?.lostDate}"><t style="font-size: 30px; color: yellow;">(Perdida)</t></g:if></h4>
                    <div class="widgetcontent">
                        
                        
                        <table class="table table-bordered table-invoice">
                            <tr>
                                <td class="width30">Identificador</td>
                                <td class="width70">${applicationInstance?.identifier}</td>
                            </tr>
                            <tr>
                                <td>Fecha de llegada</td>
                                <td><g:formatDate format="dd MMMM yyyy" date="${applicationInstance?.arrivalDate}"/></td>
                            </tr>
                            <g:if test="${applicationInstance?.lostDate}">
                                <tr>
                                    <td>Fecha de Perdida</td>
                                    <td><g:formatDate format="dd MMMM yyyy" date="${applicationInstance?.lostDate}"/></td>
                                </tr>
                            </g:if>
                            <tr>
                                <td>Tipo de Aplicación</td>
                                <td>${applicationInstance?.applicationType}</td>
                            </tr>
                            <tr>
                                <td>Vacutainer</td>
                                <td><g:link controller="vacutainer" action="show" id="${applicationInstance?.vacutainer?.id}">${applicationInstance?.vacutainer}</g:link></td>
                            </tr>

                        </table>
                        
                                <g:form>
                                    <fieldset class="buttons">
                                        <g:hiddenField name="id" value="${applicationInstance?.id}" />
                                        <g:link class="btn btn-primary" action="edit" id="${applicationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                        <g:if test="${!applicationInstance?.lostDate}">
                                            <g:link class="btn btn-primary" action="editLostDate" id="${applicationInstance?.id}"><g:message code="Perdida" default="Perdida" /></g:link>
                                        </g:if>
                                        <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                    </fieldset>
                                </g:form>
                            </div>
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

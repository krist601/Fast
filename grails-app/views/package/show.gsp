
<%@ page import="fastchacaito.Package" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'package.label', default: 'Package')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Package/List')}">Paquete</a> <span class="separator"></span></li>
            <li>Mostrar Paquete</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Paquete ${packageInstance?.packageType}: ${packageInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-package" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <table class="table table-bordered table-invoice">
                            <tr>
                                <td class="width30">Tipo de Paquete</td>
                                <td class="width70">${packageInstance?.packageType}</td>
                            </tr>
                            <tr>
                                <td class="width30">Precio</td>
                                <td class="width70">${packageInstance?.price} BsF</td>
                            </tr>
                            <tr>
                                <td class="width30">Cantidad de Sesiones</td>
                                <td class="width70">${packageInstance?.sesionAmount} Sesiones</td>
                            </tr>
                            
                            </table>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${packageInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${packageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

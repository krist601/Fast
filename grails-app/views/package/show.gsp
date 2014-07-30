
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
                    <h4 class="widgettitle" style="font-size: 30px;">Paquete: ${packageInstance?.id}</h4>
                    <div class="widgetcontent">
                        <div id="show-package" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <ol class="property-list package">

                                <g:if test="${packageInstance?.packageType}">
                                    <li class="fieldcontain">
                                        <span id="packageType-label" class="property-label"><g:message code="package.packageType.label" default="Package Type" /></span>

                                        <span class="property-value" aria-labelledby="packageType-label"><g:fieldValue bean="${packageInstance}" field="packageType"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${packageInstance?.price}">
                                    <li class="fieldcontain">
                                        <span id="price-label" class="property-label"><g:message code="package.price.label" default="Price" /></span>

                                        <span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${packageInstance}" field="price"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${packageInstance?.sesionAmount}">
                                    <li class="fieldcontain">
                                        <span id="sesionAmount-label" class="property-label"><g:message code="package.sesionAmount.label" default="Sesion Amount" /></span>

                                        <span class="property-value" aria-labelledby="sesionAmount-label"><g:fieldValue bean="${packageInstance}" field="sesionAmount"/></span>

                                    </li>
                                </g:if>

                            </ol>
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

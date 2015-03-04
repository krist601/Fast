<%@ page import="fastchacaito.Package" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'package.label', default: 'Package')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Package/List')}">Paquete</a> <span class="separator"></span></li>
            <li>Crear Nuevo Paquete</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Crear Paquete</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="save" method="post" data-toggle="validator">

                            <div id="create-package" class="content scaffold-create" role="main">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <g:hasErrors bean="${packageInstance}">
                                    <ul class="errors" role="alert">
                                        <g:eachError bean="${packageInstance}" var="error">
                                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                            </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form action="save" >
                                    <fieldset class="form">
                                        <div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'packageType', 'error')} required">
                                            <label for="packageType">
                                                <g:message code="package.packageType.label" default="Tipo de Paquete" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:select name="packageType" from="${['Balance Clásico', 'Balance Plus','Mesoterapia']}" noSelection="['':'-Selecciona-']" required=""/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'price', 'error')} required">
                                            <label for="price">
                                                <g:message code="package.price.label" default="Precio" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <input name="price" type="number" required/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'sesionAmount', 'error')} required">
                                            <label for="sesionAmount">
                                                <g:message code="package.sesionAmount.label" default="Cantidad de Aplicaciones" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <input name="sesionAmount" type="number" required/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'description', 'error')} ">
                                            <label for="description">
                                                <g:message code="package.description.label" default="Descripción" />

                                            </label>
                                            <g:field name="description" type="text" value="${packageInstance.description}" />
                                        </div>
                                    </fieldset>
                                    <fieldset class="buttons">
                                        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                                    </fieldset>
                                </g:form>
                            </div>
                        </form>
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

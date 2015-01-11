<%@ page import="user.SecAppUser" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'secAppUser.label', default: 'SecAppUser')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/SecAppUser/List')}">Usuario</a> <span class="separator"></span></li>
            <li>Editar Usuario</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Cambiar contraseña de ${secAppUserInstance?.username}</h4>
                    <div class="widgetcontent">
                        <div id="edit-secAppUser" class="content scaffold-edit" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${secAppUserInstance}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${secAppUserInstance}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                        </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form method="post" >
                                <g:hiddenField name="id" value="${secAppUserInstance?.id}" />
                                <g:hiddenField name="version" value="${secAppUserInstance?.version}" />
                                <fieldset class="form">
                                        <div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'password', 'error')} required">
                                            <label for="password">
                                                <g:message code="secAppUser.password.label" default="Contraseña" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:passwordField name="password" required="" value=""/>
                                        </div>
                                        <div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'password', 'error')} required">
                                            <label for="password">
                                                <g:message code="secAppUser.password.label" default="Repita la contraseña" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:passwordField name="password2" required="" value=""/>
                                        </div>
                                </fieldset>
                                <fieldset class="buttons">
                                    <g:actionSubmit class="btn btn-primary" action="updatePassword" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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

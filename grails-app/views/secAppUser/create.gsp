<%@ page import="user.SecAppUser" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'secAppUser.label', default: 'SecAppUser')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/SecAppUser/List')}">Usuario</a> <span class="separator"></span></li>
            <li>Crear Nuevo Usuario</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Crear Usuario</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="save" method="post">
                            <div id="create-secAppUser" class="content scaffold-create" role="main">
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
                                <g:form action="save" >
                                    <fieldset class="form">
                                        <div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'username', 'error')} required">
                                            <label for="username">
                                                <g:message code="secAppUser.username.label" default="Username" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:textField name="username" required="" value="${secAppUserInstance?.username}"/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'password', 'error')} required">
                                            <label for="password">
                                                <g:message code="secAppUser.password.label" default="Contraseña" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:passwordField name="password" required="" value="${secAppUserInstance?.password}"/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'photo', 'error')} ">
                                            <label for="photo">
                                                <g:message code="secAppUser.photo.label" default="Foto de Perfil" />

                                            </label>
                                            <input type="file" id="photo" name="photo" />
                                        </div>
                                        <br>

                                        <div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'name', 'error')} ">
                                            <label for="name">
                                                <g:message code="secAppUser.name.label" default="Nombre" />

                                            </label>
                                            <g:textField name="name" value="${secAppUserInstance?.name}"/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'email', 'error')} ">
                                            <label for="email">
                                                <g:message code="secAppUser.email.label" default="Correo" />

                                            </label>
                                            <g:textField name="email" value="${secAppUserInstance?.email}"/>
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

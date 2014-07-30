
<%@ page import="user.SecAppUser" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'secAppUser.label', default: 'SecAppUser')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/SecAppUser/List')}">Usuario</a> <span class="separator"></span></li>
            <li>Mostrar Usuario</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Usuario: ${secAppUserInstance?.id}</h4>
                    <div id="show-secAppUser" class="content scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <ol class="property-list secAppUser">

                            <g:if test="${secAppUserInstance?.username}">
                                <li class="fieldcontain">
                                    <span id="username-label" class="property-label"><g:message code="secAppUser.username.label" default="Username" /></span>

                                    <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${secAppUserInstance}" field="username"/></span>

                                </li>
                            </g:if>

                            <g:if test="${secAppUserInstance?.password}">
                                <li class="fieldcontain">
                                    <span id="password-label" class="property-label"><g:message code="secAppUser.password.label" default="Password" /></span>

                                    <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${secAppUserInstance}" field="password"/></span>

                                </li>
                            </g:if>

                            <g:if test="${secAppUserInstance?.accountExpired}">
                                <li class="fieldcontain">
                                    <span id="accountExpired-label" class="property-label"><g:message code="secAppUser.accountExpired.label" default="Account Expired" /></span>

                                    <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${secAppUserInstance?.accountExpired}" /></span>

                                </li>
                            </g:if>

                            <g:if test="${secAppUserInstance?.accountLocked}">
                                <li class="fieldcontain">
                                    <span id="accountLocked-label" class="property-label"><g:message code="secAppUser.accountLocked.label" default="Account Locked" /></span>

                                    <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${secAppUserInstance?.accountLocked}" /></span>

                                </li>
                            </g:if>

                            <g:if test="${secAppUserInstance?.enabled}">
                                <li class="fieldcontain">
                                    <span id="enabled-label" class="property-label"><g:message code="secAppUser.enabled.label" default="Enabled" /></span>

                                    <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${secAppUserInstance?.enabled}" /></span>

                                </li>
                            </g:if>

                            <g:if test="${secAppUserInstance?.passwordExpired}">
                                <li class="fieldcontain">
                                    <span id="passwordExpired-label" class="property-label"><g:message code="secAppUser.passwordExpired.label" default="Password Expired" /></span>

                                    <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${secAppUserInstance?.passwordExpired}" /></span>

                                </li>
                            </g:if>

                        </ol>
                        <g:form>
                            <fieldset class="buttons">
                                <g:hiddenField name="id" value="${secAppUserInstance?.id}" />
                                <g:link class="btn btn-primary" action="edit" id="${secAppUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                    </div>
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

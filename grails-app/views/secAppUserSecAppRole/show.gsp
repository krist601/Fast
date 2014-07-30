
<%@ page import="user.SecAppUserSecAppRole" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/SecAppUserSecAppRole/List')}">Usuario Rol</a> <span class="separator"></span></li>
            <li>Mostrar Usuario Rol</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Control de Sesiones: ${secAppUserSecAppRoleInstance?.id}</h4>
                    <div id="show-secAppUserSecAppRole" class="content scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <ol class="property-list secAppUserSecAppRole">

                            <g:if test="${secAppUserSecAppRoleInstance?.secAppRole}">
                                <li class="fieldcontain">
                                    <span id="secAppRole-label" class="property-label"><g:message code="secAppUserSecAppRole.secAppRole.label" default="Sec App Role" /></span>

                                    <span class="property-value" aria-labelledby="secAppRole-label"><g:link controller="secAppRole" action="show" id="${secAppUserSecAppRoleInstance?.secAppRole?.id}">${secAppUserSecAppRoleInstance?.secAppRole?.encodeAsHTML()}</g:link></span>

                                </li>
                            </g:if>

                            <g:if test="${secAppUserSecAppRoleInstance?.secAppUser}">
                                <li class="fieldcontain">
                                    <span id="secAppUser-label" class="property-label"><g:message code="secAppUserSecAppRole.secAppUser.label" default="Sec App User" /></span>

                                    <span class="property-value" aria-labelledby="secAppUser-label"><g:link controller="secAppUser" action="show" id="${secAppUserSecAppRoleInstance?.secAppUser?.id}">${secAppUserSecAppRoleInstance?.secAppUser?.encodeAsHTML()}</g:link></span>

                                </li>
                            </g:if>

                        </ol>
                        <g:form>
                            <fieldset class="buttons">
                                <g:hiddenField name="id" value="${secAppUserSecAppRoleInstance?.id}" />
                                <g:link class="btn btn-primary" action="edit" id="${secAppUserSecAppRoleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

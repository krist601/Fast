
<%@ page import="user.SecAppRole" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'secAppRole.label', default: 'SecAppRole')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/SecAppRole/List')}">Rol</a> <span class="separator"></span></li>
            <li>Mostrar Rol</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Rol: ${secAppRoleInstance?.id}</h4>
                    <div id="show-secAppRole" class="content scaffold-show" role="main">
                        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <ol class="property-list secAppRole">

                            <g:if test="${secAppRoleInstance?.authority}">
                                <li class="fieldcontain">
                                    <span id="authority-label" class="property-label"><g:message code="secAppRole.authority.label" default="Authority" /></span>

                                    <span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${secAppRoleInstance}" field="authority"/></span>

                                </li>
                            </g:if>

                        </ol>
                        <g:form>
                            <fieldset class="buttons">
                                <g:hiddenField name="id" value="${secAppRoleInstance?.id}" />
                                <g:link class="btn btn-primary" action="edit" id="${secAppRoleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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

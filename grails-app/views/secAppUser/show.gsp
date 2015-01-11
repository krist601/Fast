
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
                    <h4 class="widgettitle" style="font-size: 30px;">Usuario: ${secAppUserInstance?.username}</h4>
                    <div class="widgetcontent">
                        <table class="table table-bordered table-invoice">
                            <tr>
                                <td class="width30">Username</td>
                                <td class="width70">${secAppUserInstance?.username}</td>
                            </tr>
                            <tr>
                                <td>Nombre</td>
                                <td>${secAppUserInstance?.name}</td>
                            </tr>
                            <tr>
                                <td>Correo</td>
                                <td>${secAppUserInstance?.email}</td>
                            </tr>

                        </table>
                        <div id="show-secAppUser" class="content scaffold-show" role="main">

                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${secAppUserInstance?.id}" />
                                    <g:link class="btn btn-primary" action="edit" id="${secAppUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
                        </div>
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

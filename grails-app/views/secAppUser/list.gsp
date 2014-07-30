
<%@ page import="user.SecAppUser" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'secAppUser.label', default: 'SecAppUser')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Usuario</li>
        </ul>
        <div id="list-secAppUser" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Usuario</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="SecAppUser.username.label" default="Username" /></th>

                                <th><g:message code="SecAppUser.password.label" default="Password" /></th>

                                <th><g:message code="SecAppUser.accountExpired.label" default="accountExpired" /></th>

                                <th><g:message code="SecAppUser.accountLocked.label" default="accountLocked" /></th>

                                <th><g:message code="SecAppUser.enabled.label" default="enabled" /></th>

                                <th><g:message code="SecAppUser.passwordExpired.label" default="passwordExpired" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${secAppUserInstanceList}" status="i" var="secAppUserInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${secAppUserInstance.id}">${fieldValue(bean: secAppUserInstance, field: "username")}</g:link></td>

                                    <td>${fieldValue(bean: secAppUserInstance, field: "password")}</td>

                                    <td><g:formatBoolean boolean="${secAppUserInstance.accountExpired}" /></td>

                                    <td><g:formatBoolean boolean="${secAppUserInstance.accountLocked}" /></td>

                                    <td><g:formatBoolean boolean="${secAppUserInstance.enabled}" /></td>

                                    <td><g:formatBoolean boolean="${secAppUserInstance.passwordExpired}" /></td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <div class="footer">
                        <div class="footer-left">
                            <span>&copy; 2014. Fast CA. Todos los derechos reservados.</span>
                        </div>
                        <div class="footer-right">
                            <span>Diseñado por: <a href="http://themepixels.com/">Kristian Cortés</a></span>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>

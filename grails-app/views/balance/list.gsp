
<%@ page import="fastchacaito.Balance" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'balance.label', default: 'Balance')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Balances</li>
        </ul>
        <div id="list-balance" class="content scaffold-list" role="main">
            <div class="maincontent">
                <div class="maincontentinner">
                    <h4 class="widgettitle" style="font-size: 30px;">Balances</h4>
                    <table class="table table-bordered table-infinite" id="dyntable2">
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th><g:message code="balance.applicationAmount.label" default="Cantidad de Aplicaciones" /></th>

                                <th><g:message code="balance.idealWeight.label" default="Peso Ideal" /></th>

                                <th><g:message code="balance.treatment.label" default="Tratamiento" /></th>

                                <th><g:message code="balance.type.label" default="Tipo de Tratamiento" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${balanceInstanceList}" status="i" var="balanceInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${balanceInstance.id}">${fieldValue(bean: balanceInstance, field: "applicationAmount")}</g:link></td>

                                    <td>${fieldValue(bean: balanceInstance, field: "idealWeight")}</td>

                                    <td>${fieldValue(bean: balanceInstance, field: "treatment")}</td>

                                    <td>${fieldValue(bean: balanceInstance, field: "type")}</td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <fieldset class="buttons">
                        <a class="btn btn-primary" href="${createLink(controller:'balance', action:'create')}">
                            Crear
                        </a>
                    </fieldset>
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

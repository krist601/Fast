<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title><g:if test="${params.q && params.q?.trim() != ''}">${params.q} - </g:if>Buscar</title>

        <script type="text/javascript">
            var focusQueryInput = function() {
            document.getElementById("q").focus();
            }
        </script>
    </head>
    <body onload="focusQueryInput();">
        <div class="row">
            <div class="col-sm-12">
                <section class="panel">

                    <g:hasErrors bean="${patientInstance}">
                        <g:eachError bean="${patientInstance}" var="error">
                            <div class="alert alert-block alert-danger fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>
                                <strong>Error!</strong> <g:message error="${error}"/>
                            </div>
                        </g:eachError>
                    </g:hasErrors>
                    <g:set var="haveQuery" value="${params.q?.trim()}" />
                    <g:set var="haveResults" value="${searchResult?.results}" />
                    <header class="panel-heading">
                        <h3>Resultados</h3>
                    </header>
                    <div class="panel-body">
                        <div class="adv-table">
                            <g:if test="${haveQuery && !haveResults && !parseException}">
                                <div class="alert alert-block alert-danger fade in">
                                    <button data-dismiss="alert" class="close close-sm" type="button">
                                        <i class="fa fa-times"></i>
                                    </button>
                                    No se encontraron resultados para la busqueda de - <strong>${params.q}</strong>
                                </div>
                            </g:if>

                            <g:if test="${searchResult?.suggestedQuery}">
                                <p>Quisiste decir <g:link controller="patient" action="search" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
                            </g:if>
                            <table  class="display table table-bordered table-striped" id="dynamic-table">
                                <thead>
                                    <tr>
                                        <g:sortableColumn property="cedula" title="${message(code: 'patient.cedula.label', default: 'Cédula')}" />
                                        <g:sortableColumn property="lastName" title="${message(code: 'patient.address.label', default: 'Nombres y Apellidos')}" />
                                    </tr>
                                </thead>
                                <div class="list">
                                    <g:if test="${haveResults}">
                                        <g:each var="result" in="${searchResult.results}" status="index">
                                            <tr class="${(index % 2) == 0 ? 'even' : 'odd'}">

                                                <td >
                                                    <g:link action="show" id="${result.id}" style="color: #4aa8e0;">
                                                        ${fieldValue(bean: result, field: "cedula")}
                                                    </g:link>
                                                </td>
                                                <td >
                                                    <g:link action="show" id="${result.id}">
                                                        ${fieldValue(bean: result, field: "firstName")} ${fieldValue(bean: result, field: "lastName")}
                                                    </g:link>
                                                </td>
                                            </tr>
                                        </g:each>
                                    </g:if>
                                </div>
                            </table>
                        </div>    
                    </div>
                </section>

            </div>


        </div>
    </body>
</html>

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
                     <div class="maincontent">
            <div class="maincontentinner">
                        <h3>Resultados</h3>
                   
                       
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
                            <table  class="table table-bordered table-infinite" id="dyntable2">
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

                                <th><g:message code="patient.address.label" default="Cédula" /></th>

                                <th><g:message code="patient.admisionDate.label" default="Nombre" /></th>
                               </tr>
                                </thead>
                                
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
                             
                            </table>
                        
                   </div>
</div>
             
    </body>
</html>

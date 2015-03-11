<%@ page import="fastchacaito.Gel" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'gel.label', default: 'Gel')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Gel/List')}">Gel</a> <span class="separator"></span></li>
            <li>Crear Nuevo Gel</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Crear Gel</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="save" method="post">
                            
                                <div id="create-gel" class="content scaffold-create" role="main">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <g:hasErrors bean="${gelInstance}">
                                    <ul class="errors" role="alert">
                                        <g:eachError bean="${gelInstance}" var="error">
                                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                            </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form action="save" >

                                    <div class="fieldcontain ${hasErrors(bean: gelInstance, field: 'amount', 'error')} ">
                                            <label for="outType">
                                                    <g:message code="gel.amount.label" default="Cantidad" />

                                            </label>
                                            <g:textField name="amount" value=""/>
                                    </div>


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
                        <span>DiseÃ±ado por: <a href="http://themepixels.com/">Kristian CortÃ©s</a></span>
                    </div>
                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->
    </body>
</html>

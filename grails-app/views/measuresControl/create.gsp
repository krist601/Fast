<%@ page import="fastchacaito.MeasuresControl" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'measuresControl.label', default: 'MeasuresControl')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/MeasuresControl/List')}">Control de Medidas</a> <span class="separator"></span></li>
            <li>Crear Nuevo Control de Medidas</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Crear Control de Medidas</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="save" method="post" data-toggle="validator">

                            <div id="create-measuresControl" class="content scaffold-create" role="main">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <g:hasErrors bean="${measuresControlInstance}">
                                    <ul class="errors" role="alert">
                                        <g:eachError bean="${measuresControlInstance}" var="error">
                                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                            </g:eachError>
                                    </ul>
                                </g:hasErrors>

                                <fieldset class="form">
                                    <form data-toggle="validator" role="form" action="save" >
                                        <div class="form-group">
                                            
                                            <table>

                                                <tr>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                        <div class="form-control" required>
                                                            <label for="leftArm">
                                                                <g:message code="measuresControl.leftArm.label" default="Brazo Izquierdo" />

                                                            </label>
                                                            <input type="number"  class="form-control"  name="leftArm"  required>

                                                        </div>
                                                    </td>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                        <div class="form-control" required>
                                                            <label for="rightArm">
                                                                <g:message code="measuresControl.rightArm.label" default="Brazo Derecho" />

                                                            </label>
                                                            <input type="number" name="rightArm" required/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                        <div class="form-control" required>
                                                            <label for="leftThigh">
                                                                <g:message code="measuresControl.leftThigh.label" default="Muslo Izquierdo" />

                                                            </label>
                                                             <input type="number" name="leftThigh" required/>
                                                        </div>
                                                    </td>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                        <div class="form-control" required>
                                                            <label for="rightThigh">
                                                                <g:message code="measuresControl.rightThigh.label" default="Muslo Derecho" />

                                                            </label>
                                                            <input type="number" name="rightThigh" required/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                        <div class="form-control" required>
                                                            <label for="leftCrotch">
                                                                <g:message code="measuresControl.leftCrotch.label" default="Entrepierna Izquierda" />

                                                            </label>
                                                            <input type="number" name="leftCrotch" required/>
                                                        </div>
                                                    </td>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                        <div class="form-control" required>
                                                            <label for="rightCrotch">
                                                                <g:message code="measuresControl.rightCrotch.label" default="Entrepierna Derecha" />

                                                            </label>
                                                            <input type="number" name="rightCrotch" required/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                        <div class="form-control" required>
                                                            <label for="hips">
                                                                <g:message code="measuresControl.hips.label" default="Caderas" />

                                                            </label>
                                                            <input type="number" name="hips" required/>
                                                        </div>
                                                    </td>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                        <div class="form-control" required>
                                                            <label for="waist">
                                                                <g:message code="measuresControl.waist.label" default="Cintura" />

                                                            </label>
                                                            <input type="number" name="waist" required/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                        <div class="form-control" required>
                                                            <label for="abdomen">
                                                                <g:message code="measuresControl.abdomen.label" default="Abdomen" />

                                                            </label>
                                                            <input type="number" name="abdomen" required/>

                                                        </div>
                                                    </td>
                                                    <td style="margin-bottom: 10px; padding-bottom: 10px;">
                                                    </td>
                                                </tr>

                                            </table>

                                            <g:hiddenField name="balance.id" value="${measuresControlInstance?.balance?.id}"/>
                                            <g:hiddenField name="mesotherapy.id" value="${measuresControlInstance?.mesotherapy?.id}"/>

                                        </div>

                                </fieldset>
                                <fieldset class="buttons">
                                    <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                                </fieldset>
                        </form>
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

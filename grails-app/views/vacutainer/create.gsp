<%@ page import="fastchacaito.Vacutainer" %>
<!DOCTYPE html>           
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'vacutainer.label', default: 'Vacutainer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <ul class="breadcrumbs">
            <li><a class="home" href="${createLink(uri: '/')}"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li><a class="home" href="${createLink(uri: '/Vacutainer/List')}">Vacutainer</a> <span class="separator"></span></li>
            <li>Crear Nuevo Vacutainer</li>
        </ul>

        <div class="maincontent">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle" style="font-size: 30px;">Crear Vacutainer</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="save" method="post" data-toggle="validator">
                            <div id="create-vacutainer" class="content scaffold-create" role="main">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <g:hasErrors bean="${vacutainerInstance}">
                                    <ul class="errors" role="alert">
                                        <g:eachError bean="${vacutainerInstance}" var="error">
                                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                            </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form action="save" >
                                    <fieldset class="form">
                                        <div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'bornDate', 'error')} ">
                                            <label>Fecha de Llegada</label>
                                            <span class="field">
                                                <input id="datepicker" type="text" name="arrivalDate" class="input-small" required/>
                                            </span>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'identifier', 'error')} ">
                                            <label for="identifier">
                                                <g:message code="vacutainer.identifier.label" default="Lote" />

                                            </label>
                                            <input type="number" name="identifier"  required/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'identifier', 'error')} ">
                                            <label for="identifier">
                                                <g:message code="vacutainer.identifier.label" default="Unidad" />

                                            </label>
                                            <input type="number" name="unidad" required/>
                                        </div>

                                        <div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'identifier', 'error')} ">
                                            <label for="identifier">
                                                <g:message code="vacutainer.identifier.label" default="Mes" />

                                            </label>
                                            <g:select name="mes" from="${['01', '02', '03','04', '05', '06','07', '08', '09','10', '11', '12']}" value=""  noSelection="['':'-Selecciona-']" required=""/>
                                        </div>



                                        <div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'vacutainerType', 'error')} ">
                                            <label for="vacutainerType">
                                                Tipo de Vacutainer
                                            </label>
                                            <select class="default form-control" name="vacutainerType" id="vacutainerType" value="">
                                                <option value="Mesoterapia">Mesoterapia</option>
                                                <option value="Balance Clásico">Balance Clásico</option>
                                                <option value="Balance Plus">Balance Plus</option>
                                            </select>
                                        </div>
                                        <div id="showMe">
                                            <div class="fieldcontain ${hasErrors(bean: vacutainerInstance, field: 'vacutainerType', 'error')} ">
                                                <label for="vacutainerType">
                                                    <g:message code="vacutainer.vacutainerType.label" default="Cantidad de Aplicaciones" />

                                                </label>
                                                <g:textField name="vacutainerAmount" value="" />
                                            </div>
                                            <br>
                                        </div>

                                    </fieldset>
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
                        <span>Diseñado por: <a href="http://themepixels.com/">Kristian Cortés</a></span>
                    </div>
                </div><!--footer-->


                <script>
                    var elem = document.getElementById("vacutainerType");
                    elem.onchange = function(){
                    var hiddenDiv = document.getElementById("showMe");
                    if (this.value!="Mesoterapia") {
                    hiddenDiv.style.display = (this.value == "") ? "none":"block";
                    }
                    if (this.value=="Mesoterapia") {
                    hiddenDiv.style.display = "none";
                    }
                    };
                </script>
                <style>
                    #showMe{
                    display:none;
                    }
                </style>
            </div><!--maincontentinner-->
        </div><!--maincontent-->
    </body>
</html>

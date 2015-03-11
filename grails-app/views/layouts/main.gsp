<!DOCTYPE html>
<%@ page import="user.SecAppUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Fast Chacaito</title>

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.default.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-fileupload.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-timepicker.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'responsive-tables.css')}" type="text/css">

        <g:layoutHead/>
    <r:layoutResources />

</head>

<body>

    <div class="mainwrapper">

        <div class="header">
            <div class="logo">
                <a href="/FastChacaito/"><img src="${resource(dir: 'images', file: 'logoFast.png')}" ></a>
            </div>
            <div class="headerinner">
                <ul class="headmenu">
                    <li class="right">
                        
                        <g:form controller="patient" action="search" >

                                <input type="text" name="q" class="searchbar" placeholder=" Buscar Paciente...">
                            </g:form>
                    </li>
                    <li class="right">
                    <sec:ifLoggedIn>
                        <div class="userloggedinfo">

                            <img src="${createLink(controller:'secAppUser', action:'showImage', id: SecAppUser.findByUsername(sec.loggedInUserInfo(field:'username')).id)}" alt="" width="100" height="100"/>
                            <div class="userinfo">
                                <h5><sec:loggedInUserInfo field="username" /></h5>
                                <ul>
                                    <li><a href="${createLink(controller:'secAppUser', action:'show', id: SecAppUser.findByUsername(sec.loggedInUserInfo(field:'username')).id)}">Ver Perfil</a></li>
                                    <li><a href="${createLink(controller:'secAppUser', action:'editPassword', id: (SecAppUser.findByUsername(sec.loggedInUserInfo(field:'username')).id*123456789-7))}">Cambiar Contraseña</a></li>
                                    <li><a href="${createLink(controller:'logout',action:'index')}">Cerrar Sesión</a></li>
                                </ul>
                            </div>
                        </div>
                    </sec:ifLoggedIn>
                    </li>
                </ul><!--headmenu-->
            </div>
        </div>

        <div class="leftpanel">

            <div class="leftmenu">        
                <ul class="nav nav-tabs nav-stacked">
                    <li class="nav-header">Menú</li>
                    <li><a href="/FastChacaito/"><span class="iconfa-laptop"></span> Dashboard</a></li>
                    <li class="dropdown"><a href=""><span class="iconfa-user"></span> Paciente</a>
                        <ul>
                            <li><a href="/FastChacaito/Patient/List">Listar Pacientes</a></li>
                            <li><a href="/FastChacaito/Patient/Create">Crear Nuevo Paciente</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href=""><span class="iconfa-calendar"></span> Cita</a>
                        <ul>
                            <li><a href="/FastChacaito/Appointment/List">Listar Citas</a></li>
                            <li><a href="/FastChacaito/Appointment/Create">Crear Nueva Cita</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href=""><span class="iconfa-tint"></span> Examenes de Laboratorio</a>
                        <ul>
                            <li><a href="/FastChacaito/BloodSample/List">Muestras de Laboratorio Tomadas</a></li>
                            <li><a href="/FastChacaito/BloodSample/ListShippingDate">Muestras de Laboratorio Enviadas</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href=""><span class="iconfa-inbox"></span> Gel</a>
                        <ul>
                           <li><a href="/FastChacaito/Gel/Create">Crear Nuevo Gel</a></li>
                                <li><a href="/FastChacaito/Gel/List">Geles en Stock</a></li>
                                <li><a href="/FastChacaito/Gel/ListShipped">Geles Vendidos</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href=""><span class="iconfa-cogs"></span> Administración</a>
                        <ul>
                            <li class="dropdown"><a href="">Paquetes</a>
                                <ul>
                                    <li><a href="/FastChacaito/Package/List">Listar Paquetes</a></li>
                                    <li><a href="/FastChacaito/Package/Create">Crear Nuevo Paquete</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="">Vacutainer</a>
                                <ul>
                                    <li><a href="/FastChacaito/Vacutainer/Create">Crear Nuevo Vacutainer</a></li>
                                    <li><a href="/FastChacaito/Vacutainer/List">Listar Vacutainers</a></li>
                                    <li><a href="/FastChacaito/Vacutainer/List?foo=1">Vacutainers de Mesoterapia Disponibles</a></li>
                                        <li><a href="/FastChacaito/Vacutainer/List?foo=2">Vacutainers de Balance Disponibles</a></li>
                                    
                                </ul>
                            </li>
                            <li class="dropdown"><a href="">Aplicaciones</a>
                                <ul>
                                    <li><a href="/FastChacaito/Application/List">Listar Aplicaciones</a></li>
                                    <li><a href="/FastChacaito/Application/Create">Crear Nuevo Aplicación</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div><!--leftmenu-->

        </div><!-- leftpanel -->
        <div class="rightpanel">

            <g:layoutBody/>
            <div class="footer" role="contentinfo"></div>
            <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
            <g:javascript library="application"/>
            <r:layoutResources />

        </div><!--rightpanel-->

    </div><!--mainwrapper-->
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.9.1.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-migrate-1.1.1.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-ui-1.9.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-fileupload.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-timepicker.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.uniform.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.validate.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.tagsinput.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.autogrow-textarea.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'charCount.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'colorpicker.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'ui.spinner.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'chosen.jquery.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.cookie.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'modernizr.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'custom.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'forms.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.cookie.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'responsive-tables.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'prettify', file: 'prettify.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.jgrowl.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.alerts.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'elements.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-timepicker.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.uniform.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.validate.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.tagsinput.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.autogrow-textarea.js')}"></script>
        <%-- 14100  1402 1403 constancia de trabajo  --%>
<script type="text/javascript">
        jQuery(document).ready(function(){
        // dynamic table
        jQuery('#dyntable').dataTable({
        "sPaginationType": "full_numbers",
        "aaSortingFixed": [[0,'asc']],
        "fnDrawCallback": function(oSettings) {
        jQuery.uniform.update();
        }
        });

        jQuery('#dyntable2').dataTable( {
        "bScrollInfinite": true,
        "bScrollCollapse": true,
        "sScrollY": "300px"
        });

        });
    </script>
</body>
</html>


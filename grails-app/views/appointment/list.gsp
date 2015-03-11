<%@ page import="fastchacaito.Appointment" %>
<%@ page import="user.SecAppUser" %>
<!DOCTYPE html>
<html>
    <head>
        <g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.default.css')}" type="text/css" />
        <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.9.1.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-migrate-1.1.1.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-ui-1.9.2.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'modernizr.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'fullcalendar.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.cookie.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'custom.js')}"></script>
        <script type='text/javascript'>

            jQuery(document).ready(function() {

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            var calendar = jQuery('#calendar').fullCalendar({
            header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
            },
            buttonText: {
            prev: '&laquo;',
            next: '&raquo;',
            prevYear: '&nbsp;&lt;&lt;&nbsp;',
            nextYear: '&nbsp;&gt;&gt;&nbsp;',
            today: 'today',
            month: 'month',
            week: 'week',
            day: 'day'
            },
            selectable: true,
            selectHelper: true,
            select: "${createLink(controller: 'appointment', action: 'create')}",
            editable: true,
            events: '${createLink(controller: "appointment", action: "events")}'
            });

            });

        </script>
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
                            <li><a href="/FastChacaito/Gel/List">Listar Gels</a></li>
                            <li><a href="/FastChacaito/Gel/Create">Crear Nuevo Gel</a></li>
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

                <ul class="breadcrumbs">
                    <li><a href="dashboard.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
                    <li>Calendar</li>

                    <li class="right">
                        <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
                        <ul class="dropdown-menu pull-right skin-color">
                            <li><a href="default">Default</a></li>
                            <li><a href="navyblue">Navy Blue</a></li>
                            <li><a href="palegreen">Pale Green</a></li>
                            <li><a href="red">Red</a></li>
                            <li><a href="green">Green</a></li>
                            <li><a href="brown">Brown</a></li>
                        </ul>
                    </li>
                </ul>

                <div class="maincontent">
                    <div class="maincontentinner">
                        <div id='calendar'></div>

                        <div class="footer">
                            <div class="footer-left">
                                <span>&copy; 2013. Shamcey Admin Template. All Rights Reserved.</span>
                            </div>
                            <div class="footer-right">
                                <span>Designed by: <a href="http://themepixels.com/">ThemePixels</a></span>
                            </div>
                        </div><!--footer-->
                    </div><!--maincontentinner-->
                </div><!--maincontent-->


            </div><!--rightpanel-->

        </div><!--mainwrapper-->

    </body>
</html>

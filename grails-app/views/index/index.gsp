<!DOCTYPE html>
<%@ page import="user.SecAppUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Fast Chacaito</title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.default.css')}" type="text/css" />

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'responsive-tables.css')}">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
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
                        <li class="dropdown"><a href=""><span class="iconfa-beaker"></span> Control de Aplicaciones</a>
                            <ul>
                                <li><a href="/FastChacaito/ApplicationControl/List">Listar Controles de Aplicaciones</a></li>
                                <li><a href="/FastChacaito/ApplicationControl/Create">Crear Nuevo Control de Aplicacione</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href=""><span class="iconfa-leaf"></span> Control de Masaje</a>
                            <ul>
                                <li><a href="/FastChacaito/massageControl/List">Listar Controles de Masajes</a></li>
                                <li><a href="/FastChacaito/massageControl/Create">Crear Nuevo Control de Masaje</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href=""><span class="iconfa-resize-small"></span> Control de Medidas</a>
                            <ul>
                                <li><a href="/FastChacaito/measuresControl/List">Listar Controles de Medidas</a></li>
                                <li><a href="/FastChacaito/measuresControl/Create">Crear Nuevo Control de Medidas</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href=""><span class="iconfa-calendar"></span> Cita</a>
                            <ul>
                                <li><a href="/FastChacaito/Appointment/List">Listar Citas</a></li>
                                <li><a href="/FastChacaito/Appointment/Create">Crear Nueva Cita</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href=""><span class="iconfa-tint"></span> Examen de Laboratorio</a>
                            <ul>
                                <li><a href="/FastChacaito/BloodSample/List">Listar Examenes de Laboratorio</a></li>
                                <li><a href="/FastChacaito/BloodSample/Create">Crear Nuevo Examen de Laboratorio</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href=""><span class="iconfa-inbox"></span> Gel</a>
                            <ul>
                                <li><a href="/FastChacaito/Gel/List">Listar Gels</a></li>
                                <li><a href="/FastChacaito/Gel/Create">Crear Nuevo Gel</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href=""><span class="iconfa-th-list"></span> Contrato</a>
                            <ul>
                                <li><a href="/FastChacaito/Treatment/List">Listar Contratos</a></li>
                                <li><a href="/FastChacaito/Treatment/Create">Crear Nuevo Contrato</a></li>
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
                                <li class="dropdown"><a href="">Cierre</a>
                                    <ul>
                                        <li><a href="/FastChacaito/Closure/List">Listar Cierres</a></li>
                                        <li><a href="/FastChacaito/Closure/Create">Crear Nuevo Cierre</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="">Inventario</a>
                                    <ul>
                                        <li><a href="/FastChacaito/Inventory/List">Listar Inventarios</a></li>
                                        <li><a href="/FastChacaito/Inventory/Create">Crear Nuevo Inventario</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="">Vacutainer</a>
                                    <ul>
                                        <li><a href="/FastChacaito/Vacutainer/List">Listar Vacutainers</a></li>
                                        <li><a href="/FastChacaito/Vacutainer/Create">Crear Nuevo Vacutainer</a></li>
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

                <div class="pageheader">
                    <form action="results.html" method="post" class="searchbar">
                        <input type="text" name="keyword" placeholder="Buscar Paciente..." />
                    </form>
                    <div class="pageicon"><span class="iconfa-laptop"></span></div>
                    <div class="pagetitle">
                        <h5>All Features Summary</h5>
                        <h3>Sistema Administrativo Fast Chacaíto</h3>
                    </div>
                </div><!--pageheader-->
                <div class="maincontent">
                    <div class="maincontentinner">
                        <div class="row-fluid">
                            <div id="dashboard-left" class="span8">
                                <ul class="shortcuts">
                                    <li class="events">
                                        <a href="${createLink(controller:'patient', action:'list')}">
                                            <span class="shortcuts-icon iconsi-event"></span>
                                            <span class="shortcuts-label">Pacientes</span>
                                        </a>
                                    </li>   
                                    <li class="products">
                                        <a href="${createLink(controller:'vacutainer', action:'list')}">
                                            <span class="shortcuts-icon iconsi-cart"></span>
                                            <span class="shortcuts-label">Vacutainers</span>
                                        </a>
                                    </li>
                                    <li class="archive">
                                        <a href="${createLink(controller:'application', action:'list')}">
                                            <span class="shortcuts-icon iconsi-archive"></span>
                                            <span class="shortcuts-label">Aplicaciones</span>
                                        </a>
                                    </li>
                                    <li class="help">
                                        <a href="">
                                            <span class="shortcuts-icon iconsi-help"></span>
                                            <span class="shortcuts-label">Help</span>
                                        </a>
                                    </li>
                                    <li class="last images">
                                        <a href="">
                                            <span class="shortcuts-icon iconsi-images"></span>
                                            <span class="shortcuts-label">Images</span>
                                        </a>
                                    </li>
                                </ul>
                                <br />
                                <div id="dashboard-right" class="span4">
                                    
                        <div class="divider15"></div>
                        
                                      
                        <h4 class="widgettitle">Event Calendar</h4>
                        <div class="widgetcontent nopadding">
                            <div id="datepicker"></div>
                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2014. Fast CA. Todos los derechos reservados.</span>
                    </div>
                    <div class="footer-right">
                        <span>Desarrollado por: <a href="http://themepixels.com/">Kristian Cortés</a></span>
                    </div>
                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->

    </div><!--rightpanel-->

</div><!--mainwrapper-->
<script type="text/javascript">
    jQuery(document).ready(function() {

    // simple chart
    var flash = [[0, 11], [1, 9], [2,12], [3, 8], [4, 7], [5, 3], [6, 1]];
    var html5 = [[0, 5], [1, 4], [2,4], [3, 1], [4, 9], [5, 10], [6, 13]];
    var css3 = [[0, 6], [1, 1], [2,9], [3, 12], [4, 10], [5, 12], [6, 11]];

    function showTooltip(x, y, contents) {
			jQuery('<div id="tooltip" class="tooltipflot">' + contents + '</div>').css( {
    position: 'absolute',
    display: 'none',
    top: y + 5,
    left: x + 5
    }).appendTo("body").fadeIn(200);
    }


    var plot = jQuery.plot(jQuery("#chartplace"),
    [ { data: flash, label: "Flash(x)", color: "#6fad04"},
    { data: html5, label: "HTML5(x)", color: "#06c"},
    { data: css3, label: "CSS3", color: "#666"} ], {
    series: {
    lines: { show: true, fill: true, fillColor: { colors: [ { opacity: 0.05 }, { opacity: 0.15 } ] } },
    points: { show: true }
    },
    legend: { position: 'nw'},
    grid: { hoverable: true, clickable: true, borderColor: '#666', borderWidth: 2, labelMargin: 10 },
    yaxis: { min: 0, max: 15 }
    });

    var previousPoint = null;
    jQuery("#chartplace").bind("plothover", function (event, pos, item) {
    jQuery("#x").text(pos.x.toFixed(2));
    jQuery("#y").text(pos.y.toFixed(2));

    if(item) {
    if (previousPoint != item.dataIndex) {
    previousPoint = item.dataIndex;

    jQuery("#tooltip").remove();
    var x = item.datapoint[0].toFixed(2),
    y = item.datapoint[1].toFixed(2);

    showTooltip(item.pageX, item.pageY,
    item.series.label + " of " + x + " = " + y);
    }

    } else {
    jQuery("#tooltip").remove();
    previousPoint = null;            
    }

    });

    jQuery("#chartplace").bind("plotclick", function (event, pos, item) {
    if (item) {
    jQuery("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
    plot.highlight(item.series, item.datapoint);
    }
    });


    //datepicker
    jQuery('#datepicker').datepicker();

    // tabbed widget
    jQuery('.tabbedwidget').tabs();



    });
</script>

<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.9.1.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-migrate-1.1.1.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-ui-1.9.2.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'modernizr.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.cookie.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.uniform.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/flot', file: 'jquery.flot.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/flot', file: 'jquery.flot.resize.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'responsive-tables.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'custom.js')}"></script>
</body>
</html>




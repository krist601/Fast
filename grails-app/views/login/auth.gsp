<%--<html>
<head>
        <meta name='layout' content='main'/>
        <title><g:message code="springSecurity.login.title"/></title>
        <style type='text/css' media='screen'>
        #login {
                margin: 15px 0px;
                padding: 0px;
                text-align: center;
        }

        #login .inner {
                width: 340px;
                padding-bottom: 6px;
                margin: 60px auto;
                text-align: left;
                border: 1px solid #aab;
                background-color: #f0f0fa;
                -moz-box-shadow: 2px 2px 2px #eee;
                -webkit-box-shadow: 2px 2px 2px #eee;
                -khtml-box-shadow: 2px 2px 2px #eee;
                box-shadow: 2px 2px 2px #eee;
        }

        #login .inner .fheader {
                padding: 18px 26px 14px 26px;
                background-color: #f7f7ff;
                margin: 0px 0 14px 0;
                color: #2e3741;
                font-size: 18px;
                font-weight: bold;
        }

        #login .inner .cssform p {
                clear: left;
                margin: 0;
                padding: 4px 0 3px 0;
                padding-left: 105px;
                margin-bottom: 20px;
                height: 1%;
        }

        #login .inner .cssform input[type='text'] {
                width: 120px;
        }

        #login .inner .cssform label {
                font-weight: bold;
                float: left;
                text-align: right;
                margin-left: -105px;
                width: 110px;
                padding-top: 3px;
                padding-right: 10px;
        }

        #login #remember_me_holder {
                padding-left: 120px;
        }

        #login #submit {
                margin-left: 15px;
        }

        #login #remember_me_holder label {
                float: none;
                margin-left: 0;
                text-align: left;
                width: 200px
        }

        #login .inner .login_message {
                padding: 6px 25px 20px 25px;
                color: #c33;
        }

        #login .inner .text_ {
                width: 120px;
        }

        #login .inner .chk {
                height: 12px;
        }
        </style>
</head>

<body>
<div id='login'>
        <div class='inner'>
                <div class='fheader'><g:message code="springSecurity.login.header"/></div>

                <g:if test='${flash.message}'>
                        <div class='login_message'>${flash.message}</div>
                </g:if>

                <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                        <p>
                                <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                                <input type='text' class='text_' name='j_username' id='username'/>
                        </p>

                        <p>
                                <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                                <input type='password' class='text_' name='j_password' id='password'/>
                        </p>

                        <p id="remember_me_holder">
                                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
                        </p>

                        <p>
                                <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
                        </p>
                </form>
        </div>
</div>
<script type='text/javascript'>
        <!--
        (function() {
                document.forms['loginForm'].elements['j_username'].focus();
        })();
        // -->
</script>
</body>
</html--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Shamcey - Metro Style Admin Template - shared on themelock.com</title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.default.css')}" type="text/css">

        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="js/jquery-migrate-1.1.1.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.9.2.min.js"></script>
        <script type="text/javascript" src="js/modernizr.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery.cookie.js"></script>
        <script type="text/javascript" src="js/custom.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function(){
            jQuery('#login').submit(function(){
            var u = jQuery('#username').val();
            var p = jQuery('#password').val();
            if(u == '' && p == '') {
            jQuery('.login-alert').fadeIn();
            return false;
            }
            });
            });
        </script>
    </head>

    <body class="loginpage">

        <div class="loginpanel">
            <div class="loginpanelinner">
                <div class="logo animate0 bounceIn"><img src="${resource(dir: 'images', file: 'logoFast.png')}" ></div>

                <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>


                   <%-- <div class="inputwrapper login-alert">--%>
                        <g:if test='${flash.message}'>
                            <div class='login'>
                                <div class="alert alert-error">Usuario y/o clave Invalidos</div>

                            </div>
                        </g:if>
                    <%--</div>--%>
                    <div class="inputwrapper animate1 bounceIn">
                        <input type='text' class='text_' name='j_username' id='username' placeholder="Introduce el Usuario"/>
                    </div>
                    <div class="inputwrapper animate2 bounceIn">
                        <input type='password' class='text_' name='j_password' id='password' placeholder="Introduce la Contraseña"/>
                    </div>
                    <div class="inputwrapper animate3 bounceIn">
                        <%--<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>--%>
                        <button name="submit">Entrar!</button>
                    </div>
                    <div class="inputwrapper animate4 bounceIn">
                        <label><input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>Mantenerme Conectado</label>
                        </div>
                    </form>
                </div><!--loginpanelinner-->
        </div><!--loginpanel-->

        <div class="loginfooter">
            <p>&copy; 2014. Fast CA. Todos los derechos reservados.</p>
        </div>

    </body>
</html>


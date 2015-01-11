<%@ page import="user.SecAppUser" %>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="secAppUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${secAppUserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="secAppUser.photo.label" default="Imagen de Perfil" />
		
	</label>
	<input type="file" id="photo" name="photo" />
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="secAppUser.name.label" default="Nombre" />
		
	</label>
	<g:textField name="name" value="${secAppUserInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="secAppUser.email.label" default="Correo" />
		
	</label>
	<g:textField name="email" value="${secAppUserInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="secAppUser.accountLocked.label" default="Cuenta Bloqueada" />
		
	</label>
	<g:checkBox name="accountLocked" value="${secAppUserInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="secAppUser.enabled.label" default="Cuenta Activa" />
		
	</label>
	<g:checkBox name="enabled" value="${secAppUserInstance?.enabled}" />
</div>
<br>
<%@ page import="user.SecAppUser" %>



<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="secAppUser.username.label" default="Username" />
	</label>
	<g:textField name="username" required="" value="${secAppUserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="secAppUser.password.label" default="Password" />
	</label>
	<g:textField name="password" required="" value="${secAppUserInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="secAppUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${secAppUserInstance?.accountExpired}" />
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="secAppUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${secAppUserInstance?.accountLocked}" />
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="secAppUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${secAppUserInstance?.enabled}" />
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="secAppUser.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${secAppUserInstance?.name}"/>
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="secAppUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${secAppUserInstance?.passwordExpired}" />
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'photo', 'error')} required">
	<label for="photo">
		<g:message code="secAppUser.photo.label" default="Photo" />
	</label>
	<input type="file" id="photo" name="photo" />
</div>


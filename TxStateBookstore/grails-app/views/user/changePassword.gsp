<%@ page import="txstatebookstore.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="noSearch">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<script type="text/javascript">
		    function confirmPass() {
			    
		        if(form1.password.value != form1.cpassword.value) {
		            alert('Passwords dont match !');
		        }
		    }

		    function clearPassword() {
		    	document.getElementById("password").value = "";
		    	document.getElementById("cpassword").value = "";
		    }
        </script>
    
	</head>
	<body onload="clearPassword()">
		<a href="#changePassword-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
				<div id="changePassword-user" class="content scaffold-edit" role="main">
			<h1><g:message code="Change Password" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:userInstance, action:'update']" method="PUT" name="form1">
				<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<label for="newPassword">
						<g:message code="user.newPassword.label" default="NewPassword" />
						<span class="required-indicator">*</span>
					</label>
					<g:field type="password" name="password" id="password" maxlength="30" required="" value="${userInstance?.password}"/>
				
				</div>
				<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<label for="confirmPassword">
						<g:message code="user.confirmPassword.label" default="ConfirmPassword" />
						<span class="required-indicator">*</span>
					</label>
					<g:field type="password" name="cpassword" id="cpassword" maxlength="30" required="" onblur="confirmPass()" />
				</div>
				</br>				
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<%-- <title><g:message code="default.create.label" args="[entityName]" /></title>--%>
	</head>
	<body>
		<a href="#create-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<%-- <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="create-address" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${addressInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${addressInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:addressInstance, action:'save']" >
			<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'addressLine1', 'error')} required">
				<label for="addressLine1">
					<g:message code="address.addressLine1.label" default="Address Line1" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="addressLine1" maxlength="30" required="" value="${addressInstance?.addressLine1}"/>
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'addressLine2', 'error')} required">
				<label for="addressLine2">
					<g:message code="address.addressLine2.label" default="Address Line2" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="addressLine2" maxlength="30" required="" value="${addressInstance?.addressLine2}"/>
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} required">
				<label for="state">
					<g:message code="address.state.label" default="State" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="state" maxlength="20" required="" value="${addressInstance?.state}"/>
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zipCode', 'error')} required">
				<label for="zipCode">
					<g:message code="address.zipCode.label" default="Zip Code" />
					<span class="required-indicator">*</span>
				</label>
				<g:field name="zipCode" type="number" min="10000" max="99999" value="${addressInstance?.zipCode}" required=""/>
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'addressType', 'error')} required">
				<label for="addressType">
					<g:message code="address.addressType.label" default="Address Type" />
					<span class="required-indicator">*</span>
				</label>
				<g:select name="addressType" from="${['mailing','billing']}" required="" value="${addressInstance?.addressType}" valueMessagePrefix="address.addressType" noSelection="['': '']"/>
			
			</div>
			 
			<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'user', 'error')} required" hidden="true">
				<label for="user">
					<g:message code="address.user.label" default="User" />
					<span class="required-indicator">*</span>
				</label>
				<g:select id="user" name="user.id" from="${txstatebookstore.User.list()}" optionKey="id" required="" value="${addressInstance?.user?.id}" class="many-to-one" noSelection="['': '']"/>
			
			</div>
			<fieldset class="buttons">
				<g:submitButton name="submit" class="save" value="${message(code: 'default.button.submit.label', default: 'Submit')}" />
			</fieldset>
			</g:form>
		</div>
	</body>
</html>
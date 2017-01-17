<%@ page import="txstatebookstore.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="noSearch">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<%--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		--%>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			<g:form url="[resource:userInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<%--<div class="menu">
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'addresses', 'error')} ">
					<ul class="one-to-many">
					<g:each in="${userInstance?.addresses?}" var="a">
					    <li><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					
					<ul>
					<li class="edit">
					
					<li class="edit">
					
					<g:link controller="address" action="edit" params="['user.id': userInstance?.id]">${message(code: 'default.edit.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
					</li>
					--%>
					<%--</ul>--%>
					<%--
					<ul class="one-to-many">
					<g:each in="${userInstance?.addresses?}" var="a">
					    <li><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					
					<li class="add">
					
					<li><g:link controller="address" action="index" params="['user.id': userInstance?.id]">${message(code: 'default.show.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
					<li>
					<g:link controller="address" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
					</li>
					</ul>
					</div>
					--%>
					<%--</ul>
				</fieldset>--%>
				<fieldset class="buttons">
				<ul>
				<li>
					<g:submitButton name="submit" class="update" params="['user.id': userInstance?.id]" value="${message(code: 'default.button.saveNnext.label', default: 'Save and Next')}" />
					</li>
					</ul>
				</fieldset>
				</div>
			</g:form>
		</div>
	</body>
</html>

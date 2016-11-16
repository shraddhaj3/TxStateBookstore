
<%@ page import="txstatebookstore.WaitingUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'waitingUser.label', default: 'WaitingUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-waitingUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-waitingUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list waitingUser">
			
				<g:if test="${waitingUserInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="waitingUser.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${waitingUserInstance?.user?.id}">${waitingUserInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${waitingUserInstance?.dateRequested}">
				<li class="fieldcontain">
					<span id="dateRequested-label" class="property-label"><g:message code="waitingUser.dateRequested.label" default="Date Requested" /></span>
					
						<span class="property-value" aria-labelledby="dateRequested-label"><g:formatDate date="${waitingUserInstance?.dateRequested}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${waitingUserInstance?.book}">
				<li class="fieldcontain">
					<span id="book-label" class="property-label"><g:message code="waitingUser.book.label" default="Book" /></span>
					
						<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${waitingUserInstance?.book?.id}">${waitingUserInstance?.book?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:waitingUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${waitingUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

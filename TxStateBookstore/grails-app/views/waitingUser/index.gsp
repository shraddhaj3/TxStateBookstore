
<%@ page import="txstatebookstore.WaitingUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'waitingUser.label', default: 'WaitingUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-waitingUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<%--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		--%><div id="list-waitingUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="waitingUser.user.label" default="User" /></th>
					
						<g:sortableColumn property="dateRequested" title="${message(code: 'waitingUser.dateRequested.label', default: 'Date Requested')}" />
					
						<th><g:message code="waitingUser.book.label" default="Book" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${waitingUserInstanceList}" status="i" var="waitingUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${waitingUserInstance.id}">${fieldValue(bean: waitingUserInstance, field: "user")}</g:link></td>
					
						<td><g:formatDate date="${waitingUserInstance.dateRequested}" /></td>
					
						<td>${fieldValue(bean: waitingUserInstance, field: "book")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${waitingUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

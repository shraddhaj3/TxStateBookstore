
<%@ page import="txstatebookstore.UserOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userOrder.label', default: 'UserOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userOrder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="userOrder.user.label" default="User" /></th>
					
						<g:sortableColumn property="orderDate" title="${message(code: 'userOrder.orderDate.label', default: 'Order Date')}" />
					
						<g:sortableColumn property="paymentMode" title="${message(code: 'userOrder.paymentMode.label', default: 'Payment Mode')}" />
					
						<g:sortableColumn property="pickupDate" title="${message(code: 'userOrder.pickupDate.label', default: 'Pickup Date')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'userOrder.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="orderComments" title="${message(code: 'userOrder.orderComments.label', default: 'Order Comments')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userOrderInstanceList}" status="i" var="userOrderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userOrderInstance.id}">${fieldValue(bean: userOrderInstance, field: "user")}</g:link></td>
					
						<td><g:formatDate date="${userOrderInstance.orderDate}" /></td>
					
						<td>${fieldValue(bean: userOrderInstance, field: "paymentMode")}</td>
					
						<td><g:formatDate date="${userOrderInstance.pickupDate}" /></td>
					
						<td>${fieldValue(bean: userOrderInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: userOrderInstance, field: "orderComments")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userOrderInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

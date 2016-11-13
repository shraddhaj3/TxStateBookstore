
<%@ page import="txstatebookstore.UserOrderDetail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userOrderDetail.label', default: 'UserOrderDetail')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userOrderDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userOrderDetail" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="userOrderDetail.book.label" default="Book" /></th>
					
						<g:sortableColumn property="quantity" title="${message(code: 'userOrderDetail.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="unitPrice" title="${message(code: 'userOrderDetail.unitPrice.label', default: 'Unit Price')}" />
					
						<th><g:message code="userOrderDetail.userOrder.label" default="User Order" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userOrderDetailInstanceList}" status="i" var="userOrderDetailInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userOrderDetailInstance.id}">${fieldValue(bean: userOrderDetailInstance, field: "book")}</g:link></td>
					
						<td>${fieldValue(bean: userOrderDetailInstance, field: "quantity")}</td>
					
						<td>${fieldValue(bean: userOrderDetailInstance, field: "unitPrice")}</td>
					
						<td>${fieldValue(bean: userOrderDetailInstance, field: "userOrder")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userOrderDetailInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

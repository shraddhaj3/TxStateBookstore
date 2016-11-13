
<%@ page import="txstatebookstore.UserOrderDetail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userOrderDetail.label', default: 'UserOrderDetail')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userOrderDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userOrderDetail" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userOrderDetail">
			
				<g:if test="${userOrderDetailInstance?.book}">
				<li class="fieldcontain">
					<span id="book-label" class="property-label"><g:message code="userOrderDetail.book.label" default="Book" /></span>
					
						<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${userOrderDetailInstance?.book?.id}">${userOrderDetailInstance?.book?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userOrderDetailInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="userOrderDetail.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${userOrderDetailInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userOrderDetailInstance?.unitPrice}">
				<li class="fieldcontain">
					<span id="unitPrice-label" class="property-label"><g:message code="userOrderDetail.unitPrice.label" default="Unit Price" /></span>
					
						<span class="property-value" aria-labelledby="unitPrice-label"><g:fieldValue bean="${userOrderDetailInstance}" field="unitPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userOrderDetailInstance?.userOrder}">
				<li class="fieldcontain">
					<span id="userOrder-label" class="property-label"><g:message code="userOrderDetail.userOrder.label" default="User Order" /></span>
					
						<span class="property-value" aria-labelledby="userOrder-label"><g:link controller="userOrder" action="show" id="${userOrderDetailInstance?.userOrder?.id}">${userOrderDetailInstance?.userOrder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userOrderDetailInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userOrderDetailInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

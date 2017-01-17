<%@ page import="txstatebookstore.UserOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userOrder.label', default: 'PastUserOrder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pastuserOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				
			</ul>
		</div>
		<div id="show-pastuserOrder" class="content scaffold-show" role="main">
			<h1>Past Orders</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userOrder">
			
				<g:if test="${userOrderInstance?.id}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="userOrder.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${userOrderInstance?.id}">${userOrderInstance?.id.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userOrderInstance?.orderDate}">
				<li class="fieldcontain">
					<span id="orderDate-label" class="property-label"><g:message code="userOrder.orderDate.label" default="Order Date" /></span>
					
						<span class="property-value" aria-labelledby="orderDate-label"><g:formatDate date="${userOrderInstance?.orderDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userOrderInstance?.paymentMode}">
				<li class="fieldcontain">
					<span id="paymentMode-label" class="property-label"><g:message code="userOrder.paymentMode.label" default="Payment Mode" /></span>
					
						<span class="property-value" aria-labelledby="paymentMode-label"><g:fieldValue bean="${userOrderInstance}" field="paymentMode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userOrderInstance?.pickupDate}">
				<li class="fieldcontain">
					<span id="pickupDate-label" class="property-label"><g:message code="userOrder.pickupDate.label" default="Pickup Date" /></span>
					
						<span class="property-value" aria-labelledby="pickupDate-label"><g:formatDate date="${userOrderInstance?.pickupDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userOrderInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="userOrder.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${userOrderInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userOrderInstance?.orderComments}">
				<li class="fieldcontain">
					<span id="orderComments-label" class="property-label"><g:message code="userOrder.orderComments.label" default="Order Comments" /></span>
					
						<span class="property-value" aria-labelledby="orderComments-label"><g:fieldValue bean="${userOrderInstance}" field="orderComments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userOrderInstance?.userOrderDetails}">
				<li class="fieldcontain">
					<span id="userOrderDetails-label" class="property-label"><g:message code="userOrder.userOrderDetails.label" default="User Order Details" /></span>
					
						<g:each in="${userOrderInstance.userOrderDetails}" var="u">
						<span class="property-value" aria-labelledby="userOrderDetails-label"><g:link controller="userOrderDetail" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
		</div>
	</body>
</html>

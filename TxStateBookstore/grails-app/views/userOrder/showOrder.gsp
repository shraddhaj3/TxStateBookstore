
<%@ page import="txstatebookstore.UserOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userOrder.label', default: 'UserOrder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-userOrder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userOrder">
			
				<g:if test="${userOrderInstance?.id}">
				<li class="fieldcontain">
					<span id="orderid-label" class="property-label"></span>
					
						<span class="property-value" style="color: teal"><b>Your Order ID is: <g:fieldValue bean="${userOrderInstance}" field="id"/></b></span>
					
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
				<li class="fieldcontain">
					<B>
					<span id="orderComments-label" class="property-label">Total</span>
					
					<span class="property-value">$ ${orderTotal }</span>
					</B>
				</li>
			
				<li class="fieldcontain">
					<span id="userOrderDetails-label" class="property-label"><b>Order contains: </b></span>
						<%--<span class="property-value" aria-labelledby="userOrderDetails-label"><g:link controller="userOrderDetail" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						--%>
					<table>
						<thead>
							<tr>
								<td>Book</td>
								<td></td>
								<td>Price</td>
								<td>Quantity</td>
							</tr>
						</thead>
							<tbody>
								<g:each in="${orderDetails}" var="item">
									
									<tr>
										<td>
											<span><img width="100px" src="${createLink(controller:'Book', action:'showPayload', id: item.book.id)}"/></span>
										</td>
										<td>
											<b><g:link controller="Book" action="show" id="${item.book.id}">${item.book.title}</g:link></b><g:if test="${item.book.authors} != null"> by ${item.book.authors} </g:if>
											<br/>
											Published by: ${item.book.publisher } 
											<br/>
											Published in year: ${item.book.yearOfPublication}
											<br/>
											ISBN: ${item.book.isbn }											
										</td>
										<td>
											<b>$ ${item.unitPrice }</b>
										</td>
										<td>			
											<b>${item.quantity }</b>					
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>
				</li>
			</ol>
		</div>
	</body>
</html>

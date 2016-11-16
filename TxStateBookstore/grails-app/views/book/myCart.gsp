<%@ page import="txstatebookstore.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>My Shopping Cart</title>
	</head>
	<body>
		<div style="margin: 20px;">	
			<h1>My Shopping Cart</h1>
			<a href="#list-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<g:if test="${session.myCart == null || session.myCart.isEmpty() }">
				<h3>Your shopping cart is empty!</h3>
			</g:if>
			<g:else>
				<table>
					<thead>
						<tr>
							<td>Book</td>
							<td></td>
							<td>Price</td>
							<td>Quantity</td>
							<td>Actions</td>
						</tr>
					</thead>
					<tbody>
						<g:each in="${session.myCart}" var="item">
							<tr>
								<td>
									<span><img width="100px" src="${createLink(controller:'Book', action:'showPayload', id: item.key)}"/></span>
								</td>
								<td>
									<b><g:link controller="Book" action="show" id="${item.key}">${item.value.title }</g:link></b>
									<br/>
									ISBN: ${item.value.isbn }
									<br/>
								</td>
								<td>
									<b>$ ${item.value.price }</b>
								</td>
								<td>
									<b>${item.value.quantity }</b>
								</td>
								<td>
										<g:link controller="Book" action="deleteFromCart" id="${item.key }">Delete</g:link>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</g:else>
		</div>
	</body>
</html>
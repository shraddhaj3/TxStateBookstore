<%@ page import="txstatebookstore.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title>Book Search Results</title>
	</head>
	<body>
		<a href="#list-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div style="margin: 20px;">
			<g:if test="${searchResults  == null || searchResults.isEmpty()}">
				<h3>Sorry, no matching book found!</h3>
			</g:if>
			<g:else>
				<h1>Search Results</h1>
				<table>
					<thead>
						<tr>
							<td>Book Image</td>
							<td>Book Details</td>
							<td>Actions</td>
						</tr>
					</thead>
					<tbody>
						<g:each in="${searchResults }" var="book">
							<tr>
								<td><span><img width="100px" src="${createLink(controller:'Book', action:'showPayload', id: book.id)}"/></span></td>
								<td>
									<b>${book.title} </b><g:if test="${book.authors} != null"> by ${book.authors} </g:if>
									<br/>
									Published by: ${book.publisher } 
									<br/>
									Published in year: ${book.yearOfPublication}
									<br/>
									ISBN: ${book.isbn }
									<br/>
									<b>Price: $ ${book.price }</b>
									<g:if test="${book.quantity <= 0}">
										<h3 style="color: teal;"><i>Out of Stock!</i></h3>
									</g:if>
								</td>
								<td>
									<%--If the user is admin --%>
									<g:if test="${session.user.role == 'admin' }">
										<g:link controller="Book" action="edit" id="${book.id }">Edit Book</g:link> 
									</g:if>
									<g:else>
										<%--For users other than admin --%>
										<g:if test="${book.quantity <= 0}">
											<g:link controller="Book" action="addToWaitingList" id="${book.id }">Add to Waiting List</g:link>
										</g:if>
										<g:else test="${book.quantity > 0}">
											<g:link controller="Book" action="addToCart" id="${book.id }">Add to Cart</g:link>
										</g:else>
									</g:else>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</g:else>
		</div>
	</body>
</html>
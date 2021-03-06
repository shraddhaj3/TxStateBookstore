
<%@ page import="txstatebookstore.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<%--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		--%><div id="show-book" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list book">
			
				<g:if test="${bookInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="book.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${bookInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.isbn}">
				<li class="fieldcontain">
					<span id="isbn-label" class="property-label"><g:message code="book.isbn.label" default="Isbn" /></span>
					
						<span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${bookInstance}" field="isbn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.publisher}">
				<li class="fieldcontain">
					<span id="publisher-label" class="property-label"><g:message code="book.publisher.label" default="Publisher" /></span>
					
						<span class="property-value" aria-labelledby="publisher-label"><g:fieldValue bean="${bookInstance}" field="publisher"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.yearOfPublication}">
				<li class="fieldcontain">
					<span id="yearOfPublication-label" class="property-label"><g:message code="book.yearOfPublication.label" default="Year Of Publication" /></span>
					
						<span class="property-value" aria-labelledby="yearOfPublication-label"><g:fieldValue bean="${bookInstance}" field="yearOfPublication"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.bookImage}">
				<li class="fieldcontain">
					<span id="bookImage-label" class="property-label"><g:message code="book.bookImage.label" default="Book Image" /></span>
					<span><img width="100px" src="${createLink(controller:'Book', action:'showPayload', id: bookInstance.id)}"/></span>
				</li>
				</g:if>
			
				<%--<g:if test="${bookInstance?.bookImageType}">
				<li class="fieldcontain">
					<span id="bookImageType-label" class="property-label"><g:message code="book.bookImageType.label" default="Book Image Type" /></span>
					
						<span class="property-value" aria-labelledby="bookImageType-label"><g:fieldValue bean="${bookInstance}" field="bookImageType"/></span>
					
				</li>
				</g:if>
				--%>
				
				<g:if test="${bookInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="book.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${bookInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.authors}">
				<li class="fieldcontain">
					<span id="authors-label" class="property-label"><g:message code="book.authors.label" default="Authors" /></span>
					
						<g:each in="${bookInstance.authors}" var="a">
						<span class="property-value" aria-labelledby="authors-label"><g:link controller="author" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="book.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${bookInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.subjects}">
				<li class="fieldcontain">
					<span id="subjects-label" class="property-label"><g:message code="book.subjects.label" default="Subjects" /></span>
					
						<g:each in="${bookInstance.subjects}" var="s">
						<span class="property-value" aria-labelledby="subjects-label"><g:link controller="subject" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<%--<g:if test="${bookInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="book.users.label" default="Users" /></span>
					
						<g:each in="${bookInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				--%><%--<g:if test="${bookInstance?.waitingUsers}">
				<li class="fieldcontain">
					<span id="waitingUsers-label" class="property-label"><g:message code="book.waitingUsers.label" default="Waiting Users" /></span>
					
						<g:each in="${bookInstance.waitingUsers}" var="w">
						<span class="property-value" aria-labelledby="waitingUsers-label"><g:link controller="waitingUser" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			--%></ol>
			<g:form url="[resource:bookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

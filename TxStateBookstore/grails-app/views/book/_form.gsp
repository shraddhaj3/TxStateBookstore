<%@ page import="txstatebookstore.Book" %>
<%@ page import="txstatebookstore.Author" %>


<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="book.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="60" required="" value="${bookInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'isbn', 'error')} required">
	<label for="isbn">
		<g:message code="book.isbn.label" default="Isbn" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="isbn" maxlength="15" required="" value="${bookInstance?.isbn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'publisher', 'error')} required">
	<label for="publisher">
		<g:message code="book.publisher.label" default="Publisher" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="publisher" maxlength="60" required="" value="${bookInstance?.publisher}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'yearOfPublication', 'error')} ">
	<label for="yearOfPublication">
		<g:message code="book.yearOfPublication.label" default="Year Of Publication" />
		
	</label>
	<g:field name="yearOfPublication" type="number" min="1900" max="2050" value="${bookInstance.yearOfPublication}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'bookImage', 'error')} ">
	<label for="bookImage">
		<g:message code="book.bookImage.label" default="Book Image" />
		
	</label>
	<input type="file" id="bookImage" name="bookImage" />

</div>

<%--<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'bookImageType', 'error')} ">
	<label for="bookImageType">
		<g:message code="book.bookImageType.label" default="Book Image Type" />
		
	</label>
	<g:textField name="bookImageType" value="${bookInstance?.bookImageType}"/>

</div>

--%>
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="book.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" min="0" value="${bookInstance.quantity}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'authors', 'error')} ">
	<label for="authors">
		<g:message code="book.authors.label" default="Authors" />
		
	</label>
<%-- 	<ul class="one-to-many"> 
 <g:select name="authors" from ="${texasbookstore.Author.list()}"  required="" value="${authorInstance?.authorName}" valueMessagePrefix="author.authorName"/>
	 
	</ul> --%>
	
<ul class="one-to-many">
<g:each in="${bookInstance?.authors?}" var="a">
    <li><g:link controller="author" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="author" action="create" params="['book.id': bookInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'author.label', default: 'Author')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="book.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price"  type= "number" value="${fieldValue(bean: bookInstance, field: 'price')}" required=""/>

</div>

<%--<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'subjects', 'error')} ">
	<label for="subjects">
		<g:message code="book.subjects.label" default="Subjects" />
		
	</label>
	<g:select name="subjects" from="${txstatebookstore.Subject.list()}" multiple="multiple" optionKey="id" size="5" value="${bookInstance?.subjects*.id}" class="many-to-many"/>

</div>

--%><%--<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="book.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${txstatebookstore.User.list()}" multiple="multiple" optionKey="id" size="5" value="${bookInstance?.users*.id}" class="many-to-many"/>

</div>

--%>
<%--<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'waitingUsers', 'error')} ">
	<label for="waitingUsers">
		<g:message code="book.waitingUsers.label" default="Waiting Users" />
		
	</label>
	
--%><%--<ul class="one-to-many">
<g:each in="${bookInstance?.waitingUsers?}" var="w">
    <li><g:link controller="waitingUser" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="waitingUser" action="create" params="['book.id': bookInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'waitingUser.label', default: 'WaitingUser')])}</g:link>
</li>
</ul>


--%></div>


<%@ page import="txstatebookstore.Author" %>



<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'authorName', 'error')} required">
	<label for="authorName">
		<g:message code="author.authorName.label" default="Author Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authorName" maxlength="50" required="" value="${authorInstance?.authorName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'book', 'error')} required">
	<label for="book">
		<g:message code="author.book.label" default="Book" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="book" name="book.id" from="${txstatebookstore.Book.list()}" optionKey="id" required="" value="${authorInstance?.book?.id}" class="many-to-one"/>

</div>


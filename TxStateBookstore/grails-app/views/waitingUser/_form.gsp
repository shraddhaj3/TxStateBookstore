<%@ page import="txstatebookstore.WaitingUser" %>



<div class="fieldcontain ${hasErrors(bean: waitingUserInstance, field: 'user', 'error')} required" hidden = "true">
	<label for="user">
		<g:message code="waitingUser.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${txstatebookstore.User.list()}" optionKey="id" required="" value="${waitingUserInstance?.user?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: waitingUserInstance, field: 'dateRequested', 'error')} required" hidden="true">
	<label for="dateRequested">
		<g:message code="waitingUser.dateRequested.label" default="Date Requested" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateRequested" precision="day"  value="${waitingUserInstance?.dateRequested}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: waitingUserInstance, field: 'book', 'error')} required">
	<label for="book">
		<g:message code="waitingUser.book.label" default="Book" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="book" name="book.id" from="${txstatebookstore.Book.list()}" optionKey="id" required="" value="${waitingUserInstance?.book?.id}" class="many-to-one"/>

</div>


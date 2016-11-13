<%@ page import="txstatebookstore.Subject" %>



<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'courseName', 'error')} required">
	<label for="courseName">
		<g:message code="subject.courseName.label" default="Course Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="courseName" maxlength="60" required="" value="${subjectInstance?.courseName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'courseNumber', 'error')} required">
	<label for="courseNumber">
		<g:message code="subject.courseNumber.label" default="Course Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="courseNumber" maxlength="6" required="" value="${subjectInstance?.courseNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'books', 'error')} ">
	<label for="books">
		<g:message code="subject.books.label" default="Books" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="subject.users.label" default="Users" />
		
	</label>
	

</div>


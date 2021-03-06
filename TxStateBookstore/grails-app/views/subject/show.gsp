<%@ page import="txstatebookstore.Book" %>

<%@ page import="txstatebookstore.Subject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subject.label', default: 'Subject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-subject" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subject">
			
				<g:if test="${subjectInstance?.courseName}">
				<li class="fieldcontain">
					<span id="courseName-label" class="property-label"><g:message code="subject.courseName.label" default="Course Name" /></span>
					
						<span class="property-value" aria-labelledby="courseName-label"><g:fieldValue bean="${subjectInstance}" field="courseName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.courseNumber}">
				<li class="fieldcontain">
					<span id="courseNumber-label" class="property-label"><g:message code="subject.courseNumber.label" default="Course Number" /></span>
					
						<span class="property-value" aria-labelledby="courseNumber-label"><g:fieldValue bean="${subjectInstance}" field="courseNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.courseBooks}">
				<li class="fieldcontain">
					<span id="books-label" class="property-label"><g:message code="subject.books.label" default="Books" /></span>
					
						<g:each in="${subjectInstance.courseBooks.split(',')}" var="b">
							<g:if test="${b != null || b != '' }">
								<span class="property-value" aria-labelledby="books-label"><g:link controller="book" action="show" id="${b }">${Book.get(b) }</g:link></span>
							</g:if>
						</g:each>					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="subject.users.label" default="Users" /></span>
					
						<g:each in="${subjectInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:subjectInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:if test="${session.user.role == 'admin' }"><g:link class="edit" action="edit" resource="${subjectInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</g:if>
					<g:link class="list" action="addBooksForCourse" resource="${subjectInstance}">Add Books for Course</g:link>
					
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

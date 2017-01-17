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
			<h1>Add books for subject</h1>
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
				<br>
				
				<g:form action="addBooks" method="get">
					<g:select name="booksToAdd" from="${books }" optionKey="id" optionValue="title" multiple="true" />
					<g:hiddenField name="subject" value="${subjectInstance.id }" />
					<g:submitButton name="Submit" value="Add Books to Course"/>
				</g:form>
			</ol>
		</div>
	</body>
</html>

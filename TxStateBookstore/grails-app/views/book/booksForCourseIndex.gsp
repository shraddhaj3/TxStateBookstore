<%@ page import="txstatebookstore.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Search Books for Course</title>
	</head>
	<body>
		<div id="list-book" class="content scaffold-list" role="main">
			<h1>Search Books for Course</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
		<g:form controller="Book" action="getBooks"></g:form>
	</body>
</html>
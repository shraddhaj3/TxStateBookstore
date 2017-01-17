
<%@ page import="txstatebookstore.UserOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Generate report</title>
	</head>
	<body>
		<div id="list-userOrder" class="content scaffold-list" role="main">
			<h1>Select Report Interval</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
		<g:form action="getReport" method="GET">
		Month: <g:select name="month" from="[1,2,3,4,5,6,7,8,9,10,11,12]"/>
		Year: <g:select name="year" from="[2016,2015,2014,2013,2012,2011,2010]"/>
		<g:submitButton name="submit" value="Generate Report"/>
		</g:form>
		
		
	</body>
</html>
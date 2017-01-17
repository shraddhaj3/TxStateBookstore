
<%@ page import="txstatebookstore.UserOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Get report</title>
	</head>
	<body>
		<div id="list-userOrder" class="content scaffold-list" role="main">
			<h1>Select Report Interval</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
		<div style="margin: 20px">
			<g:form action="getReport" method="GET">
			Month: <g:select name="month" from="[1,2,3,4,5,6,7,8,9,10,11,12]"/>
			Year: <g:select name="year" from="[2016,2015,2014,2013,2012,2011,2010]"/>
			<g:submitButton name="submit" value="Generate Report"/>
			</g:form>
			
			<g:if test="${orders }">
				<h3 style="color: maroon; margin: 8px;">Report for Month: ${orderMonth } and Year: ${orderYear } </h3>
				<table>
					<thead style="font-weight: bold;">
						<tr>
							<td>Order Id</td>
							<td>Order Date</td>
							<td>Book/s</td>
						</tr>
						<tr colspan="3"><hr/></tr>
					</thead>
					<tbody>
						<g:each var="order" in="${orders }">
							<tr>
								<td>${order.id }</td>
								<td>${order.orderDate.toString().substring(0, 10) }</td>
								<td>
									<g:each var="item" in="${order.userOrderDetails }">
										<g:link controller="Book" action="show" id="${item.book.id }" >${item.book.title }</g:link>-(${item.quantity })
										<br/>
									</g:each>
								</td>							
							</tr>
						</g:each>
					</tbody>
				</table>
			</g:if>
		</div>
	</body>
</html>
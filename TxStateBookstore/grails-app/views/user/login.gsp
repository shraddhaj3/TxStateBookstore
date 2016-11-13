<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:meta name="app.name"/>: Login</title>
	</head>
	<body>
		<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>
		<div style="margin: 20px;">
			<h1>TxState Online Bookstore Login</h1>
			Use your TxState login credentials
		</div>
		<g:form action="validate">
			<table>
				<tr class="prop">
					<td class="name" style="text-align: right;"><label for="username">User Name (NetId)</label></td>
					<td class="value"><input type="text" id="username" name="username" value=""></td>
				</tr>
				<tr class="prop">
					<td class="name" style="text-align: right;"><label for="password">Password</label></td>
					<td class="value"><input type="password" id="password" name="password" value=""></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="login"/></td>
				</tr>
			</table>
		</g:form>
	</body>
</html>
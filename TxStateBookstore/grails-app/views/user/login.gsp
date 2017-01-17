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
		<div style="margin: 20px; text-align: center;">
			<h1 style = "text-align: center;">TxState Online Bookstore Login</h1>
			</br>
			Use your TxState login credentials.
			<%-- <br />--%>
			Don't have an account?Click on
        	<g:link controller="user" action="registration">Account Registration</g:link>
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
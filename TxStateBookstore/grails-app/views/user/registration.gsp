<%@ page import="txstatebookstore.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>Account Registration</title>
		<script type="text/javascript">
		    function confirmPass() {
			    
		        if(form1.password.value != form1.cpassword.value) {
		            alert('Passwords dont match !');
		        }
		    }
        </script>
	</head>
	<body>
			<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<g:if test="${request.getSession(false) && session.user }">
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</g:if>
			</ul>
		</div>
		<div id="create-user" class="content scaffold-create" role="main">
			<%-- <h1><g:message code="default.create.label" args="[entityName]" /></h1>--%>
			<h1 style="text-align: center;">Account Registration</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<%--<g:form url="[resource:userInstance, action:'save']" name="form1">--%>
			 <g:form  action = "saveRegistration" name="form1">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
				<label for="firstName">
				<g:message code="user.firstName.label" default="First Name" />
				<span class="required-indicator">*</span>
				</label>
				<g:textField name="firstName" maxlength="60" required="" value="${userInstance?.firstName}"/>

			</div>
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
				<label for="lastName">
					<g:message code="user.lastName.label" default="Last Name" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="lastName" maxlength="60" required="" value="${userInstance?.lastName}"/>
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
				<label for="userName">
					<g:message code="user.userName.label" default="User Name" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="userName" maxlength="8" required="" value="${userInstance?.userName}"/>
			
			</div>
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
				<label for="email">
					<g:message code="user.email.label" default="Email" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="email" maxlength="50" required="" value="${userInstance?.email}"/>
			
			</div>
			<div class="fieldcontain" ${hasErrors(bean: userInstance, field: 'phone', 'error')} >
				<label for="phone">
					<g:message code="user.phone.label" default="Phone" />				
				</label>
				<g:textField name="phone" type="number"  min="1000000000" max="9999999999" required="" value="${userInstance?.phone}"  />
			</div>		
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="password">
					<g:message code="user.password.label" default="Password" />
					<span class="required-indicator">*</span>
				</label>
				<g:field type="password" name="password" id="password" maxlength="30" required="" value="${userInstance?.password}"/>
			
			</div>
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="confirmPassword">
					<g:message code="user.confirmPassword.label" default="ConfirmPassword" />
					<span class="required-indicator">*</span>
				</label>
				<g:field type="password" name="cpassword" id="cpassword" maxlength="30" required="" onblur="confirmPass()" />
			</div>	
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} required">
				<label for="role">
					<g:message code="user.role.label" default="Role" />
					<span class="required-indicator">*</span>
				</label>
				<g:select name="role" from="${['student','faculty']}"  value="${userInstance?.role}" valueMessagePrefix="user.role" noSelection="['': '']"/>
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nameOnCard', 'error')} ">
				<label for="nameOnCard">
					<g:message code="user.nameOnCard.label" default="Name On Card" />
					
				</label>
				<g:textField name="nameOnCard" maxlength="60" value="${userInstance?.nameOnCard}"/>
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'cardType', 'error')} ">
				<label for="cardType">
					<g:message code="user.cardType.label" default="Card Type" />
					
				</label>
				<g:select name="cardType" from="${['Visa','Mastercard','Discover','American Express']}" value="${userInstance?.cardType}" valueMessagePrefix="user.cardType" noSelection="['': '']"/>
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'cardNumber', 'error')} ">
				<label for="cardNumber">
					<g:message code="user.cardNumber.label" default="Card Number" />
					
				</label>
				<g:textField name="cardNumber" maxlength="16" value="${userInstance?.cardNumber}"/>
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'cvv', 'error')} ">
				<label for="cvv">
					<g:message code="user.cvv.label" default="Cvv" />
					
				</label>
					<g:textField name="cvv" type="number" value="${userInstance?.cvv}" />
			
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'expirationDate', 'error')} ">
				<label for="expirationDate">
					<g:message code="user.expirationDate.label" default="Expiration Date" />
					
				</label>
				<g:datePicker name="expirationDate" precision="day"  value="${userInstance?.expirationDate}" default="none" noSelection="['': '']" />
			
			</div>

			<%--
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'addresses', 'error')} ">
				<label for="addresses">
					<g:message code="user.addresses.label" default="Addresses" />
					
				</label>
			 	
			<ul class="one-to-many">
			<g:each in="${userInstance?.addresses?}" var="a">
			    <li><g:link controller="address" action="address" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
			</g:each>
			<li class="add">
			<g:link controller="address" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
			</li>
			</ul>
			
			
			</div>	
			--%>

			<fieldset class="buttons">
				<%--<g:submitButton name="submit" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />--%>
				<g:submitButton name="submit" class="saveRegistration" value="${message(code: 'default.button.savennext.label', default: 'Save and Next')}" />
				
			</fieldset>			
			</g:form>
		</div>	
	</body>
</html>


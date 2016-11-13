<%@ page import="txstatebookstore.User" %>



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

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="user.phone.label" default="Phone" />
		
	</label>
	<g:field name="phone" type="number" min="1000000000" max="9999999999" value="${userInstance.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" maxlength="30" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="user.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="role" from="${userInstance.constraints.role.inList}" required="" value="${userInstance?.role}" valueMessagePrefix="user.role"/>

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
	<g:select name="cardType" from="${userInstance.constraints.cardType.inList}" value="${userInstance?.cardType}" valueMessagePrefix="user.cardType" noSelection="['': '']"/>

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
	<g:field name="cvv" type="number" value="${userInstance.cvv}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'expirationDate', 'error')} ">
	<label for="expirationDate">
		<g:message code="user.expirationDate.label" default="Expiration Date" />
		
	</label>
	<g:datePicker name="expirationDate" precision="day"  value="${userInstance?.expirationDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'addresses', 'error')} ">
	<label for="addresses">
		<g:message code="user.addresses.label" default="Addresses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.addresses?}" var="a">
    <li><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="address" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'books', 'error')} ">
	<label for="books">
		<g:message code="user.books.label" default="Books" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'subjects', 'error')} ">
	<label for="subjects">
		<g:message code="user.subjects.label" default="Subjects" />
		
	</label>
	<g:select name="subjects" from="${txstatebookstore.Subject.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.subjects*.id}" class="many-to-many"/>

</div>


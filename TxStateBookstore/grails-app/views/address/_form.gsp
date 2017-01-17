<%@ page import="txstatebookstore.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'addressLine1', 'error')} required">
	<label for="addressLine1">
		<g:message code="address.addressLine1.label" default="Address Line1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="addressLine1" maxlength="30" required="" value="${addressInstance?.addressLine1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'addressLine2', 'error')} required">
	<label for="addressLine2">
		<g:message code="address.addressLine2.label" default="Address Line2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="addressLine2" maxlength="30" required="" value="${addressInstance?.addressLine2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="address.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" maxlength="20" required="" value="${addressInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zipCode', 'error')} required">
	<label for="zipCode">
		<g:message code="address.zipCode.label" default="Zip Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="zipCode" type="number" min="10000" max="99999" value="${addressInstance?.zipCode}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'addressType', 'error')} required">
	<label for="addressType">
		<g:message code="address.addressType.label" default="Address Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="addressType" from="${['mailing','billing']}" required="" value="${addressInstance?.addressType}" valueMessagePrefix="address.addressType" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'user', 'error')} required" hidden="">
	<label for="user">
		<g:message code="address.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${txstatebookstore.User.list()}" optionKey="id" required="" value="${addressInstance?.user?.id}" class="many-to-one" noSelection="['': '']"/>

</div>


<%@ page import="txstatebookstore.UserOrder" %>



<div class="fieldcontain ${hasErrors(bean: userOrderInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userOrder.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${txstatebookstore.User.list()}" optionKey="id" required="" value="${userOrderInstance?.user?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userOrderInstance, field: 'orderDate', 'error')} required">
	<label for="orderDate">
		<g:message code="userOrder.orderDate.label" default="Order Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="orderDate" precision="day"  value="${userOrderInstance?.orderDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userOrderInstance, field: 'paymentMode', 'error')} required">
	<label for="paymentMode">
		<g:message code="userOrder.paymentMode.label" default="Payment Mode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="paymentMode" from="${userOrderInstance.constraints.paymentMode.inList}" required="" value="${userOrderInstance?.paymentMode}" valueMessagePrefix="userOrder.paymentMode"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userOrderInstance, field: 'pickupDate', 'error')} ">
	<label for="pickupDate">
		<g:message code="userOrder.pickupDate.label" default="Pickup Date" />
		
	</label>
	<g:datePicker name="pickupDate" precision="day"  value="${userOrderInstance?.pickupDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: userOrderInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="userOrder.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${userOrderInstance.constraints.status.inList}" required="" value="${userOrderInstance?.status}" valueMessagePrefix="userOrder.status"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userOrderInstance, field: 'orderComments', 'error')} ">
	<label for="orderComments">
		<g:message code="userOrder.orderComments.label" default="Order Comments" />
		
	</label>
	<g:textField name="orderComments" maxlength="100" value="${userOrderInstance?.orderComments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userOrderInstance, field: 'userOrderDetails', 'error')} ">
	<label for="userOrderDetails">
		<g:message code="userOrder.userOrderDetails.label" default="User Order Details" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userOrderInstance?.userOrderDetails?}" var="u">
    <li><g:link controller="userOrderDetail" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userOrderDetail" action="create" params="['userOrder.id': userOrderInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userOrderDetail.label', default: 'UserOrderDetail')])}</g:link>
</li>
</ul>


</div>


<%@ page import="txstatebookstore.UserOrderDetail" %>



<div class="fieldcontain ${hasErrors(bean: userOrderDetailInstance, field: 'book', 'error')} required">
	<label for="book">
		<g:message code="userOrderDetail.book.label" default="Book" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="book" name="book.id" from="${txstatebookstore.Book.list()}" optionKey="id" required="" value="${userOrderDetailInstance?.book?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userOrderDetailInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="userOrderDetail.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" min="1" value="${userOrderDetailInstance.quantity}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userOrderDetailInstance, field: 'unitPrice', 'error')} required">
	<label for="unitPrice">
		<g:message code="userOrderDetail.unitPrice.label" default="Unit Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="unitPrice" value="${fieldValue(bean: userOrderDetailInstance, field: 'unitPrice')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userOrderDetailInstance, field: 'userOrder', 'error')} required">
	<label for="userOrder">
		<g:message code="userOrderDetail.userOrder.label" default="User Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userOrder" name="userOrder.id" from="${txstatebookstore.UserOrder.list()}" optionKey="id" required="" value="${userOrderDetailInstance?.userOrder?.id}" class="many-to-one"/>

</div>


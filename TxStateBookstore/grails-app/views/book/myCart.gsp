<%@ page import="txstatebookstore.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>My Shopping Cart</title>		
	</head>
	<body>
		<g:javascript>
			function modifyBookQuantity(q,id){
				var url="<g:createLink controller='Book' action='updateCart' id='ID' params='[quantity:'QUANTITY']'></g:createLink>"
				url = url.replace("ID", id);
				url = url.replace("QUANTITY", q);
				window.location.href=url;
			}
			
			function showElement(id){
				var e = document.getElementById(id);
				if(e!=null){
					if(e.style.display == 'none')
						e.style.display = 'block';
				}
			}
			
			function managePayment(paymentMethod, cardType){
				
				var cardYesDiv = document.getElementById('CreditCardYes_div');
				var chk = document.getElementById('checkout_btn');
				
				/*Payment method id cash*/
				if(paymentMethod == 'Cash'){
					/*hide card details*/
					if(cardYesDiv != null){cardYesDiv.style.display = 'none';}							
					
					/*enable button*/
					if(chk != null) chk.disabled = false;	
					return;
				}
				else if(paymentMethod == 'Credit Card'){
					if(chk != null) chk.disabled = true;	
					
					/* credit card details saved*/
					if(cardType != null && cardType != '' ){
						
						if(cardYesDiv != null){cardYesDiv.style.display = 'block';}
						
						/*enable button*/
						if(chk != null) chk.disabled = false;	
					}else{
						
						if(cardYesDiv != null){cardYesDiv.style.display = 'none';}
						
						/*disable button*/
						if(chk != null) chk.disabled = true;
					}
					return;
				}
				else{
					if(chk != null) chk.disabled = true;
					return;
				}
			}
		</g:javascript>
		<div style="margin: 20px;">	
			
			<%--<g:set var="user" value="${session.user }"></g:set>
			--%>
			<h1>Shopping Cart</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<a href="#list-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<g:if test="${session.myCart == null || session.myCart.isEmpty() }">
				<h3>Your shopping cart is empty!</h3>
			</g:if>
			<g:elseif test="${session.myCart.size() == 1 && session.myCart.containsKey('subtotal') }">
				<h3>Your shopping cart is empty!</h3>
			</g:elseif>
			<g:else>
				<g:form controller="UserOrder" action="checkout">
					<table>
						<thead>
							<tr>
								<td>Book</td>
								<td></td>
								<td>Price</td>
								<td>Quantity</td>
								<td>Actions</td>
							</tr>
						</thead>
						<tbody>
							<g:each in="${session.myCart}" var="item">
								<g:if test="${item.key != 'subtotal'}">
								<tr>
									<td>
										<span><img width="100px" src="${createLink(controller:'Book', action:'showPayload', id: item.key)}"/></span>
									</td>
									<td>
										<b><g:link controller="Book" action="show" id="${item.key}">${item.value.title}</g:link></b>
										<br/>
										ISBN: ${item.value.isbn }
										<br/>
									</td>
									<td>
										<b>$ ${item.value.price }</b>
									</td>
									<td>			
										<g:select name="sel_bookQuantity" from="[1,2,3,4,5,6,7,8,9,10]" value="${item.value.quantity }" 
													onchange="modifyBookQuantity(this.value, ${item.key });"/>												
									</td>
									<td>
										<g:link controller="Book" action="deleteFromCart" id="${item.key }">Delete</g:link>
									</td>
								</tr>
								</g:if>
							</g:each>
						</tbody>
						<tfoot>
							<tr><td colspan="5"><hr/></td></tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><h4>Subtotal(<span id="spn_bookcount">${session.myCart.get("subtotal").get("quantity")}</span> Book(s)):</h4></td>
								<td><h4 style="color: maroon;">$ <span id="spn_amount">${session.myCart.get("subtotal").get("amount")}</span></h4></td>
							</tr>
							<tr><td colspan="5"><hr/></td></tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td colspan='2'><input type="button" value="Proceed to Checkout" onclick="showElement('paymentMethod_div');showElement('checkout_div');showElement('CreditCardDetails_div');managePayment('select','');"></input></td>
							</tr>
							<tr>
								<td colspan = '5'>
									<div id="paymentMethod_div" style="display: none">
										<div class="fieldcontain ${hasErrors(bean: user, field: 'paymentMode', 'error')} required">
											<label for="paymentMode">
												<g:message code="userOrder.paymentMode.label" default="Payment Mode" />
												<span class="required-indicator">*</span>
											</label>
											<g:select name="paymentMode" from="['select','Cash','Credit Card']" required="" onchange="managePayment(this.value,'${user.cardType}');"/>
										</div>
									</div>									
								</td>
							</tr>
							<tr>
								<td colspan='5' ">
									<div id="CreditCardDetails_div" style="display: none; text-align: left;">
										
										<div id="CreditCardNo_div" style="color: maroon;">
											You can manage your payment methods by clicking on link below.
										</div>										
										
										<div id="CreditCardYes_div" style="color: maroon; display:none; text-align: left;">
											<g:if test="${user?.cardType}">
												<li class="fieldcontain">
													<span id="cardType-label" class="property-label"><g:message code="user.cardType.label" default="Card Type" /></span>
														<span class="property-value" >${user.cardType}</span>													
												</li>
											</g:if>
											<g:if test="${user?.cardNumber}">
												<li class="fieldcontain">
													<span id="cardNumber-label" class="property-label"><g:message code="user.cardNumber.label" default="Card Number" /></span>													
														<span class="property-value" >${user.cardNumber}</span>
												</li>											
											</g:if>										
										</div>
										
										<g:link controller="User" action="edit" id="${session.userId }">Manage Payment Methods</g:link>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td colspan='2'><div id="checkout_div" style="display: none;"><input id="checkout_btn" type="submit" value="Checkout"></input></div></td>
							</tr>
						</tfoot>
					</table>
				</g:form>
			</g:else>
		</div>
	</body>
</html>
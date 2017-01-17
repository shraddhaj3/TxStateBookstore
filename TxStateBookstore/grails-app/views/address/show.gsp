
<%@ page import="txstatebookstore.Address" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="noSearch">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<g:if test="${request.getSession(false) && session.user }">
				</g:if>
				<g:else>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				</g:else>
				<g:if test="${request.getSession(false) && session.user }">
				<%--<li><g:link class="list" action="index" params="['user.id': addressInstance?.user?.id]"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				--%></g:if>
				<li><g:link class="create" action="create" params="['user.id': addressInstance?.user?.id]"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-address" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list address">
			
				<g:if test="${addressInstance?.addressLine1}">
				<li class="fieldcontain">
					<span id="addressLine1-label" class="property-label"><g:message code="address.addressLine1.label" default="Address Line1" /></span>
					
						<span class="property-value" aria-labelledby="addressLine1-label"><g:fieldValue bean="${addressInstance}" field="addressLine1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.addressLine2}">
				<li class="fieldcontain">
					<span id="addressLine2-label" class="property-label"><g:message code="address.addressLine2.label" default="Address Line2" /></span>
					
						<span class="property-value" aria-labelledby="addressLine2-label"><g:fieldValue bean="${addressInstance}" field="addressLine2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="address.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${addressInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.zipCode}">
				<li class="fieldcontain">
					<span id="zipCode-label" class="property-label"><g:message code="address.zipCode.label" default="Zip Code" /></span>
					
						<%--<span class="property-value" aria-labelledby="zipCode-label"><g:fieldValue bean="${addressInstance}" field="zipCode"/></span>--%>
						<span class="property-value" aria-labelledby="zipCode-label">${addressInstance?.zipCode.encodeAsHTML()} </span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.addressType}">
				<li class="fieldcontain">
					<span id="addressType-label" class="property-label"><g:message code="address.addressType.label" default="Address Type" /></span>
					
						<span class="property-value" aria-labelledby="addressType-label"><g:fieldValue bean="${addressInstance}" field="addressType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="address.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${addressInstance?.user?.id}">Go to profile</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:if test="${request.getSession(false) && session.user }">
			<g:form url="[resource:addressInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
				
					<g:link class="edit" action="edit" resource="${addressInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<%-- <g:actionSubmit class="delete" action="delete" params="['user.id': addressInstance?.user?.id]" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
				</fieldset>
			</g:form>
			</g:if>
			
		</div>
	</body>
</html>

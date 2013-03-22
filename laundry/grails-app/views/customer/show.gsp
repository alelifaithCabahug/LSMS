
<%@ page import="lsmsfinal.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
	<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
		
		<li class="active"><a href="http://localhost:8080/laundry/customer/create">Add Customer Transaction</a></li>
		<li class="active"><a href="http://localhost:8080/laundry/customer/list">See List</a></li>
		
					<fieldset class="buttons">
					<g:form action="searchCustomer" controller="customer" class="">
					<g:textField name="lastname" value="${params.input}" size="20" placeholder="Search Customer"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
					</fieldset>
		</div>
		
			<g:if test="${flash.message}">
			<div class="alert alert-info">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
		<div class="container-fluid">
		
		<div class="span8">
		<div class="hero-unit">
		
			<h1>Customer</h1>
			
				<g:if test="${customerInstance?.firstName}">
					<h3><span id="firstName-label" class="property-label"><g:message code="customer.firstName.label" default="First Name" /></span></h3>
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${customerInstance}" field="firstName"/></span>
				</g:if>
			
				<g:if test="${customerInstance?.middleName}">
					<h3><span id="middleName-label" class="property-label"><g:message code="customer.middleName.label" default="Middle Name" /></span></h3>
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${customerInstance}" field="middleName"/></span>
				</g:if>
			
				<g:if test="${customerInstance?.lastName}">
					<h3><span id="lastName-label" class="property-label"><g:message code="customer.lastName.label" default="Last Name" /></span></h3>
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${customerInstance}" field="lastName"/></span>
				</g:if>
			
				<g:if test="${customerInstance?.contact}">
					<h3><span id="contact-label" class="property-label"><g:message code="customer.contact.label" default="Contact" /></span></h3>
						<span class="property-value" aria-labelledby="contact-label"><g:fieldValue bean="${customerInstance}" field="contact"/></span>
				</g:if>
			
				<g:if test="${customerInstance?.address}">
					<h3><span id="address-label" class="property-label"><g:message code="customer.address.label" default="Address" /></span></h3>
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${customerInstance}" field="address"/></span>
				</g:if>
			
				<g:if test="${customerInstance?.email}">
					<h3><span id="email-label" class="property-label"><g:message code="customer.email.label" default="Email" /></span></h3>
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${customerInstance}" field="email"/></span>
				</g:if>
			
				<g:if test="${customerInstance?.availLaundryDate}">
					<h3><span id="availLaundryDate-label" class="property-label"><g:message code="customer.availLaundryDate.label" default="Avail Laundry Date" /></span></h3>
						<span class="property-value" aria-labelledby="availLaundryDate-label"><g:formatDate date="${customerInstance?.availLaundryDate}" /></span>
				</g:if>
			
				<g:if test="${customerInstance?.laundryStatus}">
					<h3><span id="laundryStatus-label" class="property-label"><g:message code="customer.laundryStatus.label" default="Laundry Status" /></span></h3>
						<span class="property-value" aria-labelledby="laundryStatus-label"><g:fieldValue bean="${customerInstance}" field="laundryStatus"/></span>
				</g:if>
			
				<g:if test="${customerInstance?.packageName}">
					<h3><span id="packageName-label" class="property-label"><g:message code="customer.packageName.label" default="Package Name" /></span></h3>
						<span class="property-value" aria-labelledby="packageName-label"><g:link controller="customPackage" action="show" id="${customerInstance?.packageName?.id}">${customerInstance?.packageName?.encodeAsHTML()}</g:link></span>
				</g:if>
			
				<g:if test="${customerInstance?.customPackage}">
					<h3><span id="customPackage-label" class="property-label"><g:message code="customer.customPackage.label" default="Custom Package" /></span></h3>
						<g:each in="${customerInstance.customPackage}" var="c">
						<span class="property-value" aria-labelledby="customPackage-label"><g:link controller="customPackage" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
				</g:if>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${customerInstance?.id}" />
					<!-- <g:link class="edit" action="edit" id="${customerInstance?.id}"><g:message code="" default="Edit" />Update Info</g:link> -->
					<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /> -->
					<g:actionSubmit class="update" action="laundryMail" value="${message(code: 'default.button.emailUpdate.label', default: 'Send Email Update')}" />
					<!-- <g:actionSubmit class="edit" action="edit" id="${customerInstance?.id}" value="${message(code: 'default.button.infoUpdate.label', default: 'Update Info')}" /> -->
				</fieldset> 
			</g:form>
		</div>
	</body>
</html>

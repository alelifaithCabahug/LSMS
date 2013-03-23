
<%@ page import="laundry.Laundry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'laundry.label', default: 'Laundry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-laundry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-laundry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list laundry">
			
				<g:if test="${laundryInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="laundry.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${laundryInstance?.customer?.id}">${laundryInstance?.customer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${laundryInstance?.customPackage}">
				<li class="fieldcontain">
					<span id="customPackage-label" class="property-label"><g:message code="laundry.customPackage.label" default="Custom Package" /></span>
					
						<span class="property-value" aria-labelledby="customPackage-label"><g:link controller="customPackage" action="show" id="${laundryInstance?.customPackage?.id}">${laundryInstance?.customPackage?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${laundryInstance?.availLaundryDate}">
				<li class="fieldcontain">
					<span id="availLaundryDate-label" class="property-label"><g:message code="laundry.availLaundryDate.label" default="Avail Laundry Date" /></span>
					
						<span class="property-value" aria-labelledby="availLaundryDate-label"><g:formatDate date="${laundryInstance?.availLaundryDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${laundryInstance?.laundryStatus}">
				<li class="fieldcontain">
					<span id="laundryStatus-label" class="property-label"><g:message code="laundry.laundryStatus.label" default="Laundry Status" /></span>
					
						<span class="property-value" aria-labelledby="laundryStatus-label"><g:fieldValue bean="${laundryInstance}" field="laundryStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${laundryInstance?.id}" />
					<g:link class="edit" action="edit" id="${laundryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

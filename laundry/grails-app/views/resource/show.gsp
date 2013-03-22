
<%@ page import="lsmsfinal.Resource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/laundry/resource/create">Add Resource</a></li>
		<li class="active"><a href="http://localhost:8080/laundry/resource/list">See List</a></li>
		
					<fieldset class="buttons">
					<g:form action="searchResource" controller="resource" class="">
					<g:textField name="name" value="${params.input}" size="20" placeholder="Search Resource"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
					</fieldset>
		</div>
		
			<g:if test="${flash.message}">
			<div class="alert alert-error">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
		<div class="container-fluid">
		
		<div class="span8">
		<div class="hero-unit">
		
			<h1>Resource</h1>
			
				<g:if test="${resourceInstance?.name}">
					<h3><span id="name-label" class="property-label"><g:message code="resource.name.label" default="Name" /></span></h3>
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${resourceInstance}" field="name"/></span>
				</g:if>
			
				<g:if test="${resourceInstance?.quantity}">
					<h3><span id="quantity-label" class="property-label"><g:message code="resource.quantity.label" default="Quantity" /></span></3>
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${resourceInstance}" field="quantity"/></span>
				</g:if>
		
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${resourceInstance?.id}" />
					<g:link class="edit" action="edit" id="${resourceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

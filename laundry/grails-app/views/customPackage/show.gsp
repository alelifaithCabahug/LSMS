
<%@ page import="lsmsfinal.CustomPackage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customPackage.label', default: 'CustomPackage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
	<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/laundry/customPackage/create">Create Custom Package</a></li>
		<li class="active"><a href="http://localhost:8080/laundry/customPackage/list">See List</a></li>
   
		<fieldset class="buttons">
					<g:form action="searchCustomPackage" controller="customPackage" class="">
					<g:textField name="packagename" value="${params.input}" size="20" placeholder="Search CustomPackage"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
		</fieldset>
		</div>
	
		<!-- <a href="#show-customPackage" class="skip" tabindex="-1"></a>
		<div align="right">	
					<fieldset class="buttons">
					<g:form action="searchCustomPackage" controller="customPackage" class="">
					<g:textField name="packagename" value="${params.input}" size="20" placeholder="Search CustomPackage"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
					</fieldset>
		</div>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-customPackage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1> -->
			
			<g:if test="${flash.message}">
			<div class="alert alert-error">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
		<div class="container-fluid">
		
		<div class="span8">
		<div class="hero-unit">
		
			<h1>Custom Package</h1>
			
				<g:if test="${customPackageInstance?.packageName}">
					<h3><span id="packageName-label" class="property-label"><g:message code="customPackage.packageName.label" default="Package Name" /></span></h3>
						<span class="property-value" aria-labelledby="packageName-label"><g:fieldValue bean="${customPackageInstance}" field="packageName"/></span>
				</g:if>
			
				<g:if test="${customPackageInstance?.clothesKilo}">
					<h3><span id="clothesKilo-label" class="property-label"><g:message code="customPackage.clothesKilo.label" default="Clothes Kilo" /></span></h3>
						<span class="property-value" aria-labelledby="clothesKilo-label"><g:fieldValue bean="${customPackageInstance}" field="clothesKilo"/></span>
				</g:if>
			
				<g:if test="${customPackageInstance?.packagePrice}">
					<h3><span id="packagePrice-label" class="property-label"><g:message code="customPackage.packagePrice.label" default="Package Price" /></span></h3>
						<span class="property-value" aria-labelledby="packagePrice-label"><g:fieldValue bean="${customPackageInstance}" field="packagePrice"/></span>
				</g:if>
			
				<g:if test="${customPackageInstance?.resource}">
					<h3><span id="resource-label" class="property-label"><g:message code="customPackage.resource.label" default="Resource" /></span></h3>
						<g:each in="${customPackageInstance.resource}" var="r">
						<span class="property-value" aria-labelledby="resource-label"><g:link controller="resource" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
				</g:if>
		
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${customPackageInstance?.id}" />
					<g:link class="edit" action="edit" id="${customPackageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /> -->
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

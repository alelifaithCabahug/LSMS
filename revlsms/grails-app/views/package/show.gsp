
<%@ page import="revlsms.Package" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'package.label', default: 'Package')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-package" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-package" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list package">
			
				<g:if test="${packageInstance?.packageName}">
				<li class="fieldcontain">
					<span id="packageName-label" class="property-label"><g:message code="package.packageName.label" default="Package Name" /></span>
					
						<span class="property-value" aria-labelledby="packageName-label"><g:fieldValue bean="${packageInstance}" field="packageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.packageCreated}">
				<li class="fieldcontain">
					<span id="packageCreated-label" class="property-label"><g:message code="package.packageCreated.label" default="Package Created" /></span>
					
						<span class="property-value" aria-labelledby="packageCreated-label"><g:formatDate date="${packageInstance?.packageCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.packagePrice}">
				<li class="fieldcontain">
					<span id="packagePrice-label" class="property-label"><g:message code="package.packagePrice.label" default="Package Price" /></span>
					
						<span class="property-value" aria-labelledby="packagePrice-label"><g:fieldValue bean="${packageInstance}" field="packagePrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="package.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:link controller="resources" action="show" id="${packageInstance?.name?.id}">${packageInstance?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.quantityNeeded}">
				<li class="fieldcontain">
					<span id="quantityNeeded-label" class="property-label"><g:message code="package.quantityNeeded.label" default="Quantity Needed" /></span>
					
						<span class="property-value" aria-labelledby="quantityNeeded-label"><g:fieldValue bean="${packageInstance}" field="quantityNeeded"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.resources}">
				<li class="fieldcontain">
					<span id="resources-label" class="property-label"><g:message code="package.resources.label" default="Resources" /></span>
					
						<g:each in="${packageInstance.resources}" var="r">
						<span class="property-value" aria-labelledby="resources-label"><g:link controller="resources" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${packageInstance?.id}" />
					<g:link class="edit" action="edit" id="${packageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

<%@ page import="lsms.Crew" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'crew.label', default: 'Crew')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	
	<body>
	
	<!-- CREW INFORMATION -->
	
		<!-- <a href="#show-crew" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a> -->
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		
		  <div id="show-crew" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if> 
			<ol class="property-list crew">
			
				<g:if test="${crewInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="crew.lastName.label" default="Last Name" /></span>
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${crewInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crewInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="crew.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${crewInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crewInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="crew.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${crewInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crewInstance?.contactNum}">
				<li class="fieldcontain">
					<span id="contactNum-label" class="property-label"><g:message code="crew.contactNum.label" default="Contact Num" /></span>
					
						<span class="property-value" aria-labelledby="contactNum-label"><g:fieldValue bean="${crewInstance}" field="contactNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crewInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="crew.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${crewInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${crewInstance?.job}">
				<li class="fieldcontain">
					<span id="job-label" class="property-label"><g:message code="crew.job.label" default="Job" /></span>
					
						<span class="property-value" aria-labelledby="job-label"><g:fieldValue bean="${crewInstance}" field="job"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${crewInstance?.id}" />
					<g:link class="edit" action="edit" id="${crewInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

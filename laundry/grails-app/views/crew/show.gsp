
<%@ page import="lsmsfinal.Crew" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'crew.label', default: 'Crew')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	
	<body>
	
	<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/laundry/crew/create">Add Crew</a></li>
		<li class="active"><a href="http://localhost:8080/laundry/crew/list">See List</a></li>
		<li class="active"><a href="http://localhost:8080/laundry/job/list">See Job</a></li>
   
		<fieldset class="buttons">
					<g:form action="searchCrew" controller="crew" class="">
					<g:textField name="lastname" value="${params.input}" size="20" placeholder="Search Crew"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
		</fieldset>
		</div>
		
		<%-- <a href="#show-crew" class="skip" tabindex="-1"></a>
		
		<div align="right">	
					<fieldset class="buttons">
					<g:form action="searchCrew" controller="crew" class="">
					<g:textField name="lastname" value="${params.input}" size="20" placeholder="Search Crew"/>
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
		
		<div id="show-crew" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1> --%>
			
			<g:if test="${flash.message}">
			<div class="alert alert-error">
				<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
			<div class="container-fluid">
		
			<div class="span8">
			<div class="hero-unit">
		
					<h1>Crew</h1>
			
				<g:if test="${crewInstance?.firstName}">
				<g:if test="${crewInstance?.middleName}">
				<g:if test="${crewInstance?.lastName}">
					<h3>Full Name</h3>
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${crewInstance}" field="firstName"/></span>
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${crewInstance}" field="middleName"/>
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${crewInstance}" field="lastName"/></span>
				</g:if>
				</g:if>
				</g:if>
			
				<g:if test="${crewInstance?.contact}">
					<h3><span id="contact-label" class="property-label"><g:message code="crew.contact.label" default="Contact" /></span></h3>
						<span class="property-value" aria-labelledby="contact-label"><g:fieldValue bean="${crewInstance}" field="contact"/></span>
				</g:if>
			
				<g:if test="${crewInstance?.address}">
					<h3><span id="address-label" class="property-label"><g:message code="crew.address.label" default="Address" /></span></h3>
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${crewInstance}" field="address"/></span>
				</g:if>
			
				<g:if test="${crewInstance?.job}">
					<h3><span id="job-label" class="property-label"><g:message code="crew.job.label" default="Job" /></span></h3>
						<span class="property-value" aria-labelledby="job-label"><g:link controller="job" action="show" id="${crewInstance?.job?.id}">${crewInstance?.job?.encodeAsHTML()}</g:link></span>
				</g:if>
			
				<g:if test="${crewInstance?.jobDate}">
					<h3><span id="jobDate-label" class="property-label"><g:message code="crew.jobDate.label" default="Date Job Started" /></span></h3>
						<span class="property-value" aria-labelledby="jobDate-label"><g:formatDate format="yyyy-MM-dd" date="${crewInstance?.jobDate}" /></span>
				</g:if>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${crewInstance?.id}" />
					<!-- <g:link class="edit" action="edit" id="${crewInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link> -->
					<g:actionSubmit class="edit" action="edit" id="${crewInstance?.id}" value="${message(code: 'default.button.infoUpdate.label', default: 'Update Info')}" />
					<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /> -->
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

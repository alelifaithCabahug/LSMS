
<%@ page import="lsmsfinal.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/laundry/crew/list">See Crew</a></li>
	
					<fieldset class="buttons">
					<g:form action="searchJob" controller="job" class="">
					<g:textField name="jobname" value="${params.input}" size="20" placeholder="Search Job"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
					</fieldset>
		</div>
					
		<!-- <a href="#show-job" class="skip" tabindex="-1"></a>
		<div align="right">	
					<fieldset class="buttons">
					<g:form action="searchJob" controller="job" class="">
					<g:textField name="jobname" value="${params.input}" size="20" placeholder="Search Job"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
					</fieldset>
		</div>
		<div id="show-job" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1> -->
			
			<g:if test="${flash.message}">
			<div class="alert alert-error">
			<div class="message" role="status">${flash.message}</div>
			<div>
			</g:if>
			
		<div class="container-fluid">
		
		<div class="span8">
		<div class="hero-unit">
		
		<h1>Job Info</h1>
			
				<g:if test="${jobInstance?.jobName}">
					<h3><span id="jobName-label" class="property-label"><g:message code="job.jobName.label" default="Job Name" /></span></h3>
						<span class="property-value" aria-labelledby="jobName-label"><g:fieldValue bean="${jobInstance}" field="jobName"/></span>
				</g:if>
			
				<g:if test="${jobInstance?.crew}">
					<h3><span id="crew-label" class="property-label"><g:message code="job.crew.label" default="Crew" /></span></h3>
						<g:each in="${jobInstance.crew}" var="c">
						<span class="property-value" aria-labelledby="crew-label"><g:link controller="crew" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
				</g:if>
			
		<!-- 	<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${jobInstance?.id}" />
					<g:link class="edit" action="edit" id="${jobInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form> -->
		</div>
	</body>
</html>

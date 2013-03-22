<%@ page import="lsmsfinal.Crew" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'crew.label', default: 'Crew')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
	<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/laundry/crew/create">Add Crew</a></li>
		<li class="active"><a href="http://localhost:8080/laundry/job/list">See Job</a></li>
   
		<fieldset class="buttons">
					<g:form action="searchCrew" controller="crew" class="">
					<g:textField name="lastname" value="${params.input}" size="20" placeholder="Search Crew"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
		</fieldset>
		</div>
	
		<%-- <a href="#list-crew" class="skip" tabindex="-1"></a>
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
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --%>
		
		<!-- <div id="list-crew" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1> -->
			
			<g:if test="${flash.message}">
			<div class="alert alert-error">
				<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
		<!-- Crew Listing -->
			
		<div class="span8">
			
			<center><h3> Crew List </h3></center>
			<table class="table table-bordered">
				<thead>
				
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'crew.firstName.label', default: 'Full Name')}" />
					
						<!-- <g:sortableColumn property="middleName" title="${message(code: 'crew.middleName.label', default: 'Middle Name')}" /> -->
					
						<!-- <g:sortableColumn property="lastName" title="${message(code: 'crew.lastName.label', default: 'Last Name')}" /> -->
					
						<!-- <g:sortableColumn property="contact" title="${message(code: 'crew.contact.label', default: 'Contact')}" /> -->
					
						<!-- <g:sortableColumn property="address" title="${message(code: 'crew.address.label', default: 'Address')}" /> -->
						
						<th><g:message code="crew.job.label" default="Job" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${crewInstanceList}" status="i" var="crewInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${crewInstance.id}">${fieldValue(bean: crewInstance, field: "firstName")} ${fieldValue(bean: crewInstance, field: "middleName")} ${fieldValue(bean: crewInstance, field: "lastName")}</g:link></td>
					
						<!-- <td>${fieldValue(bean: crewInstance, field: "middleName")}</td> -->
					
					<!--	<td>${fieldValue(bean: crewInstance, field: "lastName")}</td> -->
					
						<!-- <td>${fieldValue(bean: crewInstance, field: "contact")}</td> -->
					
						<!-- <td>${fieldValue(bean: crewInstance, field: "address")}</td> -->
						
						<td>${fieldValue(bean: crewInstance, field: "job")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${crewInstanceTotal}" />
			</div>
		</div>
		</div>
			
	</body>
</html>


<%@ page import="lsmsfinal.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
	<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/laundry/customer/create">Add Customer Transaction</a></li>
		
				<fieldset class="buttons">
					<g:form action="searchCustomer" controller="customer" class="">
					<g:textField name="lastname" value="${params.input}" size="20" placeholder="Search Customer"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
				</fieldset>
		</div>
		
		
			<g:if test="${flash.message}">
			<div class="alert alert-error">
				<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
			<div class="span12">
			<center><h3> Customer List </h3></center>
			<table class="table table-bordered">
				<thead>
					<tr>
					
					
						<g:sortableColumn property="firstName" title="${message(code: 'customer.firstName.label', default: 'Full Name')}" />
					
						<!-- <g:sortableColumn property="middleName" title="${message(code: 'customer.middleName.label', default: 'Middle Name')}" /> -->
					
						<!-- <g:sortableColumn property="lastName" title="${message(code: 'customer.lastName.label', default: 'Last Name')}" /> -->
					
						<g:sortableColumn property="contact" title="${message(code: 'customer.contact.label', default: 'Contact')}" />
					
						<!-- <g:sortableColumn property="address" title="${message(code: 'customer.address.label', default: 'Address')}" /> -->
					
						<!-- <g:sortableColumn property="email" title="${message(code: 'customer.email.label', default: 'Email')}" /> -->
						
						<g:sortableColumn property="packageName" title="${message(code: 'customer.packageName.label', default: 'Package Availed')}" />
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerInstanceList}" status="i" var="customerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "firstName")} ${fieldValue(bean: customerInstance, field: "middleName")} ${fieldValue(bean: customerInstance, field: "lastName")} </g:link></td>
					
						<!-- <td>${fieldValue(bean: customerInstance, field: "middleName")}</td> -->
					
					<!--	<td>${fieldValue(bean: customerInstance, field: "lastName")}</td> -->
					
						<td>${fieldValue(bean: customerInstance, field: "contact")}</td>
						
						<td>${fieldValue(bean: customerInstance, field: "packageName")}</td>
					
					<!--	<td>${fieldValue(bean: customerInstance, field: "address")}</td> -->
					
					<!-- 	<td>${fieldValue(bean: customerInstance, field: "email")}</td> -->
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customerInstanceTotal}" />
		</div>
		</div>
		</div>
		</div>
	</body>
</html>


<%@ page import="lsmsfinal.Resource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/laundry/resource/create">Add Resource</a></li>
		
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
			
			<div class="span12">
			
			<center><h3> Resources List </h3></center>
			<table class="table table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'resource.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'resource.quantity.label', default: 'Quantity')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${resourceInstanceList}" status="i" var="resourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${resourceInstance.id}">${fieldValue(bean: resourceInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: resourceInstance, field: "quantity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${resourceInstanceTotal}" />
		</div>
			</div>
			</div>
		</div>
		
	</body>
</html>


<%@ page import="lsms.CustomPackage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customPackage.label', default: 'CustomPackage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	
	<body>
		<div class="container-fluid">
			<div class="row-fluid">
			
			<div class="span2">
			<a href="http://localhost:8080/lsms/customPackage/create" class="btn btn-large">Add New</a>
			</div>
		
			<div class="span10">
			<table class="table table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="packageName" title="${message(code: 'customPackage.packageName.label', default: 'Package Name')}" />
					
						<!-- <g:sortableColumn property="customQuantity" title="${message(code: 'customPackage.customQuantity.label', default: 'Custom Quantity')}" /> -->
					
						<g:sortableColumn property="price" title="${message(code: 'customPackage.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customPackageInstanceList}" status="i" var="customPackageInstance">
					<tr class="info ${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customPackageInstance.id}">${fieldValue(bean: customPackageInstance, field: "packageName")}</g:link></td>
					
						<!-- <td>${fieldValue(bean: customPackageInstance, field: "customQuantity")}</td> -->
					
						<td>${fieldValue(bean: customPackageInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div>
			</div>
			<div class="pagination">
				<g:paginate total="${customPackageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="lsmsfinal.CustomPackage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customPackage.label', default: 'CustomPackage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
	<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/laundry/customPackage/create">Create Custom Package</a></li>
   
		<fieldset class="buttons">
					<g:form action="searchCustomPackage" controller="customPackage" class="">
					<g:textField name="packagename" value="${params.input}" size="20" placeholder="Search CustomPackage"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
		</fieldset>
		</div>
		
		<!-- <a href="#list-customPackage" class="skip" tabindex="-1"></a>
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
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customPackage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1> -->
			
			<g:if test="${flash.message}">
			<div class="alert alert-error">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
		<div class="span12">
		
		<center><h3> Custom Laundry List </h3></center>
			<table class="table table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="packageName" title="${message(code: 'customPackage.packageName.label', default: 'Package Name')}" />
					
						<!-- <g:sortableColumn property="clothesKilo" title="${message(code: 'customPackage.clothesKilo.label', default: 'Clothes Kilo')}" /> -->
					
						<g:sortableColumn property="packagePrice" title="${message(code: 'customPackage.packagePrice.label', default: 'Package Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customPackageInstanceList}" status="i" var="customPackageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customPackageInstance.id}">${fieldValue(bean: customPackageInstance, field: "packageName")}</g:link></td>
					
						<!-- <td>${fieldValue(bean: customPackageInstance, field: "clothesKilo")}</td> -->
					
						<td>P ${fieldValue(bean: customPackageInstance, field: "packagePrice")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customPackageInstanceTotal}" />
		</div>
		</div>
		</div>
		
	</body>
</html>

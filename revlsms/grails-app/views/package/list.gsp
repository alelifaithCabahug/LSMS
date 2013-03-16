
<%@ page import="revlsms.Package" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'package.label', default: 'Package')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-package" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-package" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="packageName" title="${message(code: 'package.packageName.label', default: 'Package Name')}" />
					
						<g:sortableColumn property="packageCreated" title="${message(code: 'package.packageCreated.label', default: 'Package Created')}" />
					
						<g:sortableColumn property="packagePrice" title="${message(code: 'package.packagePrice.label', default: 'Package Price')}" />
					
						<th><g:message code="package.name.label" default="Name" /></th>
					
						<g:sortableColumn property="quantityNeeded" title="${message(code: 'package.quantityNeeded.label', default: 'Quantity Needed')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${packageInstanceList}" status="i" var="packageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${packageInstance.id}">${fieldValue(bean: packageInstance, field: "packageName")}</g:link></td>
					
						<td><g:formatDate date="${packageInstance.packageCreated}" /></td>
					
						<td>${fieldValue(bean: packageInstance, field: "packagePrice")}</td>
					
						<td>${fieldValue(bean: packageInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: packageInstance, field: "quantityNeeded")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${packageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

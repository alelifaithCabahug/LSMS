
<%@ page import="laundry.Laundry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'laundry.label', default: 'Laundry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-laundry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-laundry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="laundry.customer.label" default="Customer" /></th>
					
						<th><g:message code="laundry.customPackage.label" default="Custom Package" /></th>
					
						<g:sortableColumn property="availLaundryDate" title="${message(code: 'laundry.availLaundryDate.label', default: 'Avail Laundry Date')}" />
					
						<g:sortableColumn property="laundryStatus" title="${message(code: 'laundry.laundryStatus.label', default: 'Laundry Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${laundryInstanceList}" status="i" var="laundryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${laundryInstance.id}">${fieldValue(bean: laundryInstance, field: "customer")}</g:link></td>
					
						<td>${fieldValue(bean: laundryInstance, field: "customPackage")}</td>
					
						<td><g:formatDate date="${laundryInstance.availLaundryDate}" /></td>
					
						<td>${fieldValue(bean: laundryInstance, field: "laundryStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${laundryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

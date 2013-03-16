
<%@ page import="revlsms.Crew" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'crew.label', default: 'Crew')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-crew" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-crew" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'crew.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'crew.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'crew.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="contact" title="${message(code: 'crew.contact.label', default: 'Contact')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'crew.address.label', default: 'Address')}" />
					
						<th><g:message code="crew.job.label" default="Job" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${crewInstanceList}" status="i" var="crewInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${crewInstance.id}">${fieldValue(bean: crewInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: crewInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: crewInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: crewInstance, field: "contact")}</td>
					
						<td>${fieldValue(bean: crewInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: crewInstance, field: "job")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${crewInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

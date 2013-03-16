
<%@ page import="revlsms.AvailLaundryService" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'availLaundryService.label', default: 'AvailLaundryService')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-availLaundryService" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-availLaundryService" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'availLaundryService.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'availLaundryService.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'availLaundryService.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="contact" title="${message(code: 'availLaundryService.contact.label', default: 'Contact')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'availLaundryService.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'availLaundryService.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${availLaundryServiceInstanceList}" status="i" var="availLaundryServiceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${availLaundryServiceInstance.id}">${fieldValue(bean: availLaundryServiceInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: availLaundryServiceInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: availLaundryServiceInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: availLaundryServiceInstance, field: "contact")}</td>
					
						<td>${fieldValue(bean: availLaundryServiceInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: availLaundryServiceInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${availLaundryServiceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

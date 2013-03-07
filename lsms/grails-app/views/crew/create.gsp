<%@ page import="lsms.Crew" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'crew.label', default: 'Crew')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
	<div class="container-fluid">
  <div class="row-fluid">
    <div class="span2">
    </div>
	
    <div class="span8">
		<div id="create-crew" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${crewInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${crewInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Ok')}" />
				</fieldset>
			</g:form>
		</div>
	 </div>
  </div>
</html>

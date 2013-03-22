<%@ page import="lsmsfinal.Resource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="container-fluid">
		<div class="row-fluid">
		<div class="span2">
		</div>
		
		<div class="span8">
		
		<div id="create-resource" class="content scaffold-create" role="main">
			<h1>Add Resource Form</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:hasErrors bean="${resourceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${resourceInstance}" var="error">
			<!-- 	<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>></li> --> 
			<g:message error=""/><div class="alert alert-info">This Resource is already saved!</div>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>

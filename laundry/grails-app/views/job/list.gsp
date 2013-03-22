
<%@ page import="lsmsfinal.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
	<br><br>
	
		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 1px #d3d3d3;">
	
		<li class="active"><a href="http://localhost:8080/laundry/crew/list">See Crew</a></li>
	
					<fieldset class="buttons">
					<g:form action="searchJob" controller="job" class="">
					<g:textField name="jobname" value="${params.input}" size="20" placeholder="Search Job"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
					</fieldset>
					
		</div>
	
		<!-- <a href="#list-job" class="skip" tabindex="-1"></a>
		<div align="right">	
					<fieldset class="buttons">
					<g:form action="searchJob" controller="job" class="">
					<g:textField name="jobname" value="${params.input}" size="20" placeholder="Search Job"/>
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
		<div id="list-job" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1> -->
			
			<g:if test="${flash.message}">
			<div class="alert alert-error">
			<div class="message" role="status">${flash.message}</div>
			</div>
			</g:if>
			
			<div class="span8">
			
			<center><h3> Job List </h3></center>
			<table class="table table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="jobName" title="${message(code: 'job.jobName.label', default: 'Job Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${jobInstanceList}" status="i" var="jobInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${jobInstance.id}">${fieldValue(bean: jobInstance, field: "jobName")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${jobInstanceTotal}" />
			</div>
		</div>
		</div>
	</body>
</html>

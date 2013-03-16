<%@ page import="revlsms.Job" %>



<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'jobName', 'error')} ">
	<label for="jobName">
		<g:message code="job.jobName.label" default="Job Name" />
		
	</label>
	<g:textField name="jobName" value="${jobInstance?.jobName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'crew', 'error')} ">
	<label for="crew">
		<g:message code="job.crew.label" default="Crew" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${jobInstance?.crew?}" var="c">
    <li><g:link controller="crew" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="crew" action="create" params="['job.id': jobInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'crew.label', default: 'Crew')])}</g:link>
</li>
</ul>

</div>


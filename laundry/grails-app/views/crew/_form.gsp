<%@ page import="lsmsfinal.Crew" %>

<div class="fieldcontain ${hasErrors(bean: crewInstance, field: 'jobDate', 'error')} required">
	<label for="jobDate">
		<g:message code="crew.jobDate.label" default="Job Date" />
		<span class="required-indicator"><i><small> (Required)</small></i></span>
	</label>
	<i class="icon-calendar"></i>
	<g:datePicker name="jobDate" precision="day"  value="${crewInstance?.jobDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: crewInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="crew.firstName.label" default="First Name" />
		<span class="required-indicator"><i><small> (Required)</small></i></span>
	</label>
	<i class="icon-user"></i>
	<g:textField name="firstName" required="" value="${crewInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: crewInstance, field: 'middleName', 'error')} required">
	<label for="middleName">
		<g:message code="crew.middleName.label" default="Middle Name" />
	<span class="required-indicator"><i><small> (Required)</small></i></span>
	</label>
	<i class="icon-user"></i>
	<g:textField name="middleName" required="" value="${crewInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: crewInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="crew.lastName.label" default="Last Name" />
		<span class="required-indicator"><i><small> (Required)</small></i></span>
	</label>
	<i class="icon-user"></i>
	<g:textField name="lastName" required="" value="${crewInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: crewInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="crew.contact.label" default="Contact" />
		<span class="required-indicator"><i><small> (Required)</small></i></span>
	</label>
	<i class="icon-user"></i>
	<g:textField name="contact" required="" value="${crewInstance?.contact}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: crewInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="crew.address.label" default="Address" />
		<span class="required-indicator"><i><small> (Required)</small></i></span>
	</label>
	<i class="icon-user"></i>
	<g:textField name="address" value="${crewInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: crewInstance, field: 'job', 'error')} required">
	<label for="job">
		<g:message code="crew.job.label" default="Job" />
		<span class="required-indicator"><i><small> (Required)</small></i></span>
	</label>
	<i class="icon-user"></i>
	<g:select id="job" name="job.id" from="${lsmsfinal.Job.list()}" optionKey="id" required="" value="${crewInstance?.job?.id}" class="many-to-one"/>
</div>


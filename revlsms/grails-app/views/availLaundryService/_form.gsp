<%@ page import="revlsms.AvailLaundryService" %>



<div class="fieldcontain ${hasErrors(bean: availLaundryServiceInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="availLaundryService.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${availLaundryServiceInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: availLaundryServiceInstance, field: 'middleName', 'error')} required">
	<label for="middleName">
		<g:message code="availLaundryService.middleName.label" default="Middle Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" required="" value="${availLaundryServiceInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: availLaundryServiceInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="availLaundryService.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${availLaundryServiceInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: availLaundryServiceInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="availLaundryService.contact.label" default="Contact" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contact" required="" value="${availLaundryServiceInstance?.contact}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: availLaundryServiceInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="availLaundryService.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${availLaundryServiceInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: availLaundryServiceInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="availLaundryService.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${availLaundryServiceInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: availLaundryServiceInstance, field: 'availLaundryDate', 'error')} required">
	<label for="availLaundryDate">
		<g:message code="availLaundryService.availLaundryDate.label" default="Avail Laundry Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="availLaundryDate" precision="day"  value="${availLaundryServiceInstance?.availLaundryDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: availLaundryServiceInstance, field: 'packageName', 'error')} required">
	<label for="packageName">
		<g:message code="availLaundryService.packageName.label" default="Package Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="packageName" name="packageName.id" from="${revlsms.Package.list()}" optionKey="id" required="" value="${availLaundryServiceInstance?.packageName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: availLaundryServiceInstance, field: 'laundryStatus', 'error')} ">
	<label for="laundryStatus">
		<g:message code="availLaundryService.laundryStatus.label" default="Laundry Status" />
		
	</label>
	<g:select name="laundryStatus" from="${availLaundryServiceInstance.constraints.laundryStatus.inList}" value="${availLaundryServiceInstance?.laundryStatus}" valueMessagePrefix="availLaundryService.laundryStatus" noSelection="['': '']"/>
</div>


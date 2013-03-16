<%@ page import="revlsms.PersonInfo" %>



<div class="fieldcontain ${hasErrors(bean: personInfoInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="personInfo.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${personInfoInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInfoInstance, field: 'middleName', 'error')} required">
	<label for="middleName">
		<g:message code="personInfo.middleName.label" default="Middle Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" required="" value="${personInfoInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInfoInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="personInfo.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${personInfoInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInfoInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="personInfo.contact.label" default="Contact" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contact" required="" value="${personInfoInstance?.contact}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInfoInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="personInfo.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${personInfoInstance?.address}"/>
</div>


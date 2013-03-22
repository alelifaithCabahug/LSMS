<%@ page import="lsmsfinal.Customer" %>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'availLaundryDate', 'error')} required">
	<label for="availLaundryDate">
		<g:message code="customer.availLaundryDate.label" default="Avail Laundry Date" />
		<span class="required-indicator"><i>*</i></span>
	</label>
	<i class="icon-calendar"></i>
	<g:datePicker name="availLaundryDate" precision="day" value="${customerInstance?.availLaundryDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="customer.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<i class="icon-user"></i>
	<g:textField name="firstName" placeholder="First Name" required="" value="${customerInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'middleName', 'error')} required">
	<label for="middleName">
		<g:message code="customer.middleName.label" default="Middle Name" />
		<span class="required-indicator">*</span>
	</label>
	<i class="icon-user"></i>
	<g:textField name="middleName" placeholder="Middle Name" required="" value="${customerInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<i class="icon-user"></i>
	<g:textField name="lastName" required="" placeholder="Last Name" value="${customerInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="customer.contact.label" default="Contact" />
		<span class="required-indicator">*</span>
	</label>
	<i class="icon-shopping-cart"></i>
	<g:textField name="contact" required="" placeholder="09xxxxxxxxx" value="${customerInstance?.contact}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="customer.address.label" default="Address" />
		</label>
	<i class="icon-user"></i>
	<g:textField name="address" placeholder="Current Address" value="${customerInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="customer.email.label" default="Email" />
		</label>
	<i class="icon-envelope"></i>
	<g:textField name="email" placeholder="johndoe@blah.com" value="${customerInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'laundryStatus', 'error')} ">
	<label for="laundryStatus">
		<g:message code="customer.laundryStatus.label" default="Laundry Status" />
		</label>
	<i class="icon-shopping-cart"></i>
	<g:select name="laundryStatus" from="${customerInstance.constraints.laundryStatus.inList}" value="${customerInstance?.laundryStatus}" valueMessagePrefix="customer.laundryStatus" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'packageName', 'error')} required">
	<label for="packageName">
		<g:message code="customer.packageName.label" default="Package Name" />
		<span class="required-indicator">*</span>
	</label>
	<i class="icon-shopping-cart"></i>
	<g:select id="packageName" name="packageName.id" from="${lsmsfinal.CustomPackage.list()}" optionKey="id" required="" value="${customerInstance?.packageName?.id}" class="many-to-one"/>
</div>

<!-- <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'customPackage', 'error')} ">
	<label for="customPackage">
		<g:message code="customer.customPackage.label" default="Custom Package" />
		
	</label>
	<g:select name="customPackage" from="${lsmsfinal.CustomPackage.list()}" multiple="multiple" optionKey="id" size="5" value="${customerInstance?.customPackage*.id}" class="many-to-many"/>
</div> -->

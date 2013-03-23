<%@ page import="laundry.Laundry" %>



<div class="fieldcontain ${hasErrors(bean: laundryInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="laundry.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customer" name="customer.id" from="${laundry.Customer.list()}" optionKey="id" required="" value="${laundryInstance?.customer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: laundryInstance, field: 'customPackage', 'error')} required">
	<label for="customPackage">
		<g:message code="laundry.customPackage.label" default="Custom Package" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customPackage" name="customPackage.id" from="${laundry.CustomPackage.list()}" optionKey="id" required="" value="${laundryInstance?.customPackage?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: laundryInstance, field: 'availLaundryDate', 'error')} required">
	<label for="availLaundryDate">
		<g:message code="laundry.availLaundryDate.label" default="Avail Laundry Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="availLaundryDate" precision="day"  value="${laundryInstance?.availLaundryDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: laundryInstance, field: 'laundryStatus', 'error')} ">
	<label for="laundryStatus">
		<g:message code="laundry.laundryStatus.label" default="Laundry Status" />
		
	</label>
	<g:select name="laundryStatus" from="${laundryInstance.constraints.laundryStatus.inList}" value="${laundryInstance?.laundryStatus}" valueMessagePrefix="laundry.laundryStatus" noSelection="['': '']"/>
</div>


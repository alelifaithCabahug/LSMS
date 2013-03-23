<%@ page import="laundry.Resource" %>



<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="resource.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${resourceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="resource.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" min="1" value="${resourceInstance.quantity}" required=""/>
</div>


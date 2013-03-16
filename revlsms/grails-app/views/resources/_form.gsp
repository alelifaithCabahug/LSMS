<%@ page import="revlsms.Resources" %>



<div class="fieldcontain ${hasErrors(bean: resourcesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="resources.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${resourcesInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourcesInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="resources.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" value="${resourcesInstance.quantity}" required=""/>
</div>


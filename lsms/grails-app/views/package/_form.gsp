<%@ page import="lsms.Package" %>



<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'pname', 'error')} required">
	<label for="pname">
		<g:message code="package.pname.label" default="Pname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pname" required="" value="${packageInstance?.pname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="package.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="price" step="any" required="" value="${packageInstance.price}"/>
</div>


<%@ page import="revlsms.Package" %>



<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'packageName', 'error')} required">
	<label for="packageName">
		<g:message code="package.packageName.label" default="Package Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="packageName" required="" value="${packageInstance?.packageName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'packageCreated', 'error')} required">
	<label for="packageCreated">
		<g:message code="package.packageCreated.label" default="Package Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="packageCreated" precision="day"  value="${packageInstance?.packageCreated}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'packagePrice', 'error')} required">
	<label for="packagePrice">
		<g:message code="package.packagePrice.label" default="Package Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="packagePrice" value="${fieldValue(bean: packageInstance, field: 'packagePrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="package.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="name" name="name.id" from="${revlsms.Resources.list()}" optionKey="id" required="" value="${packageInstance?.name?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'quantityNeeded', 'error')} required">
	<label for="quantityNeeded">
		<g:message code="package.quantityNeeded.label" default="Quantity Needed" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantityNeeded" type="number" value="${packageInstance.quantityNeeded}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'resources', 'error')} ">
	<label for="resources">
		<g:message code="package.resources.label" default="Resources" />
		
	</label>
	<g:select name="resources" from="${revlsms.Resources.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.resources*.id}" class="many-to-many"/>
</div>


<%@ page import="lsmsfinal.CustomPackage" %>

<div class="fieldcontain ${hasErrors(bean: customPackageInstance, field: 'packageName', 'error')} required">
	<label for="packageName">
		<g:message code="customPackage.packageName.label" default="Package Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="packageName" required="" value="${customPackageInstance?.packageName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customPackageInstance, field: 'clothesKilo', 'error')} required">
	<label for="clothesKilo">
		<g:message code="customPackage.clothesKilo.label" default="Clothes Kilo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="clothesKilo" value="${fieldValue(bean: customPackageInstance, field: 'clothesKilo')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: customPackageInstance, field: 'packagePrice', 'error')} required">
	<label for="packagePrice">
		<g:message code="customPackage.packagePrice.label" default="Package Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="packagePrice" value="${fieldValue(bean: customPackageInstance, field: 'packagePrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: customPackageInstance, field: 'resource', 'error')} ">
	<label for="resource">
		<g:message code="customPackage.resource.label" default="Resource" />
		
	</label>
	<g:select name="resource" from="${lsmsfinal.Resource.list()}" multiple="multiple" optionKey="id" size="5" value="${customPackageInstance?.resource*.id}" class="many-to-many"/>
</div>


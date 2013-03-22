<%@ page import="lsmsfinal.Customer" %>

<html>

<head>
	<meta name="layout" content="main" />
	<title>Sales</title>
</head>

<body>

	<div class="container-fluid">
		<div class="row-fluid">
		
		<div class="span12">
		
	<center><h1>Sales</h1></center>
	
			<table class="table table-bordered">
					 <tr>
					
					<td>Date</td>
					<td>Full Name</td>
					<!-- <td>First Name</td> -->
					<td>Package</td>
					<td>Price</td>
				</tr>
				
				<g:if test="${transactions}">
				<g:each in="${transactions}" var="customer">
				
				<tr class="success">
				<td>${customer.avail_laundry_date.format('MM/dd/yyyy')}</td>
					<td>${customer.first_name} ${customer.middle_name} ${customer.last_name}</td>
				<!--	<td>${customer.first_name}</td> -->
					<td>${customer.package_name}</td>
					<td>P${customer.package_price}</td>
					
				</tr>
				</g:each>
				</g:if>
		</table>
		
		<br></br>
	
	<div align="right">
	<b><i class="icon-briefcase"></i> Calculated Income  - P${total} </b>	
	</div>
		
		</div>
		</div>
		</div>
	
</body>
</html>
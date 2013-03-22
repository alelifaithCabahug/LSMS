<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<html>
  <head>
	<meta name="layout" content="main"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Sales</title>
  </head>
  <body onload="focusQueryInput();">

	<center>
    <h1>Customer Sales Report</h3>
	
	<h3>Search by:</h3>

	<g:form action="showSales" controller="customer">
		YEAR
		<input type="text" name="year" value="${params.year}" />
		&nbsp;&nbsp;MONTH
		<g:select name="month" from="${['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']}" value="${params.month}" noSelection="['':'']"/>
		<!-- &nbsp;&nbsp;DAY -->
		<!-- <g:select name="s" from="${1..31}" value="${params.s}" noSelection="['':'']"/> -->
		<input type="submit" value="Search" />
	</g:form>

	
	
	  </body>
</html>
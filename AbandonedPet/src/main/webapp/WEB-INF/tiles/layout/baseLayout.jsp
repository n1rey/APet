<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<title><tiles:insertAttribute name="title" /></title>
	<link rel="icon" href="/resources/images/favicon.png" />
	<meta charset="UTF-8">
<!-- <style>
/* 	header nav, footer nav {
	  font-family: Arial, sans-serif;
	  background-color:white;
	  border-bottom:1px solid #c8c8c8;
	  border-top:1px solid #c8c8c8;
	}

	html {
	  color: #333;
	  font-size: 16px;
	  font-weight: 400;
	  line-height: 1.4;
	  font-family: 'Nanum Gothic', sans-serif;
	  height: 1800px;
	}
	
	
	
	.subheader {
		margin-top:70px;
	}
	#cotent_box {
		margin-bottom:70px;
	} */
	
</style> -->	
</head>
<body>
<tiles:insertAttribute name="menu" /> 

<div class="subheader">
	<div class="alert alert-light">
		<div class="container">
        <h1 class="display-5"><tiles:insertAttribute name="heading" /> </h1>  
        <%-- <p><tiles:insertAttribute name="subheading" /></p>   --%>
		</div>
	</div>
</div>
	
<div class="container">
    <div class="row" id="cotent_box">
        <tiles:insertAttribute name="content" />  
    </div>
</div>
 <div class="footer">
	<tiles:insertAttribute name="footer" />  
</div>
</body>
</html>
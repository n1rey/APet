<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<title><tiles:insertAttribute name="title" /></title>
	<link rel="icon" href="/resources/images/favicon.png" />
	<meta charset="UTF-8">
	<link rel="icon" href="/resources/images/favicon.png" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
	header nav, footer nav {
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
	}
	
</style>	
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
    <div class="footer">
        <tiles:insertAttribute name="footer" />  
    </div>
</div>
</body>
</html>
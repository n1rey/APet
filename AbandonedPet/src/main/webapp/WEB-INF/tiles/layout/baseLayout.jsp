<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">


<title><tiles:insertAttribute name="title" /></title>  
</head>
<body>
<tiles:insertAttribute name="menu" /> 

<div class="my-5">
	<div class="alert alert-dark">
		<div class="container">
        <h1 class="display-3"><tiles:insertAttribute name="heading" /> </h1>  
        <p><tiles:insertAttribute name="subheading" /></p>  
		</div>
	</div>
</div>
	
<div class="container">
    <div class="row" >
        <tiles:insertAttribute name="content" />  
    </div>
    <div class="footer">
        <tiles:insertAttribute name="footer" />  
    </div>
</div>
</body>
</html>
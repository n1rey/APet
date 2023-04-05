<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car List</title>
</head>
<body>


<div class="container">
		<div class="row" align="center">
		
		<c:forEach items="${protectionList}" var="list">
			<div class = "col-md-4">
				<img src="<c:url value="/resources/images/${list.pimage}"/>" style="width:50%"/>
				<h3><a href="/protection/detail?pid=${list.pid}">${list.pname}</a></h3>
			</div>

		</c:forEach>
		
		</div>
	</div>



</body>
</html>
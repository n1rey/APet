<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 보호 등록</title>
</head>
<body>

<h3>임시 보호 등록</h3>
	
	<form:form modelAttribute="NewProtection" 
			   action="./addProtection?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post"
	           enctype="multipart/form-data">
	<fieldset>
	아이디 : <form:input path="username" class="form-control"/>
	보호 동물 이름 : <form:input path="pname" class="form-control"/>
	보호 동물 추정 나이 : <form:input path="page" class="form-control"/>
	보호 동물 성별 : <form:input path="pgender" class="form-control"/>
	특이사항 : <form:textarea path="petc" cols="50" rows="2" class="form-control"/>	
	사진 : <form:input path="image" type="file" class="form-control"/>
	<input type="submit" class="btn btn-primary" value="등록"/>
	
	
	</fieldset>
	</form:form>
<br><br><br>


</body>
</html>
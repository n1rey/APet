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
	
	<form:form modelAttribute="updateProtection" 
			   action="./update?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post"
	           enctype="multipart/form-data">
	<fieldset>
	<form:input path="pid" type="hidden"/>
	<form:input path="username" value="${protection.username }" type="hidden" class="form-control"/>
	보호 동물 이름 : <form:input path="pname" value="${protection.pname }" class="form-control"/>
	보호 동물 추정 나이 : <form:input path="page" value="${protection.page }" class="form-control"/>
	보호 동물 성별 : <form:input path="pgender" value="${protection.pgender }" class="form-control"/>
	특이사항 : <textarea name="petc" rows="50" cols="2" class="form-control">${protection.petc }</textarea>
	보호 상태 : <form:radiobutton path="pcondition" value="보호 중" label="보호 중"/>
			 <form:radiobutton path="pcondition" value="입양 완료" label="입양 완료"/>		
	사진 : <form:input path="image" type="file" class="form-control"/>
	<input type="submit" class="btn btn-primary" value="수정"/>
	<a href="/protection/delete?pid=${protection.pid}" class = "btn btn-danger">삭제</a>
	
	
	</fieldset>
	</form:form>
<br><br><br>


</body>
</html>
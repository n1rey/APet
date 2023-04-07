<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style type="text/css">
.error {
color: red;
}
</style>
</head>
<body>
	
	<form:form modelAttribute="member" 
			   action="/join"
	           class="form-horizontal"
	           method = "post">
	<fieldset>
	아이디 : <form:input path="username" class="form-control"/>
	 		<form:errors path="username" cssClass="error" />
	비밀번호 : <form:input path="password" type="password" class="form-control"/>
			<form:errors path="password" cssClass="error" />
	이름 : <form:input path="mname" class="form-control"/>
		<form:errors path="mname" cssClass="error" />
	닉네임 : <form:input path="mnickname" class="form-control"/>
			<form:errors path="mnickname" cssClass="error" />
	휴대폰 : <form:input path="mphone" class="form-control"/>
			<form:errors path="mphone" cssClass="error" />
			
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="submit" class="btn btn-primary" value="등록"/>
	
	
	</fieldset>
	</form:form>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style type="text/css">
.error {
color: red;
}
</style>
</head>
<body>
	<form:form modelAttribute="modMember" 
			   action="/member/mod"
	           class="form-horizontal"
	           method = "post">
	<fieldset>
	아이디 : <form:input path="username" class="form-control" value="${member.username}" readonly="true"/>
	 		<form:errors path="username" cssClass="error" />
	이름 : <form:input path="mname" value="${member.mname}" class="form-control"/>
		<form:errors path="mname" cssClass="error" />
	닉네임 : <form:input path="mnickname" value="${member.mnickname}" class="form-control"/>
			<form:errors path="mnickname" cssClass="error" />
	휴대폰 : <form:input path="mphone" value="${member.mphone}" class="form-control"/>
			<form:errors path="mphone" cssClass="error" />
			
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="submit" class="btn btn-primary" value="등록"/>
	
	
	</fieldset>
	</form:form>



</body>
</html>
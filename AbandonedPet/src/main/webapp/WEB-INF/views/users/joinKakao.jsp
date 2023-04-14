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
	<div class="container col-9">
	<form:form modelAttribute="member" 
			   action="/joinKakao"
	           class="form-horizontal"
	           method = "post">
	<fieldset>
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">아이디 : </label>
		<div class="col-sm-8">
			<form:input path="username" class="form-control"/>
		</div>
		<div class="text-end">
			<form:errors path="username" cssClass="error" element="div" />
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">비밀번호 : </label>
		<div class="col-sm-8">
			<form:input path="password" type="password" class="form-control"/>
		</div>
		<div class="text-end">
			<form:errors path="password" cssClass="error" element="div" />
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">비밀번호확인 :</label>
		<div class="col-sm-8">
			<form:input path="passwordConfirm" type="password" class="form-control"/>
		</div>
		<div class="text-end">
			<form:errors cssClass="error" element="div" />
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">이름 : </label>
		<div class="col-sm-8">
			<form:input path="mname" class="form-control"/>
		</div>
		<div class="text-end">
			<form:errors path="mname" cssClass="error" element="div" />
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">닉네임 : </label>
		<div class="col-sm-8">
			<form:input path="mnickname" class="form-control"/>
		</div>
		<div class="text-end">
			<form:errors path="mnickname" cssClass="error" element="div" />
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">휴대폰 : </label>
		<div class="col-sm-8">
			<form:input path="mphone" class="form-control"/>
		</div>
		<div class="text-end">
			<form:errors path="mphone" cssClass="error" element="div" />
		</div>
	</div>
			
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="submit" class="btn btn-primary mx-5" value="등록"/>
	
	
	</fieldset>
	</form:form>

	</div>

</body>
</html>
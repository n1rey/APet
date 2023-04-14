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
			   action="/join"
	           class="form-horizontal"
	           method = "post">
	<fieldset>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">아이디 : </label>
		<div class="col-sm-8">
			<form:input path="username" class="form-control" placeholder="반드시 사용중인 이메일을 입력해주세요."/>
		<div class="text-end">
			<form:errors path="username" cssClass="error" element="div" />
		</div>
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">비밀번호 : </label>
		<div class="col-sm-8">
			<form:input path="password" type="password" class="form-control" placeholder="8자 이상으로 입력해주세요."/>
		<div class="text-end">
			<form:errors path="password" cssClass="error" element="div" />
		</div>
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">비밀번호확인 :</label>
		<div class="col-sm-8">
			<form:input path="passwordConfirm" type="password" class="form-control" placeholder="8자 이상으로 입력해주세요."/>
		<div class="text-end">
			<form:errors cssClass="error" element="div" />
		</div>
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">이름 : </label>
		<div class="col-sm-8">
			<form:input path="mname" class="form-control" placeholder="실명을 입력해주세요."/>
		<div class="text-end">
			<form:errors path="mname" cssClass="error" element="div" />
		</div>
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">닉네임 : </label>
		<div class="col-sm-8">
			<form:input path="mnickname" class="form-control" placeholder="사용할 닉네임을 입력해주세요."/>
		<div class="text-end">
			<form:errors path="mnickname" cssClass="error" element="div" />
		</div>
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-3 col-form-label">휴대폰 : </label>
		<div class="col-sm-8">
			<form:input path="mphone" class="form-control" placeholder="010-0000-0000 형식으로 입력해주세요."/>
		<div class="text-end">
			<form:errors path="mphone" cssClass="error" element="div" />
		</div>
		</div>
	</div>
			
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<div class="text-end mt-3">
	<input type="submit" class="btn btn-primary mx-5" value="등록"/>
	</div>
	
	</fieldset>
	</form:form>
	</div>


</body>
</html>
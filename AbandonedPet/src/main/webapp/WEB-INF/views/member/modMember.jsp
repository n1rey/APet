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
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label">아이디 :</label>
		<div class="col-sm-10">
			<form:input path="username" class="form-control" value="${modMember.username}" readonly="true"/>
		</div>
		<div class="text-end">
			<form:errors path="username" cssClass="error" />
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label">이름 : </label>
		<div class="col-sm-10">
			<form:input path="mname" value="${modMember.mname}" class="form-control"/>
		</div>
		<div class="text-end">
			<form:errors path="mname" cssClass="error" />
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label">닉네임 : </label>
		<div class="col-sm-10">
			<form:input path="mnickname" value="${modMember.mnickname}" class="form-control"/>
		</div>
		<div class="text-end">
			<form:errors path="mnickname" cssClass="error" />
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label">휴대폰 : </label>
		<div class="col-sm-10">
			<form:input path="mphone" value="${modMember.mphone}" class="form-control"/>
		</div>
		<div class="text-end">
			<form:errors path="mphone" cssClass="error" />
		</div>
	</div>
		
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<div class="my-3 text-end">
	<input type="submit" class="btn btn-primary" value="등록"/>
	<a href="/member/myPage" class="btn btn-secondary">취소</a>
	</div>
	
	</fieldset>
	</form:form>



</body>
</html>
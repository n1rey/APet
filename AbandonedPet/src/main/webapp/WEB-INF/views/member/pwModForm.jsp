<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style type="text/css">
.error {
color: red;
}
</style>

</head>
<body>
	<form:form modelAttribute="modPwMember" 
			   action="/member/modPw"
	           class="form-horizontal"
	           method = "post" id="modPwForm">
	<fieldset>
	<form:input path="username" class="form-control" value="${modPwMember.username}" readonly="true"/>
	새 비밀번호 : <form:input path="password" type="password" class="form-control"/>
	 		<form:errors path="password" cssClass="error" />
	새 비밀번호 확인 : <form:input path="passwordConfirm" type="password" class="form-control"/>
		<form:errors cssClass="error" element="div" />
		
	<button id="changeBtn" type="submit" class="btn btn-primary">비밀번호 변경</button>
	
	</fieldset>
	</form:form>

	<a href="/member/myPage" class="btn btn-secondary">마이페이지로</a>


<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>


<script>
$('#changeBtn').on('click', function(){
	if (confirm("정말로 수정하시겠습니까?")) {
		$('#modPwForm').submit();
	}

})
</script>


</body>
</html>
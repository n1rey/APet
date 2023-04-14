<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<div class="container col-9 mt-4">
	<form:form modelAttribute="modPwMember" action="/member/modPw"
		class="form-horizontal" method="post" id="modPwForm">
		<fieldset>
			<div class="mb-3 row">
				<label class="col-sm-3 col-form-label">아이디 :</label>
				<div class="col-sm-8">
					<form:input path="username" class="form-control"
						value="${modPwMember.username}" readonly="true" />
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-3 col-form-label">새 비밀번호 :</label>
				<div class="col-sm-8">
					<form:input path="password" type="password" class="form-control" />
				<div class="text-end">
					<form:errors path="password" cssClass="error" />
				</div>
				</div>
			</div>


			<div class="mb-3 row">
				<label class="col-sm-3 col-form-label">새 비밀번호 확인 :</label>
				<div class="col-sm-8">
					<form:input path="passwordConfirm" type="password"
						class="form-control" />
				<div class="text-end">
					<form:errors cssClass="error" element="div" />
				</div>
				</div>
			</div>


			<div class="my-4 text-end mx-5">
				<button id="changeBtn" type="submit" class="btn btn-primary">비밀번호
					변경</button>
				<a href="/member/myPage" class="btn btn-secondary">취소</a>
			</div>

		</fieldset>
	</form:form>

</div>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>


	<script>
		$('#changeBtn').on('click', function() {
			if (confirm("정말로 수정하시겠습니까?")) {
				$('#modPwForm').submit();
			}

		})
	</script>


</body>
</html>
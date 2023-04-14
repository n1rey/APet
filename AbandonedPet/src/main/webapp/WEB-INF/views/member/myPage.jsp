<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>
	<div class="container mt-5 col-9">
		<div class="row">
			<div class="row mb-3">
				<div class="col-md-2">
					<h6>아이디:</h6>
				</div>
				<h6 class="col-md-10">${member.username}</h6>
			</div>
			<div class="row mb-3">
				<div class="col-md-2">
					<h6>이름:</h6>
				</div>
				<h6 class="col-md-10">${member.mname}</h6>
			</div>
			<div class="row mb-3">
				<div class="col-md-2">
					<h6>닉네임:</h6>
				</div>
				<h6 class="col-md-10">${member.mnickname}</h6>
			</div>
			<div class="row mb-3">
				<div class="col-md-2">
					<h6>휴대폰:</h6>
				</div>
				<h6 class="col-md-10">${member.mphone}</h6>
			</div>
			<div class="text-end">
				<a href="/member/mod" class="btn btn-warning"> 회원정보 수정 </a> <a
					href="/member/modPw" class="btn btn-dark"> 비밀번호 변경 </a>

				<form id="quitForm" class="my-3" action="/member/quit" method="post">
					<input type="hidden" name="username" value="${member.username }">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button onclick="confirmDelete()" class="btn btn-danger">탈퇴하기</button>
				</form>
				<!-- <button id="logout-btn" class="btn btn-secondary">로그아웃</button> -->

			</div>
		</div>
	</div>
	<script>
		function confirmDelete() {
			if (confirm("정말로 탈퇴하시겠습니까?")) {
				document.getElementById("quitForm").submit();
			}
		}
	</script>

	<!-- 	<script>
	document.getElementById("logout-btn").addEventListener("click", function() {
	    fetch("/logout", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json;charset=utf-8",
	            "X-CSRF-TOKEN": '${_csrf.token}'
	        }
	    }).then(response => {
	        if (response.ok) {
	            // 로그아웃 성공 시 처리
	            window.location.href = "/login?logout";
	        } else {
	            // 로그아웃 실패 시 처리
	            console.error("로그아웃 실패");
	        }
	    }).catch(error => {
	        console.error(error);
	    });
	});

	
	</script>
	 -->
	<script>
		//현재 URL의 파라미터 문자열을 가져온다.
		const paramsString = window.location.search;
		// URLSearchParams 객체를 만들어서 파라미터 문자열을 넘겨준다.
		const searchParams = new URLSearchParams(paramsString);

		if (searchParams.has("mod")) {
			alert("회원정보 변경이 완료되었습니다.")
		}
	</script>

</body>
</html>


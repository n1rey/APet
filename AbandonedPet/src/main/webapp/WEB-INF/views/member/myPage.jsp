<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-8">
				<div class="row mb-3">
					<div class="col-md-4">
						<strong>아이디:</strong>
					</div>
					<div class="col-md-8">${member.username}</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-4">
						<strong>이름:</strong>
					</div>
					<div class="col-md-8">${member.mname}</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-4">
						<strong>닉네임:</strong>
					</div>
					<div class="col-md-8">${member.mnickname}</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-4">
						<strong>휴대폰:</strong>
					</div>
					<div class="col-md-8">${member.mphone}</div>
				</div>
				<div class="text-end">
					<a href="/member/mod?username=${member.username}"
						class="btn btn-warning"> 수정하기 </a>

					<form id="quitForm" action="/member/quit" method="post">
						<input type="hidden" name="username" value="${member.username }">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<button onclick="confirmDelete()" class="btn btn-danger">탈퇴하기</button>
					</form>
					<button id="logout-btn" class="btn btn-secondary">로그아웃</button>

				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>
	<script>
		function confirmDelete() {
			if (confirm("정말로 탈퇴하시겠습니까?")) {
				document.getElementById("quitForm").submit();
			}
		}
	</script>
	
	<script>
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
	
</body>
</html>


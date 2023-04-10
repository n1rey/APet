<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

html, body {
	height: 100%;
}

body {
	/* display: flex; */
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

</head>
<body class="text-center">

	<main class="form-signin w-100 m-auto">
		<form action="/login" method="post">

			<div class="form-floating">
				<input type="text" name="username" class="form-control"
					id="floatingInput" placeholder="아이디를 입력하세요"> <label
					for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" name="password" class="form-control"
					id="floatingPassword" placeholder="암호를 입력하세요"> <label
					for="floatingPassword">암호</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<a href="javascript:kakaoLogin()"> <img style="object-fit: contain;"
				src="/resources/images/kakaologin.png" height="50" width="300">
			</a>
			<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
		</form>
		
		<form id="kakaoForm" action="/kakaoForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="username" id="kakaoEmail">
			<input type="hidden" name="mnickname" id="kakaoNickname">
		</form>
	</main>


<script>
//현재 URL의 파라미터 문자열을 가져온다.
const paramsString = window.location.search;
// URLSearchParams 객체를 만들어서 파라미터 문자열을 넘겨준다.
const searchParams = new URLSearchParams(paramsString);

if (searchParams.has("error")) {
  alert("아이디 혹은 비밀번호가 틀렸습니다.")
} else if (searchParams.has("logout")) {
	alert("로그아웃 되었습니다.")
} else if (searchParams.has("quit")) {
	alert("회원 탈퇴가 완료되었습니다.")
} else if (searchParams.has("modPw")) {
	alert("비밀번호가 변경되었습니다. 다시 로그인해주세요.")
}

</script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	//발급 받은 키
	Kakao.init("9f50ec260ccd32e5cedd41ea86406d0c");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			// 개발자 사이트에서 체크한 항목들과 반드시 일치해야 한다. 
			scope:'account_email, profile_nickname',
			success: function (authObj) {
				window.Kakao.API.request({
					url:'/v2/user/me',
					success:res => {
						const kakaoAccount = res.kakao_account;
						fetch('/kakao', {
							method: "post",
							  headers: {
								    'X-CSRF-TOKEN': "${_csrf.token}" // CSRF 토큰 값
								  },
							body: new URLSearchParams({
									username: kakaoAccount.email
								})
					        })
							.then(resp => resp.text())
							.then(data => {
								console.log(data);
								data = data.trim()
								if (data == 'success') {
									location.href = '/main.jsp';
								} else if (data == 'fail') {
									if (confirm('존재하지 않는 회원입니다 회원가입을 하시겠습니까?')) {
										document.getElementById("kakaoEmail").value = kakaoAccount.email;
										document.getElementById("kakaoNickname").value = kakaoAccount.profile.nickname;
										document.getElementById("kakaoForm").submit();
									}
								}
							})
					}
				});		
			}
		});
	}
</script>



</body>
</html>
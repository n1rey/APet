<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<head>
	<meta charset="UTF-8">
	<link rel="icon" href="/resources/images/favicon.png" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.5/gsap.min.js" integrity="sha512-cOH8ndwGgPo+K7pTvMrqYbmI8u8k6Sho3js0gOqVWTmQMlLIi6TbqGWRTpf1ga8ci9H3iPsvDLr4X7xwhC/+DQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script defer src="/resources/js/main.js"></script>
	<link rel="stylesheet" href="/resources/css/main.css" />

	
</head>
<header>
<nav class="navbar navbar-expand fixed-top" aria-label="Second navbar example">
	<div class="container-fluid">
		<a class="navbar-brand" href="/">
			<img src="/resources/images/logo.png" alt="logo" width="50px">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExample02">
			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a class="nav-link"
					aria-current="page" href="/">홈</a></li>
				
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 커뮤니티</a>

					<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/notice/noticeList">공지사항</a></li>
							<li><a class="dropdown-item" href="/freeBoard/freeBoardList">자유게시판</a></li>
					</ul>
				</li>
				
				
				<li class="nav-item"><a class="nav-link" href="/#">임시보호</a></li>
				<li class="nav-item"><a class="nav-link" href="/#">보호소 목록</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 마이페이지</a>

					<ul class="dropdown-menu">
						<sec:authorize access="isAnonymous()">
							<li><a class="dropdown-item" href="/login">로그인</a></li>
							<li><a class="dropdown-item" href="/users/join">회원가입</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<li><a class="dropdown-item" href="/logout">로그아웃</a></li>
							<li><a class="dropdown-item" href="#">회원탈퇴</a></li>

						</sec:authorize>
					</ul>
				</li>

					<sec:authentication property="principal" var="user" />
					<sec:authorize access="hasRole('ROLE_ADMIN')">


						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 관리자</a>

							<ul class="dropdown-menu">


								<li><a class="dropdown-item" href="#">회원관리</a></li>
								<li><a class="dropdown-item" href="#">커뮤니티관리</a></li>

								<li><a class="dropdown-item" href="#">임시보호관리</a></li>


							</ul>
						</li>

					</sec:authorize>
			</ul>	


			<sec:authentication property="principal" var="user" />
			<sec:authorize access="isAuthenticated()">
				<div class="h6" style="margin-right:20px">${user.username}님</div>
				<div style="text-align:center; padding-top:10px;">
				<form method="post" action="/logout">
					<input type="submit" class="btn btn-warning btn-sm" value="Logout" />
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				</div>
			</sec:authorize>


			<sec:authorize access="isAnonymous()">
				<div class="h6" style="margin-right:20px">로그인 하세요.</div>
				<div style="text-align:center; padding-top:10px;"> 
				<form method="get" action="/login">
					<input type="submit" class="btn btn-outline-dark btn-sm" value="Login" />
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				</div>
			</sec:authorize>



		</div>
	</div>
</nav>
</header>
<section class="main_box">
	<div class="main_content">
		<div class="content_image">
			<div class="resource content_image_resource">
				<img alt="main_image" src="/resources/images/catndog.png">
			</div>
		</div>
		<div class="content_text">
			<div class="resource content_text_resource">
				<div class="h2">
					반려동물,<br>
					사지말고<br>
					입양하세요
				</div>
				<br>
				<a class="btn btn-outline-dark">임시보호 확인하기</a>
			</div>
		</div>
	</div>
	<div class="video_content">
		<p class="video_title">입양 이야기 확인하기▼</p>
		<iframe width="672" height="378" src="https://www.youtube-nocookie.com/embed/3nxwIbxHEvs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	</div>
	<div class="find_shelter">
		<div class="inner">
			<div class="find_shelter_text h4">
				보호소를 확인해보세요!<span class="material-symbols-outlined">search</span>
			</div>
			<div class="find_shelter_text">
				<a class="btn btn-outline-dark">바로가기</a>
			</div>
		</div>
	</div>
</section>

<footer>
<nav class="navbar fixed-bottom navbar-expand-sm">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Abandoned Pet</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					aria-current="page" href="#">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#">임시보호</a></li>
				<li class="nav-item"><a class="nav-link" href="#">보호소목록</a></li>
			
			</ul>
		</div>
	</div>
</nav>
</footer>



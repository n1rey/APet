<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

	

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



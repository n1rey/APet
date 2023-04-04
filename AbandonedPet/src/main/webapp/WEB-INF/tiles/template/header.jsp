<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

<nav class="navbar navbar-expand navbar-dark bg-dark fixed-top"
	aria-label="Second navbar example">
	<div class="container-fluid">
		<a class="navbar-brand" href="/"> <img
			src="http://austiny.snu.ac.kr/image/mine.jpg" alt="Bootstrap"
			width="35" height="40">
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExample02">
			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/">홈</a></li>
				<li class="nav-item"><a class="nav-link" href="/#">커뮤니티</a></li>
				<li class="nav-item"><a class="nav-link" href="/#">임시보호</a></li>
				<li class="nav-item"><a class="nav-link" href="/#">보호소 목록</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 회원관리</a>

					<ul class="dropdown-menu">
						<sec:authorize access="isAnonymous()">
							<li><a class="dropdown-item" href="/login">로그인</a></li>
							<li><a class="dropdown-item" href="/users/join">회원가입</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<li><a class="dropdown-item" href="/logout">로그아웃</a></li>
							<li><a class="dropdown-item" href="#">회원탈퇴</a></li>

						</sec:authorize>

					</ul> <sec:authentication property="principal" var="user" /> <sec:authorize
						access="hasRole('ROLE_ADMIN')">

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 관리자</a>

							<ul class="dropdown-menu">


								<li><a class="dropdown-item" href="#">회원관리</a></li>
								<li><a class="dropdown-item" href="#">커뮤니티관리</a></li>

								<li><a class="dropdown-item" href="#">임시보호관리</a></li>


							</ul>
					</sec:authorize></li>
			</ul>


			<sec:authentication property="principal" var="user" />
			<sec:authorize access="isAuthenticated()">
				<div class="bg-white h6">${user.username}님로그인하셨습니다.</div> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
			<form method="post" action="/logout">
					<input type="submit" class="btn btn-success btn-xs" value="Logout" />
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</sec:authorize>


			<sec:authorize access="isAnonymous()">
				<div class="bg-white h6">로그인 하세요.</div>  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
				<form method="get" action="/login">
					<input type="submit" class="btn btn-primary btn-xs" value="Login" />
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</sec:authorize>



		</div>
	</div>
</nav>



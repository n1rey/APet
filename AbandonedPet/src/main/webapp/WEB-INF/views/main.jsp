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
	<link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
	<script defer src="/resources/js/main.js"></script>
	<link rel="stylesheet" href="/resources/css/main.css" />

	
</head>
<header>
<sec:authentication property="principal" var="user" />
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light d-flex justify-content-md-between">
  <div class="container-fluid">
  	<a class="navbar-brand" href="/">A Pet</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           	커뮤니티
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="nav-link" href="/notice/noticeList">공지사항</a></li>
            <li><a class="nav-link" href="/freeBoard/freeBoardList">자유게시판</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/protection/list">임시보호</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">보호소확인</a>
        </li>
        <sec:authorize access="isAuthenticated()">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           	마이페이지
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="nav-link" href="#">내 정보</a></li>
            <li><a class="nav-link" href="<c:out value="/protection/myList?username=${user.username}" />">내 임시보호 목록</a></li>
            <li><a class="nav-link" href="<c:out value="/adoption/myList?nid=${user.username}" />">내 입양신청서 확인</a></li>
          </ul>
        </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           	관리자
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="nav-link" href="/notice/noticeList">공지사항</a></li>
            <li><a class="nav-link" href="/freeBoard/freeBoardList">자유게시판</a></li>
          </ul>
        </li>
        </sec:authorize>
      </ul>
      </div>
      <div>
      <sec:authorize access="isAnonymous()">
      <div class="d-flex">
      <form method="get" action="/login">
        <button class="btn btn-sm btn-outline-dark" style="margin-top:15px; margin-right:10px" type="submit">login</button>
      </form>
      <form method="get" action="/join">
        <button class="btn btn-sm btn-outline-dark" style="margin-top:15px;" type="submit">Sign-up</button>
      </form>
      </div>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
      <div class="d-flex">	
      	<div class="h6" style="margin-right:20px; margin-top:20px;">${user.username}님</div>
      	<form method="POST" action=<c:out value="/logout/"/>>
        	<button class="btn btn-sm btn-warning" style="margin-top:15px;" type="submit">Logout</button>
        	<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
      	</form>
      	</div>
      </sec:authorize>
    </div>
  </div>
</nav>
</div>
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
				보호소를 확인해보세요!
			</div>
			<div class="find_shelter_text">
				<a class="btn btn-outline-dark"><span class="material-symbols-outlined">search</span>바로가기</a>
			</div>
		</div>
	</div>
</section>

<footer>
<div class="container">
	<a class="navbar-brand" href="#">Abandoned Pet</a>
	<div class="sub-menu">
		<a href="/">홈</a>
		<a href="/notice/noticeList">공지사항</a>
		<a href="/freeBoard/freeBoardList">자유게시판</a>
		<a href="/protection/list">임시보호</a>
		<a href="#">보호소</a>
	</div>
	<p>유기동물 커뮤니티<br>
	Copyright ⓒ 2023 A pet - 유기동물 커뮤니티 All rights reserved.<br>
	문의사항 admin@admin.com</p>
</div>
</footer>



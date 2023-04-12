<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
		   uri="http://www.springframework.org/security/tags"%>



<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="https://cdn.datatables.net/1.10.21/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css">
<link href="/resources/AdminTemplate/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
<link href="/resources/AdminTemplate/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/AdminTemplate/js/httpRequest.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>

<style>
	*{
		color:black;
	}

	a{
		color:black;
	}

	body{
		border-top : 1px solid #c8c8c8;
	}

	nav {
		font-family: Arial, sans-serif;
		background-color:white;
		border-bottom:1px solid #c8c8c8;
	}

	.navbar-brand {
		font-family: 'Righteous', cursive, sans-serif;
	}

	.button_box > button {
		margin-left: 10px;
		margin-top: 10px;
	}

	.dropdown-menu .nav-link {
		margin-left: 10px;
	}

	html {
		color: #333;
		font-size: 16px;
		font-weight: 400;
		line-height: 1.4;
		font-family: 'Nanum Gothic', sans-serif;
	}

	.main_box {
		font-family : 'IBM Plex Sans KR', sans-serif;
		font-weight : 400;
	}

	.main_content {
		height:600px;
		display:flex;
		position: relative;
		border-width : bottom;
		border-bottom : 1px solid #c8c8c8;

	}

	.main_content > .content_image {
		width:65%;
		background-color:#fff9ed;
		min-width:650px;

	}

	.main_content > .content_text {
		width:35%;
		position:relative;
		text-align:center;
		min-width:350px;
	}

	.main_content > .content_text > .content_text_resource {
		color : #29211f;
		position : absolute;
		left:0px;
		top:200px;
		width:100%;
	}

	.main_content .resource {
		opacity:0;
	}

	.main_content > .content_image > .content_image_resource {
		width:600px;
	}

	.main_content > .content_image > .content_image_resource > img {
		width:600px;
		position:absolute;
		bottom:0;
		left:100px;
	}

	.video_content {
		text-align:center;
	}

	.video_content > .video_title {
		margin-top:50px;
		text-decoration-line : underline;
	}

	.find_shelter {
		height: 300px;
		background-color: #fff9ed;
		text-align: center;
		margin-top: 50px;
		border-top : 1px solid #c8c8c8;
		border-bottom: 1px solid #c8c8c8;
		position: relative;
	}

	.find_shelter > .inner {
		width: 100%;
		position: absolute;
		top:110px;
	}


	footer {
		margin-top:30px;
		border-top:1px solid #c8c8c8;
		background-color : #fafafa;
	}

	footer p {
		font-size:14px;
		margin-left: 10px;
	}

	footer .navbar-brand {
		font-size: 18px;
		margin-left: 10px;
	}

	footer .sub-menu {
		font-size:14px;
		margin : 10px 0;
	}

	footer .sub-menu a {
		margin: 10px;
		color:#363636;
		text-decoration: none;
	}
</style>


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
									<li><a class="nav-link" href="<c:out value="/adoption/myList?nid=${user.username}" />">내 입양신청서</a></li>
								</ul>
							</li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item dropdown">
								<a class="nav-link" href="/admin">
									관리자
								</a>
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
							<form method="POST" action=<c:out value="/logout"/>>
								<button class="btn btn-sm btn-warning" style="margin-top:15px;" type="submit">Logout</button>
								<input type="hidden" name="${_csrf.parameterName}"
									   value="${_csrf.token}" />
							</form>
						</div>
					</sec:authorize>
				</div>
			</div>
		</nav>


		<body id="page-top">

		<div class="wrapper">
			<!-- Page Wrapper -->
			<div id="wrapper">

				<!-- Sidebar -->
				<ul class="navbar-nav bg-warning sidebar sidebar-dark accordion" id="accordionSidebar">

					<!-- Sidebar - Brand -->
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
						<div class="sidebar-brand-icon rotate-15">
							<i class="fas fa-paw"></i>
						</div>
						<div class="sidebar-brand-text mx-3">Abandoned Pet Admin <sup></sup></div>
					</a>

					<!-- Divider -->
					<hr class="sidebar-divider my-0">


					<!-- Divider -->
					<hr class="sidebar-divider">

					<!-- Heading -->
					<div class="sidebar-heading">
						Management
					</div>

					<!-- Nav Item - Pages Collapse Menu -->
					<li class="nav-item">
						<a class="nav-link collapsed" href="/admin/member">
							<i class="fas fa-users"></i>
							<span>Member</span>
						</a>
					</li>

					<!-- Nav Item - Utilities Collapse Menu -->
					<li class="nav-item">
						<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
							<i class="fas fa-table"></i>
							<span>Table</span>
						</a>
						<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
							<div class="bg-white py-2 collapse-inner rounded">
								<h6 class="collapse-header">게시판 관리</h6>
								<a class="collapse-item" href="/notice/noticeList">공지</a>
								<a class="collapse-item" href="/freeBoard/freeBoardList">자유 게시판</a>
							</div>
						</div>
					</li>

					<!-- Divider -->
					<hr class="sidebar-divider">

					<!-- Heading -->
					<div class="sidebar-heading">
						Abondoned Pet
					</div>

					<!-- Nav Item - Pages Collapse Menu -->
					<li class="nav-item">
						<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
							<i class="fas fa-fw fa-folder"></i>
							<span>Pet Management</span>
						</a>
						<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
							<div class="bg-white py-2 collapse-inner rounded">
								<h6 class="collapse-header" >유기 동물</h6>
								<a class="collapse-item" href="/protection/adminList">유기 동물 목록</a>
								<a class="collapse-item" href="/adoption/adminList">입양 신청 목록</a>
								<div class="collapse-divider"></div>
							</div>
						</div>
					</li>

					<!-- Divider -->
					<hr class="sidebar-divider d-none d-md-block">


				</ul>
				<!-- End of Sidebar -->

				<!-- Topbar 임포트-->

				<!-- End of Topbar -->




				<!-- Main content -->

				<div class="container mt-5">
					<div class="photo-gallery container mb-3">
						<div class="row justify-content-center">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-5 text-muted">
										<select class="form-select form-select-sm w-50 d-inline"
												id="selectAmount">
											<option value="10" selected>10</option>
											<option value="20">20</option>
											<option value="40">40</option>
										</select> <span class="d-inline">개씩 보기</span>
									</div>
									<div class="col-9 text-end">
									</div>
								</div>
								<hr class="my-2">

								<table class="table table-hover shadow bg-body rounded">
									<thead>
									<tr class="bg-warning">
										<th scope="col" class="col-2">아이디</th>
										<th scope="col" class="col-2">이름</th>
										<th scope="col" class="col-2">닉네임</th>
										<th scope="col" class="col-2">권한</th>
										<th></th>
										<th scope="col" class="col-3">가입일자</th>
										<th scope="col" class="col-4">회원 삭제</th>
									</tr>
									</thead>
									<tbody id="imgList">


									</tbody>
								</table>
								<div class="row text-center" id="none"></div>

								<hr class="my-1">

									<div class="row">
										<ul class="pagination justify-content-center" id="pagination">

										</ul>
									</div>
									<div class="row">
										<div class="col-6"></div>
										<div class="col-6">
										<div class="d-flex justify-content-between">
											<select class="form-select form-control-sm" id="selectType">
												<option value="U" selected>아이디</option>
												<option value="M">이름</option>
												<option value="N">닉네임</option>
												<option value="UM">아이디/이름</option>
												<option value="UN">아이디/닉네임</option>
												<option value="MN">이름/닉네임</option>
												<option value="UMN">아이디/이름/닉네임</option>
											</select> <input class="form-control form-control-sm mx-2" type="search"
															 placeholder="검색어" id="keyword">
											<button class="btn btn-sm btn-outline-warning" style="width: 120px; height: 30px;" type="button"
													id="searchBtn"> 검색
												<i class="bi bi-search"></i>
											</button>
										</div>
										</div>
									</div>

							</div>
					</div>
				</div>

			</div>
			<!-- /.content-wrapper -->
		</div>

		</body>






	</div>
</header>

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

<!-- Bootstrap 4 -->
<script src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/admin/dist/js/adminlte.min.js"></script>

		
	</div>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>
	
	<script>
	/**
	 * 
	 */
	 
	/* Criteria 객체 */
	var cri = {
			amount : $('#selectAmount').val(),							// 한 페이지에 표시 할 목록 갯수
			pageNum : 1,
			type : null,
			keyword : null
	}
	/* Pagination 정보 객체 */
	var pageObj = {
			NUM_PER_PAGE : 5.0,					// 한 페이지에 표시 할 페이지 번호 수
			start : 1,							// 시작 페이지 번호
			end : this.NUM_PER_PAGE,			// 끝 페이지 번호
			isPrevious : false,					// 이전
			isNext : false,						// 다음
			
			pageCal : function(cri){
				var total = 0;
				fetch(getTotalCountUrl(), {	
					method: "post",
					  headers: {
			    		'${_csrf.headerName}': '${_csrf.token}' // CSRF 토큰 값
	 					 },
					body: new URLSearchParams({
							amount: cri.amount,
							pageNum: cri.pageNum,
							offset: cri.amount * (cri.pageNum - 1),
							keyword: cri.keyword,
							type: cri.type
						})
			        })
					.then(resp => resp.text())
					.then(data => {
						data.trim()
						console.log(data);
						total = data*1
						setPage(total, cri, this);
					})
			}
	}

	// 페이지네이션 설정 함수
	function setPage(total, cri, pageObj) {
		var pages = Math.ceil(total / cri.amount);
		pageObj.end = (Math.ceil(cri.pageNum / pageObj.NUM_PER_PAGE) * pageObj.NUM_PER_PAGE);
		pageObj.start = (pageObj.end - (pageObj.NUM_PER_PAGE - 1));
		pageObj.end = pageObj.end >= pages ? pages : pageObj.end;	// 실제 끝 페이지 번호 확인
		pageObj.isPrevious = pageObj.start > 1;
		pageObj.isNext = pageObj.end < pages;
		
		
		var pageHTML = '';
		//<!-- previous -->
		if (pageObj.isPrevious) {
			pageHTML += ''
			+'<li class="page-item">'
				+'<button type="button" class="page-link" onclick="previous()" aria-label="Previous">'
					+'<span aria-hidden="true">&laquo;</span>'
					+'<span class="sr-only">이전</span>'
				+'</button>'
			+'</li>'
		}
		//<!-- page -->
		for (var i = pageObj.start; i <= pageObj.end; i++) {
			pageHTML += ''
			+'<li class="page-item ' + (cri.pageNum == i ? 'active disabled' : '') +'">'
				+'<button class="page-link" onclick="pageBtn('+i+')">'+i+'</button>'
			+'</li>'
		}
		//!-- next -->
		if (pageObj.isNext) {
			pageHTML += ''
			+'<li class="page-item">'
				+'<button type="button" class="page-link" onclick="next()" aria-label="Next">'
					+'<span class="sr-only">다음</span>'
					+'<span aria-hidden="true">&raquo;</span>'
				+'</button>'
			+'</li>'
		}
		console.log(pageHTML)
		$('#pagination').html(pageHTML);
		getList();
	}

	/* 현재 버튼 클릭 시 실행 함수 */
	function pageBtn(pageNum) {
		cri.pageNum = pageNum;
		pageObj.pageCal(cri);
	}
	/* 이전 버튼 클릭 시 실행 함수 */
	function previous() {
		pageObj.start -= 1;
		cri.pageNum = pageObj.start
		pageObj.pageCal(cri);
	}
	/* 다음 버튼 클릭 시 실행 함수 */
	function next() {
		pageObj.end += 1;
		cri.pageNum = pageObj.end
		pageObj.pageCal(cri);
	}

	//-------------- 게시글 표시 갯수 변경 ---------------
	$('#selectAmount').on('change', function(){
		cri.amount = $(this).val();
		cri.pageNum = 1;
		pageObj.start = 1;
		pageObj.end = pageObj.NUM_PER_PAGE
		pageObj.pageCal(cri);
	});


	// -------------- 검색 관련 ---------------
	$('#searchBtn').on('click', function(){
		searchExe();
	});
	$('#keyword').on("keypress", function(){
		if(event.keyCode == 13) {
			searchExe();
		}
	})

	function searchExe() {

		cri.pageNum = 1
		cri.keyword = $('#keyword').val()
		cri.type = $('#selectType').val()
		pageObj.pageCal(cri);
	}

	onload = function() {
		pageObj.pageCal(cri);
	}

	function getList() {
		fetch(getListUrl(), {	
			method: "post",
			headers: {
		    		'${_csrf.headerName}': '${_csrf.token}' // CSRF 토큰 값
					 },
			body: new URLSearchParams({
					amount: cri.amount,
					pageNum: cri.pageNum,
					offset: cri.amount * (cri.pageNum - 1),
					keyword: cri.keyword,
					type: cri.type
				})
	        })
			.then(resp => resp.json())
			.then(data => {
				console.log(data);
				printList(data);
			})
	}
	
	</script>
	
	<script>
	/*
		 [form id 이걸로 하셈]

		 검색 버튼 : searchBtn
		 검색 입력 인풋 : keyword
		 검색 선택 셀렉트 : selectType
		 게시글 표시 갯수 셀렉트 : selectAmount
		 */

		/* 전체 게시물 수 가져오기 위해 처리한 jsp URL 입력해주세요 */
		function getTotalCountUrl() {
			return '/admin/member/total'
		}
		/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
		function getListUrl() {
			return '/admin/member/all'
		}

		function printList(data) {
			//TODO: 리스트 출력 처리 하세요
			if (data.length < 1) {
				var noneStr = '';
				noneStr ='<div>회원이 없습니다.<div>'
				$("#none").html(noneStr);
			}
			var imgHTML = '';
			for (var i = 0; i < data.length; i++) {
				if ( data[i].username == '${user.username}') {
					continue;
				}
				imgHTML += ''
						+ "<tr>"
						+ "<td>" + data[i].username + "</td>"
						+ '<td>' + data[i].mname + "</td>" 
						+ '<td>' + data[i].mnickname + "</td>"
						+ '<td><select id="roleSelect" onchange="updateAuth(\''+ data[i].username +'\', this)">'
				if (data[i].authority == "ROLE_ADMIN") {
					imgHTML += '<option value="ROLE_ADMIN" selected>ROLE_ADMIN</option>'
							+ '<option value="ROLE_USER">ROLE_USER</option>'
				} else {
					imgHTML += '<option value="ROLE_ADMIN">ROLE_ADMIN</option>'
							+ '<option value="ROLE_USER" selected>ROLE_USER</option>'
				}
						  			
				imgHTML	+= '</select><td/><td>'+ data[i].mdate.split(" ")[0] + "</td>";
				imgHTML += "<td><button onclick=\"removeMember('"+ data[i].username +"')\" class='btn btn-danger' style=\'width: 70px; height: 35px;\'>삭제</button></td></tr>"
			}
			$('#imgList').html(imgHTML);
		}
	</script>

<script>
function removeMember(uname) {
	if (confirm("정말로 삭제하시겠습니까?")) {
		fetch("/admin/member/remove", {	
			method: "post",
			headers: {
		    		'${_csrf.headerName}': '${_csrf.token}' // CSRF 토큰 값
					 },
			body: new URLSearchParams({
					username: uname
				})
	        })
			.then(data => {
				console.log(data);
				cri.pageNum = 1
				pageObj.pageCal(cri);
				alert("삭제되었습니다.");
			})	
			.catch(error => {
				console.error(error)
				alert("처리에 문제가 생겼습니다.")
			});
	}
	
}

function updateAuth(username, e) {
	console.log(document.getElementById("roleSelect").value)
    $.ajax({
       type : "POST",
       url : "/admin/member/changeAuth",
       data : {
          username : username,
          auth : e.value
       },
       beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
       },
       success : function(result) {
          alert("권한 정보 변경이 완료되었습니다.")
       },
       error : function(request, status, error) {
          alert(request.status + " " + request.responseText);
       }
    })
 }
 

</script>



</body>
</html>
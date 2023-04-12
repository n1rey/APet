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
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-users"></i>
          <span>Member</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">회원</h6>
              <a class="collapse-item" href="#">회원 목록</a>
                <a class="collapse-item" href="#">회원 관리</a>
          </div>
        </div>
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
            <a class="collapse-item" href="#">공지관리</a>
            <a class="collapse-item" href="#">게시판 관리</a>
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
            <a class="collapse-item" href="#">유기 동물 목록</a>           
            <a class="collapse-item" href="#">입양 신청 목록</a>
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
	<div class="content">
	<br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="row">
		            	<!-- Earnings (Monthly) Card Example -->
			            <div class="col-xl-4 col-md-6 mb-4">
			              <div class="card border-left-primary shadow h-100 py-2">
			                <div class="card-body">
			                  <div class="row no-gutters align-items-center">
			                    <div class="col mr-2">
			                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">총 회원 수</div>
			                      <div class="h5 mb-0 font-weight-bold text-gray-800">${memberCnt} 명</div>
			                    </div>
			                    <div class="col-auto">
			                      <i class="fas fa-users fa-2x text-gray-300"></i>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
		            </div>
	            </div>
	            
	            <!-- Earnings (Monthly) Card Example -->
				<div class="col-12">
					<div class="row">	            
			            <div class="col-xl-4 col-md-6 mb-4">
			              <div class="card border-left-success shadow h-100 py-2">
			                <div class="card-body">
			                  <div class="row no-gutters align-items-center">
			                    <div class="col mr-2">
			                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">보호 중인 유기 동물 수</div>
			                      <div class="h5 mb-0 font-weight-bold text-gray-800">${proCnt } 마리</div>
			                    </div>
			                    <div class="col-auto">
			                      <i class="fas fa-dog fa-2x text-gray-300"></i>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
			            <div class="col-xl-4 col-md-6 mb-4">
			              <div class="card border-left-success shadow h-100 py-2">
			                <div class="card-body">
			                  <div class="row no-gutters align-items-center">
			                    <div class="col mr-2">
			                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">보호 종료된 유기 동물 수</div>
			                      <div class="h5 mb-0 font-weight-bold text-gray-800">${doneCnt }  마리</div>
			                    </div>
			                    <div class="col-auto">
			                      <i class="fas fa-dog fa-2x text-gray-300"></i>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
		            </div>
	            </div>


            	<!-- Pending Requests Card Example -->
				<div class="col-12">
					<div class="row">	            	
			            <div class="col-xl-4 col-md-6 mb-4">
			              <div class="card border-left-warning shadow h-100 py-2">
			                <div class="card-body">
			                  <div class="row no-gutters align-items-center">
			                    <div class="col mr-2">
			                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">입양 신청 대기 중인 회원 수</div>
			                      <div class="h5 mb-0 font-weight-bold text-gray-800">${waitCnt }  명</div>
			                    </div>
			                    <div class="col-auto">
			                      <i class="fas fa-users fa-2x text-gray-300"></i>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
			            <div class="col-xl-4 col-md-6 mb-4">
			              <div class="card border-left-warning shadow h-100 py-2">
			                <div class="card-body">
			                  <div class="row no-gutters align-items-center">
			                    <div class="col mr-2">
			                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">입양 신청 허가된 회원 수</div>
			                      <div class="h5 mb-0 font-weight-bold text-gray-800">${permitCnt }  명</div>
			                    </div>
			                    <div class="col-auto">
			                      <i class="fas fa-users fa-2x text-gray-300"></i>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
			            <div class="col-xl-4 col-md-6 mb-4">
			              <div class="card border-left-warning shadow h-100 py-2">
			                <div class="card-body">
			                  <div class="row no-gutters align-items-center">
			                    <div class="col mr-2">
			                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">입양 신청 거절된 회원 수</div>
			                      <div class="h5 mb-0 font-weight-bold text-gray-800">${refuseCnt }  명</div>
			                    </div>
			                    <div class="col-auto">
			                      <i class="fas fa-users fa-2x text-gray-300"></i>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
		          	</div>
				</div>
				
				<!-- Earnings (Monthly) Card Example -->
				<div class="col-12">
					<div class="row">	            
			            <div class="col-xl-4 col-md-6 mb-4">
			              <div class="card border-left-info shadow h-100 py-2">
			                <div class="card-body">
			                  <div class="row no-gutters align-items-center">
			                    <div class="col mr-2">
			                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">공지 글 수</div>
			                      <div class="h5 mb-0 font-weight-bold text-gray-800">${noticeCnt } 개</div>
			                    </div>
			                    <div class="col-auto">
			                      <i class="fas fa-comments fa-2x text-gray-300"></i>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
			            <div class="col-xl-4 col-md-6 mb-4">
			              <div class="card border-left-info shadow h-100 py-2">
			                <div class="card-body">
			                  <div class="row no-gutters align-items-center">
			                    <div class="col mr-2">
			                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">자유 게시판 글 수</div>
			                      <div class="h5 mb-0 font-weight-bold text-gray-800">${boardCnt } 개</div>
			                    </div>
			                    <div class="col-auto">
			                      <i class="fas fa-comments fa-2x text-gray-300"></i>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
		            </div>
	            </div>
				
				<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content -->
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


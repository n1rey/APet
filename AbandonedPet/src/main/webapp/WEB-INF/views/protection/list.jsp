<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car List</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.slim.js"
		integrity="sha256-dWvV84T6BhzO4vG6gWhsWVKVoa4lVmLnpBOZh/CAHU4=" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous">
	</script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
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
      
    </style>
    
    
<body>

<sec:authentication property="principal" var="user" />
<!-- Main -->	

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">임시 보호 목록</h1>
        <p class="lead text-muted">사지 말고 입양하세요!</p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">
    	<div style="text-align:right">
		  <a href="/protection/addProtection" class="btn btn-sm btn-outline-primary">임시 보호 글 작성</a>
    	</div><br>
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      
      <c:forEach items="${protectionList}" var="list">
        <div class="col">
          <div class="card shadow-sm">
			<img src="<c:url value="/resources/images/${list.pimage}"/>" class="bd-placeholder-img card-img-top" width="100%" height="225"/>

            <div class="card-body">
              <p class="card-text">${list.pname}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="/protection/detail?pid=${list.pid}&username=${user.username}" class="btn btn-sm btn-outline-secondary">보러 가기</a>
                </div>
                <small class="text-muted">좋아요 수 : ${list.hcnt}</small>
              </div>
              <div style="text-align:right">
                <small class="text-muted">${list.pdate}</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
    	<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
			</ul>
		</nav>
  </div>



</body>
<script>
	var cnt = ${cnt};
	var pageSize = 9;
	var totalPage = Math.ceil(cnt/pageSize);
	var currentPage = ${requestScope.page };
	var pageGroup = Math.ceil(currentPage / 5);
	var last = pageGroup * 5;
	var start = last - (5 - 1);
	
	if (last > totalPage){last = totalPage};
	
	var previous = start > 1;
	var next = last < totalPage;

	window.onload = function(){
		pagination();
	}
	
	function pagination(){
		if (cnt <= pageSize) return;
		var str = '';
		if (previous) {
	 		  str += "<li class='page-item prev'><a class='page-link' href='/protection/list?page="+ (start - 1) +"'>&laquo; Previous</a></li>";
	 	}
		for(i=start; i<=last; i++){
			str += "<li class='page-item "+ (i==currentPage?'active':'') +"'><a class='page-link' href='/protection/list?page=" + i +"'>"+ i +"</a></li>"
		}
		if (next) {
 		  str += "<li class='page-item next'><a class='page-link' href='/protection/list?page="+ (start + 5) +"'>Next &raquo;</a></li>"
 		}



		$('.pagination').html(str);
	}
</script>
</html>
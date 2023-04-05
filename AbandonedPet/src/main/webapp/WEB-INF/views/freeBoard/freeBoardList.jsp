<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.4.slim.js"
		integrity="sha256-dWvV84T6BhzO4vG6gWhsWVKVoa4lVmLnpBOZh/CAHU4=" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous">
	</script>

	<style>
		.table th,
		tr {
			text-align: center;
		}
		a {
			text-decoration:none;
			color:black;
		}
	</style>

</head>

<body>
	<div class="container col-9">
		<div>
			<h4>자유게시판</h4>
		</div>
		<div class="d-flex justify-content-end">
			<a href="/freeBoard/addFreeBoard" class="btn btn-primary btn-sm"">글쓰기</a>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th style="width:10%" scope="col">글번호</th>
					<th style="width:45%" scope="col">글제목</th>
					<th style="width:15%" scope="col">작성자</th>
					<th style="width:20%" scope="col">작성일</th>
					<th style="width:10%" scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${freeBoardList}" var="freeBoard">
					<tr>
						<th scope="row">${freeBoard.bid }</th>
						<td><a href="/freeBoard/freeBoardDetail?bid=${freeBoard.bid }"><div width='100%'>${freeBoard.btitle }</div></a></td>
						<td>${freeBoard.bwritter }</td>
						<td>${freeBoard.bdate }</td>
						<td>${freeBoard.bhit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
		</ul>
	</nav>
	</div>
</body>
<script>
	var cnt = ${cnt};
	var pageSize = 10;
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
 	 		  str += "<li class='page-item prev'><a class='page-link' href='/freeBoard/freeBoardList?page="+ (start - 1) +"'>&laquo; Previous</a></li>";
 	 		}
 		for(i=start; i<=last; i++){
				str += "<li class='page-item "+ (i==currentPage?'active':'') +"'><a class='page-link' href='/freeBoard/freeBoardList?page=" + i +"'>"+ i +"</a></li>"
		}
 		if (next) {
	 		  str += "<li class='page-item next'><a class='page-link' href='/freeBoard/freeBoardList?page="+ (start + 5) +"'>Next &raquo;</a></li>"
	 		}



 		$('.pagination').html(str);
 	}

</script>
</html>
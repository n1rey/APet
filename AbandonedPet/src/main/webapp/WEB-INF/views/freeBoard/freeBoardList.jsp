<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<style>
		.table th,
		tr {
			text-align: center;
		}
		a {
			text-decoration:none;
			color:black;
		}
		
		$pagination-active-color {
			background-color:#fff380;
		}
		
		#search_box * {
			margin-left:5px;
			margin-bottom:10px;
		}
		
		#search_box > #selectType, #search_box > #keyword {
			border-radius:5px;
			border : 1px solid #333;
		}
	</style>

</head>

<body>
	<div class="container col-9">
		<sec:authorize access="isAuthenticated()">
			<div class="d-flex justify-content-end" id="search_box">
				<select id="selectType">
									<option value="T" selected>제목</option>
									<option value="C">내용</option>
									<option value="W">작성자</option>
				</select>
				<input type="search" placeholder="검색어" id="keyword">
				<button type="button" class="btn btn-sm btn-warning" id="searchBtn">검색</button>
				<a href="/freeBoard/addFreeBoard" class="btn btn-outline-dark btn-sm">글쓰기</a>
			</div>
		</sec:authorize>
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
						<td>${freeBoard.bwriterName }</td>
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
	
	// -------------- 검색 관련 ---------------
/* 	$('#searchBtn').on('click', function(){
		searchExe();
	});
 	$('#keyword').on("keypress", function(){
		if(event.keyCode == 13) {
			searchExe();
		}
	}) 

	function searchExe() {

		currentPage = 1;
		var keyword = $('#keyword').val();
		var type = $('#selectType').val();
		
 		$.ajax({
			type : "GET",
			url : "<c:url value='/freeBoard/freeBoardList'/>",
			data : {
				keyword : keyword,
				type: type
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				var keyword = $('#keyword').val('');
			},
			error : function(request, status, error) {
				alert("다시 시도해주세요.");
			}
		});
		
	} */
	
	

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
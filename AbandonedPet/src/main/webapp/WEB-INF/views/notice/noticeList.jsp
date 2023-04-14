<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.table th,
		tr {
			text-align: center;
		}
	a {
			text-decoration:none;
			color:#333;
	}
	
	
</style>
</head>

<body>
	<div class="container col-9">
		<!-- 관리자 확인 추가 -->
		<div class="d-flex justify-content-end">
			<sec:authorize access="hasAuthority('ROLE_ADMIN')">
			<a href=<c:out value='/notice/addNotice' /> class="btn btn-outline-dark btn-sm"">글쓰기</a>
			</sec:authorize>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th style="width:10%" scope="col">No</th>
					<th style="width:70%" scope="col">글제목</th>
					<th style="width:20%" scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList}" var="notice">
					<tr>
						<td scope="row">${notice.nid }</td>
						<td><a href="/notice/noticeDetail?nid=${notice.nid }"><div width='100%'>${notice.ntitle }</div></a></td>
						<td>${notice.ndate }</td>
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
 	 		  str += "<li class='page-item prev'><a class='page-link' href='/notice/noticeList?page="+ (start - 1) +"'>&laquo; Previous</a></li>";
 	 		}
 		for(i=start; i<=last; i++){
				str += "<li class='page-item "+ (i==currentPage?'active':'') +"'><a class='page-link' href='/notice/noticeList?page=" + i +"'>"+ i +"</a></li>"
		}
 		if (next) {
	 		  str += "<li class='page-item next'><a class='page-link' href='/notice/noticeList?page="+ (start + 5) +"'>Next &raquo;</a></li>"
	 		}



 		$('.pagination').html(str);
 	}

</script>
</html>
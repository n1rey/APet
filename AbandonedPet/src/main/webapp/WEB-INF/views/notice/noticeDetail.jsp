<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style>
	#content {
		min-height:200px;
	}
	
	#content img {
		max-width:100%;
	}
</style>
<script>
	function deleteNotice(){
		var nid = ${notice.nid};
		$('#exampleModal').modal('hide');
		
		$.ajax({
			type : "POST",
			url : "<c:out value='/notice/noticeDelete' />",
			data : {
				nid : nid
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				window.location.replace("<c:out value= '/notice/noticeList'/>");
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
	}
	
</script>
</head>

<body>
	<div class="container col-9">
		<div class="card">
			<div class="card-header">
				<p class="fs-4">${notice.ntitle}</p>
				<div class = "d-flex justify-content-between">
					<p>작성자 : ${notice.nwriterName }</p>
					<p>${notice.ndate}</p>
				</div>
			</div>
			<div class="card-body">
				<div class="d-flex justify-content-end">
					<sec:authorize access="hasAuthority('ROLE_ADMIN')">
						<a class="btn btn-outline-secondary btn-sm m-1" href="<c:out value='/notice/noticeModify?nid=${notice.nid }' />">수정</a>
						<a class="btn btn-outline-secondary btn-sm m-1" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</a>
					</sec:authorize>
				</div>
				<div id="content">
					${notice.ncontent}
				</div>
			</div>
		</div>
		<div>
			<a class="btn btn-sm btn-outline-dark m-1" href="<c:out value='/notice/noticeList' />">목록으로</a>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					정말 삭제하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="javascript:deleteNotice()">확인</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
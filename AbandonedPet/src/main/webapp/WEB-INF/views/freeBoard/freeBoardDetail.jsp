<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="user"/>
</sec:authorize>
	<meta charset="UTF-8">
<style>
	#content {
		min-height:200px;
	}
	
	#content img {
		max-width:100%;
	}
	
	.d-flex {
		box-sizing:border-box;
	}
</style>
<script>
	function deleteBoard(){
		var bid = ${freeBoard.bid};
		$('#exampleModal').modal('hide');
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/freeBoard/freeBoardDelete'/>",
			data : {
				bid : bid
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				window.location.replace("/freeBoard/freeBoardList");
			},
			error : function(request, status, error) {
				alert("댓글 삭제에 실패하였습니다. <br> 다시 시도해주세요.");
			}
		});
	}
	
	function inputCheck(element, type){
		
		var content;
		var writer = '${user.username}';
		
		if(writer == null || writer == ''){
			alert("로그인 해주세요.");
			$('#CommnetTextarea').val('');
			return;
		}
		
		if(type=="new"){
			content = $('#CommnetTextarea').val();
		} else{
			var rid = element.getAttribute('data-rid');
			var id = "CommnetTextarea" + rid;
			content = document.getElementById(id).value;
		}
		
		
		if(content.trim() == null || content.trim() == ""){
			alert("내용을 입력해주세요.");
			return
		}
		
		if(type=="new"){
			insertReply();
		} else{
			updateReply(rid);
		}
		
	}
	
	function insertReply(){
		var bid = '${freeBoard.bid }';
		var content = $('#CommnetTextarea').val();
 		var writer = '${user.username}';
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/freeBoard/addReply'/>",
			data : {
				bid : bid,
				rcontent : content,
				rwriter : writer
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("댓글이 등록되었습니다.");
				replyList(bid);
				$('#CommnetTextarea').val("");
			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	window.onload = function(){
		var bid = ${freeBoard.bid};
 		replyList(bid);
 	}
	
	function replyList(bid){
		$.ajax({
            type: "POST",
            url: "<c:url value='/freeBoard/replyList'/>",
            data: {bid: bid},
            dataType: "json",// 잭슨 드라이버  pom 추가할것
            beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (result) {
            	var replyCnt = result.length;
				document.getElementById('replyCnt').innerHTML = replyCnt;
            	if(result.length != 0){
					var comment_html = "<div>";
					
					for(i = 0;i < result.length;i++){
						var user = "${user.username}";
						var content = result[i].rcontent;
						var writer = result[i].rwriterName;
						var date = result[i].rdate;
						var rid = result[i].rid;
						comment_html += "<div data-rid="+ rid +"><div class='d-flex justify-content-between'><div><span id='rwriter'><strong>" + writer + "</strong></span></div>"
						comment_html += "<div><span id='rdate'>"+ date +"</span>";
						if(user == result[i].rwriter){
							comment_html += "<a class='btn btn-outline-secondary btn-sm m-1' data-rid="+ rid +" onclick='javascript:modify(this)'>수정</a>"
							comment_html += "<a class='btn btn-outline-secondary btn-sm m-1' data-rid="+ rid +" onclick='javascript:deleteReply(this)'>삭제</a></div>"	
						}
						comment_html += "</div>";
						comment_html += "</div>";
						comment_html += "<div id='bcontent' data-rid="+ rid +">" + content + "</div>";
						comment_html += "</div><hr>";
					}
					$("#comment_list").html(comment_html);
            	} else{
            		var comment_html = "<div>등록된 댓글이 없습니다.</div>";
					$("#comment_list").html(comment_html);
            	}
            	
            },
            error: function (request, status, error) {
                alert(request.status + " " + request.responseText);
            }
        });
	}
	
	function modify(element){
		var rid = element.getAttribute('data-rid');
		var comment = $("#bcontent[data-rid='"+rid+"']")[0]; 
		var str = "";
		comment.innerHTML = str;
		str += "<div class='d-flex'>";
		str += "<div class='form-floating col-11'>";
		str += "<textarea class='form-control' id='CommnetTextarea"+ rid +"'></textarea>";
		str += "<label for='floatingTextarea'>Comment</label>";
		str += "</div>";
		str += "<div class='row align-items-end'>";
		str += "<a class='btn btn-outline-secondary btn-sm ms-3' data-rid='" + rid + "' onclick='inputCheck(this, \"mod\")'>등록</a>";
		str += "</div>";
		str += "</div>";
		
		comment.innerHTML = str;
		
	}
	
	function deleteReply(element){
		var rid= element.getAttribute('data-rid');
		var bid = ${freeBoard.bid};
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/freeBoard/deleteReply'/>",
			data : {
				rid : rid
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("댓글이 삭제되었습니다.");
				replyList(bid);
			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	}
	
	function updateReply(rid){
		var id = "CommnetTextarea" + rid;
		var rcontent = document.getElementById(id).value;
		var bid = ${freeBoard.bid};
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/freeBoard/modifyReply'/>",
			data : {
				rid : rid,
				rcontent : rcontent
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("댓글이 수정되었습니다.");
				replyList(bid);
			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	}
	
</script>
</head>

<body>
	<div class="container col-10">
		<div class="card">
			<div class="card-header">
				<p class="fs-4">${freeBoard.btitle}</p>
				<div class = "d-flex justify-content-between">
					<p>작성자 : ${freeBoard.bwriterName }</p>
					<p>${freeBoard.bdate}</p>
				</div>
			</div>
			<div class="card-body">
				<div class="d-flex justify-content-end">
					<!-- 관리자, 작성자만 수정 가능 -->					
					<c:choose>
						<c:when test="${user.username eq freeBoard.bwriter}">
							<a class="btn btn-outline-secondary btn-sm m-1" href=<c:url value="/freeBoard/freeBoardModify?bid=${freeBoard.bid }"/>>수정</a>
							<a class="btn btn-outline-secondary btn-sm m-1" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</a>
						</c:when>
	 					<c:when test="${member.authority eq 'ROLE_ADMIN'}">
							<a class="btn btn-outline-secondary btn-sm m-1" href=<c:url value="/freeBoard/freeBoardModify?bid=${freeBoard.bid }"/>>수정</a>
							<a class="btn btn-outline-secondary btn-sm m-1" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</a>
						</c:when> 
					</c:choose>
				</div>
				<div id="content">
					${freeBoard.bcontent}
				</div>
				<div id="comment_block">
					<div class="row">
						<p>댓글 <span id="replyCnt"></span> 건</p>
					</div>
					<div class="d-flex justify-content-center">
						<div class="form-floating col-10">
						  <textarea class="form-control" id="CommnetTextarea"></textarea>
						  <label for="floatingTextarea">Comment</label>
						</div>
						<div class="row align-items-end">
							<a class="btn btn-outline-dark btn-sm ms-3" onclick="inputCheck(this, 'new')">등록</a>
						</div>
					</div>
					<div id="comment_list" class="mt-3">
					</div>
				</div>
		</div>
		</div>
		<div>
			<a class="btn btn-sm btn-outline-dark m-1" href=<c:url value="/freeBoard/freeBoardList"/>>목록으로</a>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					정말 삭제하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-sm btn-warning" onclick="javascript:deleteBoard()">확인</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<!-- 작성자 : 변예린 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Detail</title>

</head>
<link rel="stylesheet" href="/resources/admin/dist/css/adminlte.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<body>



<!-- main -->
<sec:authentication property="principal" var="user" />

<input type="hidden" value="${protection.pid }" id="pid" />

<div class="col-6" style="margin-left:auto; margin-right:auto;">

	<div class="card card-widget">
		<div class="card-header">
		 <div class="user-block">
		<img class="img-circle" src="/resources/icon/person.svg" alt="User Image">
		<span class="username"><a href="#">${protection.username }</a></span>
		<span class="description">${protection.pdate}</span>
		</div>
	
	
	</div>

	<div class="card-body">
		<h5>${protection.pname}</h5>
		<img class="img-fluid pad" src="/resources/images/${protection.pimage}" alt="Photo">
		<p>나이 : ${protection.page}살</p>
		<p>성별 : ${protection.pgender}</p>
		<p>상황 : ${protection.pcondition}</p>
		특이 사항 : 
		<p> ${protection.petc} </p>
		<br>
		<a class="text-dark heart" style="text-decoration-line: none;">
			<img id="heart" src="/resources/icon/heart.svg">
			좋아요
		</a>
		<c:choose>
         	<c:when test="${user.username eq protection.username}">
         		<a href="/protection/list" class="btn btn-sm btn-outline-warning flex-shrink-0 float-right">돌아가기</a> 
         		<a href="/adoption/list?oid=${protection.username}" class="btn btn-sm btn-outline-warning flex-shrink-0 float-right">입양 신청서 목록</a> 
 				<a href="/protection/update?pid=${protection.pid}" class="btn btn-sm btn-outline-warning flex-shrink-0 float-right">수정</a> 
         	</c:when>
         	<c:otherwise>
         		<sec:authorize access="hasRole('ROLE_USER')">
         		<a href="/protection/list" class="btn btn-sm btn-outline-warning flex-shrink-0 float-right">돌아가기</a> 
				<a href="/adoption/addAdoption?pid=${protection.pid}&oid=${protection.username}" class="btn btn-sm btn-outline-warning flex-shrink-0 float-right">입양 신청서 작성</a>          		
         		</sec:authorize>
         		<sec:authorize access="hasRole('ROLE_ADMIN')">
	         		<a href="/protection/list" class="btn btn-sm btn-outline-warning flex-shrink-0 float-right">돌아가기</a> 
	         		<a href="/adoption/list?oid=${protection.username}" class="btn btn-sm btn-outline-warning flex-shrink-0 float-right">입양 신청서 목록</a> 
	         		<a href="/adoption/addAdoption?pid=${protection.pid}&oid=${protection.username}" class="btn btn-sm btn-outline-warning flex-shrink-0 float-right">입양 신청서 작성</a> 
	 				<a href="/protection/update?pid=${protection.pid}" class="btn btn-sm btn-outline-warning flex-shrink-0 float-right">수정</a> 
         		</sec:authorize>
         	</c:otherwise>
         </c:choose>
	</div>

<div class="card-footer card-comments">
	<div class="card-comment">
	
	<div class="card direct-chat direct-chat-warning">
		<div class="card-header">
			<h3 class="card-title">임시 보호자와 대화해 보세요!</h3>
				<div style="text-align:right">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse">
					<img src="/resources/icon/dash-square.svg">
				</button>
				<button type="button" class="btn btn-tool"
					data-card-widget="remove">
					<img src="/resources/icon/x-square.svg">
				</button>
				</div>
		</div>

		<div class="card-body">

		<div class="direct-chat-messages" id="chatting">
		
		<c:forEach items="${chatList}" var="chat">
		
		<c:if test="${chat.username != user.username}">
			<div class="direct-chat-msg">
				<div class="direct-chat-infos clearfix">
					<span class="direct-chat-name float-left">${chat.username eq protection.username ? '임시보호자' : chat.username}</span>
					<span class="direct-chat-timestamp float-right">${chat.date}</span></div>
						<img class="direct-chat-img" src="/resources/icon/person.svg">
					<div class="direct-chat-text">
						${chat.content}
					</div>
			</div>
		</c:if>
		
		<c:if test="${chat.username == user.username}">
			<div class="direct-chat-msg right">
				<div class="direct-chat-infos clearfix">
					<span class="direct-chat-name float-right">${chat.username eq protection.username ? '임시보호자' : chat.username}</span>
					<span class="direct-chat-timestamp float-left">${chat.date}</span></div>
						<a href="javascript:deleteChat('${chat.cid }', '${protection.pid }');">
							<img class="direct-chat-img float-right" src="/resources/icon/x-circle.svg">
						</a>
						<div class="direct-chat-text">
							${chat.content}
						</div>
			</div>
		</c:if>
		</c:forEach>
		</div>

		</div>

		<div class="card-footer">
			<div class="input-group">
				<input type="text" name="content" id="content"
					placeholder="Type Message ..." class="form-control"> 
					<span class="input-group-append">
						<button type="button" class="btn btn-warning" onclick="javascript:addChat();">Send</button>
					</span>
			</div>
		</div>

	</div>
	
		</div>
	
	
	</div>
	
	
	</div>

</div>


<!-- END main -->



<script src="/resources/admin/plugins/jquery/jquery.min.js"></script>
<script src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/admin/dist/js/adminlte.min.js"></script>

<script>
$(document).ready(function () {
	$("#chatting").scrollTop($(document).height());
	
	// 좋아요가 있는지 확인한 값을 heartval에 저장
		let heartval = ${empty heart.heart ? 0 : heart.heart};
            console.log(heartval);
	
        // heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
        if(heartval > 0) {
            $("#heart").prop("src", "/resources/icon/heart-fill.svg");
            $(".heart").prop('name',heartval)
        } else {
            console.log(heartval);
            $("#heart").prop("src", "/resources/icon/heart.svg");
            $(".heart").prop('name',heartval)
        }
        
        let username = '${user.username}';
        let pid = $("#pid").val();
	// 좋아요 버튼을 클릭 시 실행되는 코드
        $(".heart").on("click", function () {
            var that = $(".heart");
	    $.ajax({
	    	url :'/heart',
	        type :'POST',
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        data : {
	        	pid: pid,
	        	username: username,
	        	${_csrf.parameterName}: '${_csrf.token}'
	        },
	    	success : function(data){
	    		that.prop('name',data);
	        	if(data==1) {
	            	     $('#heart').prop("src","/resources/icon/heart-fill.svg");
	        	} else {
                    	 $('#heart').prop("src","/resources/icon/heart.svg");
	        	}
           	}
	    });
        });
    });


function addChat(){
	let content = $("#content").val();
	let username = '${user.username}';
	let pid = '${protection.pid}'
	
	$.ajax({
        type:"POST",
        url:"/protection/addChat",
        data:{content : content,
        	  username : username,
        	  pid : pid
        	  },
        beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function(result) {
            alert("등록 완료");
            $("#content").val().reset();
            window.location.reload(); 
        },
        error:function (request, status, error) {
            alert(request.status + " " + request.responseText);
        }
    })
    window.location.reload(); 
}

function deleteChat(cid, pid){
	 if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			$.ajax({
		        type:"POST",
		        url:"/protection/deleteChat",
		        data:{cid : cid,
		        	  pid : pid
		        	  },
		        beforeSend : function(xhr)
		        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
		        success: function(result) {
		            alert("삭제 완료");
		            window.location.reload(); 
		        },
		        error:function (request, status, error) {
		            alert(request.status + " " + request.responseText);
		        }
		    })
		    window.location.reload(); 
	 }else{   //취소
	     return false;
	 }
}





</script> 
</body>
</html>


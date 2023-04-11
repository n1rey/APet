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

<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<body>



<!-- main -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-4">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="/resources/images/${protection.pimage}" alt="" /></div>
                    <div class="col-md-6">
                    	
                    	<sec:authentication property="principal" var="user" />
                    
                    	<input type="hidden" value="${protection.pid }" id="pid" />
                    	
                        <h1 class="display-5 fw-bolder">${protection.pname}</h1>
                        <p>${protection.page}</p>
                        <p>${protection.pgender}</p>
                        <p>${protection.pcondition}</p>
                        <p class="lead">${protection.petc}</p>
                        <p>${protection.pdate}</p>
						<a class="text-dark heart" style="text-decoration-line: none;">
							<img id="heart" src="/resources/icon/heart.svg">
							좋아요
						</a>
						<br><br>
                        <div class="d-flex">
                        
                        
                        
                        <c:choose>
                        	<c:when test="${user.username eq protection.username}">
                        		<a href="/protection/list" class="btn btn-outline-dark flex-shrink-0">돌아가기</a>&nbsp&nbsp
                        		<a href="/adoption/list?oid=${protection.username}" class="btn btn-outline-dark flex-shrink-0">입양 신청서 목록</a>&nbsp&nbsp
                				<a href="/protection/update?pid=${protection.pid}" class="btn btn-outline-dark flex-shrink-0">수정</a>
                        	</c:when>
                        	<c:when test="${user.username eq 'admin@admin'}">
                        		<a href="/protection/list" class="btn btn-outline-dark flex-shrink-0">돌아가기</a>&nbsp&nbsp
                        		<a href="/adoption/list?oid=${protection.username}" class="btn btn-outline-dark flex-shrink-0">입양 신청서 목록</a>&nbsp&nbsp
                        		<a href="/adoption/addAdoption?pid=${protection.pid}&oid=${protection.username}" class="btn btn-outline-dark flex-shrink-0">입양 신청서 작성</a>&nbsp&nbsp
                				<a href="/protection/update?pid=${protection.pid}" class="btn btn-outline-dark flex-shrink-0">수정</a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href="/protection/list" class="btn btn-outline-dark flex-shrink-0">돌아가기</a>&nbsp&nbsp
                        		<a href="/adoption/addAdoption?pid=${protection.pid}&oid=${protection.username}" class="btn btn-outline-dark flex-shrink-0">입양 신청서 작성</a>&nbsp&nbsp
                        	</c:otherwise>
                        </c:choose>
                        
                
                        </div>
                    </div>
                </div>
                </div>
                
                <div class="container">
                
<!-- Chat 페이지 -->
				<div class="col-4" style="margin-left: 655px;">
					<div class="card direct-chat direct-chat-primary">
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
									<c:choose>
										<c:when test="${chat.username eq user.username }">
											<a href="javascript:deleteChat('${chat.cid }', '${protection.pid }');">
												<img class="direct-chat-img" src="/resources/icon/x-circle.svg">
											</a>
										</c:when>
										<c:otherwise>
												<img class="direct-chat-img" src="/resources/icon/person.svg">
										</c:otherwise>
									</c:choose>
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
									<c:choose>
										<c:when test="${chat.username eq user.username }">
											<a href="javascript:deleteChat('${chat.cid }', '${protection.pid }');">
												<img class="direct-chat-img" src="/resources/icon/x-circle.svg">
											</a>
										</c:when>
										<c:otherwise>
												<img class="direct-chat-img" src="/resources/icon/person.svg">
										</c:otherwise>
									</c:choose>
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
										<button type="button" class="btn btn-primary" onclick="javascript:addChat();">Send</button>
									</span>
							</div>
						</div>

					</div>
              </div>  
<!-- END Chat 페이지 -->

            </div>
        </section>



<!-- jQuery -->
<script src="/resources/admin/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/admin/dist/js/adminlte.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script>
$(document).ready(function () {
	$("#chatting").scrollTop($(document).height());
	
	// 좋아요가 있는지 확인한 값을 heartval에 저장
		let heartval = ${empty heart.heart ? 0 : heart.heart};
	
        // heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
        if(heartval > 0) {
            console.log(heartval);
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
            alert("등록 완료")
            $("#content").val().reset();
        },
        error:function (request, status, error) {
            alert(request.status + " " + request.responseText);
        }
    })
    window.location.reload(); 
}

function deleteChat(cid, pid){
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
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


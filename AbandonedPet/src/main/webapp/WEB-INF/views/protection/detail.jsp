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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<body>



<!-- main -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
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
                        		<a href="/adoption/list?oid=${protection.username}" class="btn btn-outline-dark flex-shrink-0">입양 신청서 목록</a>&nbsp&nbsp
                				<a href="/protection/update?pid=${protection.pid}" class="btn btn-outline-dark flex-shrink-0">수정</a>
                        	</c:when>
                        	<c:when test="${user.username eq 'admin@admin'}">
                        		<a href="/adoption/list?oid=${protection.username}" class="btn btn-outline-dark flex-shrink-0">입양 신청서 목록</a>&nbsp&nbsp
                        		<a href="/adoption/addAdoption?pid=${protection.pid}&oid=${protection.username}" class="btn btn-outline-dark flex-shrink-0">입양 신청서 작성</a>&nbsp&nbsp
                				<a href="/protection/update?pid=${protection.pid}" class="btn btn-outline-dark flex-shrink-0">수정</a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href="/adoption/addAdoption?pid=${protection.pid}&oid=${protection.username}" class="btn btn-outline-dark flex-shrink-0">입양 신청서 작성</a>&nbsp&nbsp
                        	</c:otherwise>
                        </c:choose>
                        
                
                        </div>
                    </div>
                </div>
            </div>
        </section>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script>
$(document).ready(function () {
	
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

</script> 
</body>
</html>


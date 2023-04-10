<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
 
<!-- 필요없을듯!!!! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Detail</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<script>
function updateAccept() {
    acondition = "입양 승낙";
    aid = $("#aid").val();

    $.ajax({
        type: "POST",
        url: "/adoption/update",
        data: {
        	aid: aid,
        	acondition: acondition
        },
        beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function (result) {
            alert('변경 완료');
        },
        error: function (request, status, error) {
            alert(request.status + " " + request.responseText);
        }
    });
    window.location.reload(); 

}

function updateDecline() {
	acondition = "입양 거절";
	aid = $("#aid").val();

    $.ajax({
        type: "POST",
        url: "/adoption/update",
        data: {
        	aid: aid,
        	acondition: acondition
        },
        beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function (result) {
            alert('변경 완료');
        },
        error: function (request, status, error) {
            alert(request.status + " " + request.responseText);
        }
    });
    window.location.reload(); 

}

</script> 

</head>
<body>



    <div class="container">
        <div class="row">
              <div class="col-md-8">
				<input type="hidden" id="aid" value="${adoption.aid}">
                <br>
				<p>${adoption.aname}
				<p>${adoption.aage}
				<p>${adoption.agender}
				<p>${adoption.aphone}
				<p>${adoption.adistrict}
				<p>${adoption.ajob}
				<p>${adoption.acondition}
                <br>
                
                <a href="javascript:updateAccept()" class = "btn btn-warning">입양 승낙</a><br>
                
                <a href="javascript:updateDecline()" class = "btn btn-warning">입양 거절</a><br>
                
                
<%-- 				<form:form name="addForm" method="put"> --%>
<!-- 				 		<a href="javascript:addcartFunction()" class="btn btn-primary">제품주문 &raquo;</a> -->
<%-- 				        기존 방식을 ajax 적용	 --%>
<%-- 						<a href="<c:url value="/cart"/>" class = "btn btn-warning">장바구니 &raquo;</a> --%>
<%-- 						<a href="<c:url value="/cars"/>" class = "btn btn-secondary">제품목록 &raquo;</a> --%>
<%-- 						</form:form> --%>
            </div>

				<h3></h3>


		<p>
		
		</div>
	</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

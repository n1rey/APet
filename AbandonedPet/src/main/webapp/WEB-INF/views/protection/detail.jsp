<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Detail</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<script>
</script> 

</head>
<body>



    <div class="container">
        <div class="row">
            <div class="col-md-4">
				<img class="img-responsive center-block" src="<c:url value="/resources/images/${protection.pimage}"/>" style="width:100%"/>
             </div>
              <div class="col-md-8">

                <br>
				<p>${protection.pname}
				<p>${protection.page}
				<p>${protection.pgender}
				<p>${protection.petc}
				<p>${protection.pcondition}
				<p>${protection.pdate}
                <br>
                <input type="button" class="btn btn-primary" value="좋아요"><br>
                
                <a href="/adoption/addAdoption?pid=${protection.pid}&oid=${protection.username}" class = "btn btn-warning">입양 신청서 작성</a>
                
                <a href="/protection/update?pid=${protection.pid}" class = "btn btn-warning">수정</a>
                
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

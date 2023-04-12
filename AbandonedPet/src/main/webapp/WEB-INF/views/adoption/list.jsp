<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car List</title>
</head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>


<script>
function updateAccept(aid) {
    let acondition = "입양 승낙";
    
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

function updateDecline(aid) {
	let acondition = "입양 거절";

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
<body>

<sec:authentication property="principal" var="user" />

	<div class="container shadow mx-auto p-5 w-75">
		<div>
			<div class="input-group justify-content-center" >
			
			</div>
			   <table id="table" align="center" width="400" class="table table-striped table-hover">
               <thead>
               <tr>
               	 <th></th>
                 <th>번호</th>
                 <th>동물</th>
                 <th>성함</th>
                 <th>나이</th>
                 <th>성별</th>
                 <th>전화번호</th>
                 <th>직업</th>
                 <th>지역</th>
                 <th></th>
               </tr>
               </thead>
               <tbody>
               		<c:forEach items="${adoptionList }" var="list">
		   			<tr>
		   				<td></td>
		   				<td>${list.aid }</td>
		   				<td>${list.pname }</td>
		   				<td>${list.aname }</td>
		   				<td>${list.aage}</td>
		   				<td>${list.agender}</td>
		   				<td>${list.aphone}</td>
		   				<td>${list.ajob}</td>
		   				<td>${list.adistrict}</td>
		   				<td>
		   				<c:choose>
		   					<c:when test="${list.acondition eq '입양 승낙' or list.acondition eq '입양 거절'}">
			   					${list.acondition}
		   					</c:when>
		   					<c:otherwise>
			   					<a href="javascript:updateAccept('${list.aid }')" class = "btn btn-outline-dark flex-shrink-0">입양 승낙</a>
			   					<a href="javascript:updateDecline('${list.aid }')" class = "btn btn-outline-dark flex-shrink-0">입양 거절</a>
		   					</c:otherwise>
		   				</c:choose>
		   				</td>
		   			</tr>
		   			</c:forEach>
               </tbody>
             </table>
        </div>
  	</div>     


<script
		src="/resources/admin/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<script>
    $(function () {
        $('#table').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });

  </script>
</body>
</html>
<!-- 작성자 : 변예린 -->

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

<body>

<sec:authentication property="principal" var="user" />
  	
  	
<!-- main -->  	
	<div class="container shadow mx-auto p-5 w-75">
		<div>
			<div class="input-group justify-content-center" >
			
			</div>
			<table id="table" align="center" width="400" class="table table-striped table-hover">
				<thead>
				 <tr>
                 <th>번호</th>
                 <th>신청 동물 이름</th>
                 <th>성함</th>
                 <th>나이</th>
                 <th>성별</th>
                 <th>입양 결과</th>
                 <th></th>
                 </tr>
				</thead>
				<tbody>
					<c:forEach items="${adoptionList }" var="list">
		   			<tr>
		   				<td>${list.aid }</td>
		   				<td>${list.pname }</td>
		   				<td>${list.aname }</td>
		   				<td>${list.aage}</td>
		   				<td>${list.agender}</td>
		   				<td>${list.acondition }</td>
		   				<td><a href="/adoption/delete?aid=${list.aid }&nid=${list.nid}" class="btn btn-outline-warning flex-shrink-0">삭제</a></td>
		   			</tr>
			   		</c:forEach>
				</tbody>	
			</table>
		</div>
	</div>

<script src="/resources/admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/resources/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/resources/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="/resources/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="/resources/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="/resources/admin/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="/resources/admin/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="/resources/admin/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

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
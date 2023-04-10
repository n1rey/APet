<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>관리자 페이지 - 회원관리</h2>
				<div class="col-lg-3 d-none d-lg-block">
				</div>

				<div class="col-lg-9">
					<div class="row">
						<div class="col-3 text-muted">
							<select class="form-select form-select-sm w-50 d-inline"
								id="selectAmount">
								<option value="10" selected>10</option>
								<option value="20">20</option>
								<option value="40">40</option>
							</select> <span class="d-inline">개씩 보기</span>
						</div>
						<div class="col-9 text-end">
						</div>
					</div>
					<hr class="my-4">

					<table class="table table-hover shadow bg-body rounded">
						<thead>
							<tr style="background-color: #548687; color: white;">
								<th scope="col" class="col-2">아이디</th>
								<th scope="col" class="col-2">이름</th>
								<th scope="col" class="col-2">닉네임</th>
								<th scope="col" class="col-2">권한</th>
								<th scope="col" class="col-2">가입일자</th>
								<th scope="col" class="col-4">회원 삭제</th>
							</tr>
						</thead>
						<tbody id="imgList">


						</tbody>
					</table>
					<div class="row text-center" id="none"></div>
					
					<hr class="my-4">
					<div class="row">
						<div class="col-8">
							<ul class="pagination justify-content-center" id="pagination">

							</ul>
						</div>
						<div class="col-4">
							<div class="d-flex text-end">
								<select class="form-select" id="selectType">
									<option value="U" selected>아이디</option>
									<option value="M">이름</option>
									<option value="N">닉네임</option>
									<option value="UM">아이디/이름</option>
									<option value="UN">아이디/닉네임</option>
									<option value="MN">이름/닉네임</option>
									<option value="UMN">아이디/이름/닉네임</option>
								</select> <input class="form-control form-control-sm" type="search"
									placeholder="검색어" id="keyword">
								<button class="btn btn-sm btn-outline-success" type="button"
									id="searchBtn"> 검색
									<i class="bi bi-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	</div>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>
	
	<script>
	/**
	 * 
	 */
	 
	/* Criteria 객체 */
	var cri = {
			amount : $('#selectAmount').val(),							// 한 페이지에 표시 할 목록 갯수
			pageNum : 1,
			type : null,
			keyword : null
	}
	/* Pagination 정보 객체 */
	var pageObj = {
			NUM_PER_PAGE : 5.0,					// 한 페이지에 표시 할 페이지 번호 수
			start : 1,							// 시작 페이지 번호
			end : this.NUM_PER_PAGE,			// 끝 페이지 번호
			isPrevious : false,					// 이전
			isNext : false,						// 다음
			
			pageCal : function(cri){
				var total = 0;
				fetch(getTotalCountUrl(), {	
					method: "post",
					  headers: {
			    		'${_csrf.headerName}': '${_csrf.token}' // CSRF 토큰 값
	 					 },
					body: new URLSearchParams({
							amount: cri.amount,
							pageNum: cri.pageNum,
							offset: cri.amount * (cri.pageNum - 1),
							keyword: cri.keyword,
							type: cri.type
						})
			        })
					.then(resp => resp.text())
					.then(data => {
						data.trim()
						console.log(data);
						total = data*1
						setPage(total, cri, this);
					})
			}
	}

	// 페이지네이션 설정 함수
	function setPage(total, cri, pageObj) {
		var pages = Math.ceil(total / cri.amount);
		pageObj.end = (Math.ceil(cri.pageNum / pageObj.NUM_PER_PAGE) * pageObj.NUM_PER_PAGE);
		pageObj.start = (pageObj.end - (pageObj.NUM_PER_PAGE - 1));
		pageObj.end = pageObj.end >= pages ? pages : pageObj.end;	// 실제 끝 페이지 번호 확인
		pageObj.isPrevious = pageObj.start > 1;
		pageObj.isNext = pageObj.end < pages;
		
		
		var pageHTML = '';
		//<!-- previous -->
		if (pageObj.isPrevious) {
			pageHTML += ''
			+'<li class="page-item">'
				+'<button type="button" class="page-link" onclick="previous()" aria-label="Previous">'
					+'<span aria-hidden="true">&laquo;</span>'
					+'<span class="sr-only">이전</span>'
				+'</button>'
			+'</li>'
		}
		//<!-- page -->
		for (var i = pageObj.start; i <= pageObj.end; i++) {
			pageHTML += ''
			+'<li class="page-item ' + (cri.pageNum == i ? 'active disabled' : '') +'">'
				+'<button class="page-link" onclick="pageBtn('+i+')">'+i+'</button>'
			+'</li>'
		}
		//!-- next -->
		if (pageObj.isNext) {
			pageHTML += ''
			+'<li class="page-item">'
				+'<button type="button" class="page-link" onclick="next()" aria-label="Next">'
					+'<span class="sr-only">다음</span>'
					+'<span aria-hidden="true">&raquo;</span>'
				+'</button>'
			+'</li>'
		}
		console.log(pageHTML)
		$('#pagination').html(pageHTML);
		getList();
	}

	/* 현재 버튼 클릭 시 실행 함수 */
	function pageBtn(pageNum) {
		cri.pageNum = pageNum;
		pageObj.pageCal(cri);
	}
	/* 이전 버튼 클릭 시 실행 함수 */
	function previous() {
		pageObj.start -= 1;
		cri.pageNum = pageObj.start
		pageObj.pageCal(cri);
	}
	/* 다음 버튼 클릭 시 실행 함수 */
	function next() {
		pageObj.end += 1;
		cri.pageNum = pageObj.end
		pageObj.pageCal(cri);
	}

	//-------------- 게시글 표시 갯수 변경 ---------------
	$('#selectAmount').on('change', function(){
		cri.amount = $(this).val();
		cri.pageNum = 1;
		pageObj.start = 1;
		pageObj.end = pageObj.NUM_PER_PAGE
		pageObj.pageCal(cri);
	});


	// -------------- 검색 관련 ---------------
	$('#searchBtn').on('click', function(){
		searchExe();
	});
	$('#keyword').on("keypress", function(){
		if(event.keyCode == 13) {
			searchExe();
		}
	})

	function searchExe() {

		cri.pageNum = 1
		cri.keyword = $('#keyword').val()
		cri.type = $('#selectType').val()
		pageObj.pageCal(cri);
	}

	onload = function() {
		pageObj.pageCal(cri);
	}

	function getList() {
		fetch(getListUrl(), {	
			method: "post",
			headers: {
		    		'${_csrf.headerName}': '${_csrf.token}' // CSRF 토큰 값
					 },
			body: new URLSearchParams({
					amount: cri.amount,
					pageNum: cri.pageNum,
					offset: cri.amount * (cri.pageNum - 1),
					keyword: cri.keyword,
					type: cri.type
				})
	        })
			.then(resp => resp.json())
			.then(data => {
				console.log(data);
				printList(data);
			})
	}
	
	</script>
	
	<script>
	/*
		 [form id 이걸로 하셈]

		 검색 버튼 : searchBtn
		 검색 입력 인풋 : keyword
		 검색 선택 셀렉트 : selectType
		 게시글 표시 갯수 셀렉트 : selectAmount
		 */

		/* 전체 게시물 수 가져오기 위해 처리한 jsp URL 입력해주세요 */
		function getTotalCountUrl() {
			return '/admin/member/total'
		}
		/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
		function getListUrl() {
			return '/admin/member/all'
		}

		function printList(data) {
			//TODO: 리스트 출력 처리 하세요
			if (data.length < 1) {
				var noneStr = '';
				noneStr ='<div>회원이 없습니다.<div>'
				$("#none").html(noneStr);
			}
			var imgHTML = '';
			for (var i = 0; i < data.length; i++) {
				imgHTML += ''
						+ "<tr>"
						+ "<td>" + data[i].username + "</td>"
						+ '<td>' + data[i].mname + "</td>" 
						+ '<td>' + data[i].mnickname + "</td>"
						+ '<td><select id="roleSelect" onchange="updateAuth(\''+ data[i].username +'\', this)">'
				if (data[i].authority == "ROLE_ADMIN") {
					imgHTML += '<option value="ROLE_ADMIN" selected>ROLE_ADMIN</option>'
							+ '<option value="ROLE_USER">ROLE_USER</option>'
				} else {
					imgHTML += '<option value="ROLE_ADMIN">ROLE_ADMIN</option>'
							+ '<option value="ROLE_USER" selected>ROLE_USER</option>'
				}
						  			
				imgHTML	+= '</select><td/><td>'+ data[i].mdate + "</td>"
						+ "<td><button onclick=\"removeMember('"+ data[i].username +"')\" class='btn btn-danger'> 회원삭제 </button></td></tr>"
			}
			$('#imgList').html(imgHTML);
		}
	</script>

<script>
function removeMember(uname) {
	if (confirm("정말로 삭제하시겠습니까?")) {
		fetch("/admin/member/remove", {	
			method: "post",
			headers: {
		    		'${_csrf.headerName}': '${_csrf.token}' // CSRF 토큰 값
					 },
			body: new URLSearchParams({
					username: uname
				})
	        })
			.then(data => {
				console.log(data);
				cri.pageNum = 1
				pageObj.pageCal(cri);
				alert("삭제되었습니다.");
			})	
			.catch(error => {
				console.error(error)
				alert("처리에 문제가 생겼습니다.")
			});
	}
	
}

function updateAuth(username, e) {
	console.log(document.getElementById("roleSelect").value)
    $.ajax({
       type : "POST",
       url : "/admin/member/changeAuth",
       data : {
          username : username,
          auth : e.value
       },
       beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
       },
       success : function(result) {
          alert("권한 정보 변경이 완료되었습니다.")
       },
       error : function(request, status, error) {
          alert(request.status + " " + request.responseText);
       }
    })
 }
 
 
</script>

</body>
</html>
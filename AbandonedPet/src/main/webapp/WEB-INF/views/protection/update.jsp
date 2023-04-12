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
<title>임시 보호 글 수정</title>
</head>
<body>

	

<!-- main -->
  <section class="py-1 text-center container">
    <div class="row py-lg-3">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h4 class="fw-light">임시 보호 글 수정</h4>
      </div>
    </div>
  </section>

	<form:form modelAttribute="updateProtection" 
			   action="./update?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post"
	           enctype="multipart/form-data"
	           id="updateForm">    
	           
	           <sec:authentication property="principal" var="user" />
	           
	           <form:input path="pid" value="${protection.pid }" type="hidden"/>
	           <form:input path="username" value="${protection.username }" type="hidden" class="form-control"/>

<div class="album py-5">	           
<div class="container"> 
  <main>        
      <div class="row g-5 justify-content-center">
      <div class="col-md-7 col-lg-8">
        <form class="needs-validation" action="foodAddCheckTest.jsp" method="post" enctype="multipart/form-data">
          <div class="row g-3">
            
            <div class="col-6">
              <label class="form-label">보호 동물 이름</label>
              <div class="input-group has-validation">
                <form:input path="pname" id="name" value="${protection.pname }" class="form-control"/>
              </div>
            </div>
            
            
            <div class="col-6">
              <label class="form-label">보호 동물 추정 나이</label>
              <div class="input-group has-validation">
                <form:input path="page" id="age" value="${protection.page }" class="form-control"/>
              </div>
            </div>
            
            <div class="col-6">
              <label class="form-label">보호 동물 성별</label>
              <div class="input-group has-validation">
				<div class="col-4">
              	<form:radiobutton path="pgender" value="암컷" label="암컷" checked="${protection.pgender == '암컷' ? 'checked' : ''}" />
              	</div>
              	<div class="col-4 justify-content-end">
              	<form:radiobutton path="pgender" value="수컷" label="수컷" checked="${protection.pgender == '수컷' ? 'checked' : ''}" />
              	</div>              
              </div>
            </div>
            
            <div class="col-12">
              <label class="form-label">특이사항</label>
              <div class="input-group has-validation">
                <textarea name="petc" rows="2" cols="2" class="form-control">${protection.petc }</textarea>
              </div>
            </div>
            
            <div class="col-6">
              <label class="form-label">보호상태</label>
              <div class="input-group has-validation">
              	<div class="col-4">
                <form:radiobutton path="pcondition" value="보호 중" label="보호 중" checked="${protection.pcondition == '보호 중' ? 'checked' : ''}"/>
                </div>
                <div class="col-4 justify-content-end">
                <form:radiobutton path="pcondition" value="입양 완료" label="입양 완료" checked="${protection.pcondition == '입양 완료' ? 'checked' : ''}"/>		
                </div>
              </div>
            </div>
            
            <div class="col-6">
              <label class="form-label">사진</label>
              <div class="input-group has-validation">
                <form:input path="image" type="file" class="form-control"/>
              </div>
            </div>

 
		  </div>
          <hr class="my-4"> 
          <input type="button" onclick="javascript:checkFunction();" class="w-100 btn btn-outline-warning flex-shrink-0" value="수정"/>
          <a href="/protection/delete?pid=${protection.pid}" class = "w-100 btn btn-outline-danger flex-shrink-0">삭제</a>
        </form>
      </div>
    </div>
  </main>
</div>
</div>
</form:form>



<script>
function checkFunction(){
	var txtPtn = /[a-z|A-Z|가-힣]/; //문자만 가능
	var numPtn = /\d/; //숫자만 가능
	
	if(!txtPtn.test( $('#name').val().trim() ) ){
		alert('[이름]\n영문 또는 한글만 입력해 주세요');
		$('#name').focus();
	} else if ( !numPtn.test( $('#age').val().trim() ) ){
		alert('[나이]\n숫자만 입력해 주세요');
		$('#age').focus();
	} else {
		$('#updateForm').submit();
	}
}

</script>
</body>
</html>
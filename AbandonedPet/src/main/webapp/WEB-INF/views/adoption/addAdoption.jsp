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
<title>임시 보호 등록</title>
</head>
<body>

	

<!-- main -->
  <section class="py-1 text-center container">
    <div class="row py-lg-3">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h4 class="fw-light">입양 신청서 작성</h4>
      </div>
    </div>
  </section>

	<form:form modelAttribute="NewAdoption" 
			   action="./addAdoption?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post"
	           enctype="multipart/form-data"
	           id="adoptionForm">
	           
	           <sec:authentication property="principal" var="user" />
	           
	           <form:input type="hidden" path="oid" value="${oid}" class="form-control"/>
	           <form:input type="hidden" path="pid" value="${pid}" class="form-control"/>
	           <form:input type="hidden" path="nid" value="${user.username }" class="form-control"/>
	           
<div class="album py-5">	                 
<div class="container"> 
  <main>        
      <div class="row g-5 justify-content-center">
      <div class="col-md-7 col-lg-8">
          <div class="row g-3">
            <div class="col-6">
              <label class="form-label">입양 희망자 성함</label>
              <div class="input-group has-validation">
              	<form:input path="aname" id="name" class="form-control" required="required"/>
              </div>
            </div>
            
            <div class="col-6">
              <label class="form-label">입양 희망자 나이</label>
              <div class="input-group has-validation">
                <form:input path="aage" id="age" class="form-control" required="required"/>
              </div>
            </div>
            
            
            <div class="col-6">
              <label class="form-label">입양 희망자 성별</label>
              <div class="input-group has-validation">
              	<div class="col-4">
              	<form:radiobutton path="agender" value="여성" label="여성" checked="checked"/>
              	</div>
              	<div class="col-4 justify-content-end">
              	<form:radiobutton path="agender" value="남성" label="남성"/>
              	</div>
              </div>
            </div>
            
            <div class="col-6">
              <label class="form-label">입양 희망자 전화번호</label>
              <div class="input-group has-validation">
                <input name="phone1" id="phone1" class="form-control" required="required"/>
              	<span class="input-group-text">-</span>
               	<input name="phone2" id="phone2" class="form-control" required="required"/>
              	<span class="input-group-text">-</span>
               	<input name="phone3" id="phone3" class="form-control" required="required"/>
              </div>
            </div>
            
            <div class="col-6">
              <label class="form-label">입양 희망자 거주 지역</label>
              <div class="input-group has-validation">
                <form:input path="adistrict" id="district" class="form-control" required="required"/>
              </div>
            </div>
            <div class="col-6">
              <label class="form-label">입양 희망자 직업</label>
              <div class="input-group has-validation">
                <form:input path="ajob" id="job" class="form-control" required="required"/>
              </div>
            </div>

 
		  </div>
          <hr class="my-4"> 
          <button class="w-100 btn btn-outline-warning flex-shrink-0" type="button" 
          		  onclick="javascript:checkFunction();">등록</button>
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
		alert('[성함]\n영문 또는 한글만 입력해 주세요');
		$('#name').focus();
	} else if ( !numPtn.test( $('#age').val().trim() ) ){
		alert('[나이]\n숫자만 입력해 주세요');
		$('#age').focus();
	} else if ( !numPtn.test( $('#phone1').val().trim() ) ){
		alert('[전화번호]\n숫자만 입력해 주세요');
		$('#phone1').focus();
	} else if ( !numPtn.test( $('#phone2').val().trim() ) ){
		alert('[전화번호]\n숫자만 입력해 주세요');
		$('#phone2').focus();
	} else if ( !numPtn.test( $('#phone3').val().trim() ) ){
		alert('[전화번호]\n숫자만 입력해 주세요');
		$('#phone3').focus();
	} else if ( !txtPtn.test( $('#district').val().trim() ) ){
		alert('[거주 지역]\n영문 또는 한글만 입력해 주세요');
		$('#district').focus();
	} else if ( !txtPtn.test( $('#job').val().trim() ) ){
		alert('[직업]\n영문 또는 한글만 입력해 주세요');
		$('#job').focus();
	} else {
		$('#adoptionForm').submit();
	}
}

</script>
</body>
</html>
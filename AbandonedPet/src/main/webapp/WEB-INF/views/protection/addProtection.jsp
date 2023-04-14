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
        <h4 class="fw-light">임시 보호 글 등록</h4>
      </div>
    </div>
  </section>
    
	<form:form modelAttribute="NewProtection" 
			   action="./addProtection?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post"
	           enctype="multipart/form-data"
	           id="protectionForm">  
<div class="album py-5">	                 
<div class="container"> 
  <main>        
  
      <div class="row g-5 justify-content-center">
      <div class="col-md-7 col-lg-8">
          <div class="row g-3">
           	
           	<sec:authentication property="principal" var="user" />
           	<form:input type="hidden" path="username" value="${user.username}" class="form-control"/>
            
            <div class="col-6">
              <label class="form-label">보호 동물 이름</label>
              <div class="input-group has-validation">
                <form:input path="pname" id="name" class="form-control"/>
                 <form:errors path="pname" cssClass="error" />
              </div>
            </div>
            
            
            <div class="col-3">
              <label class="form-label">보호 동물 추정 나이</label>
              <div class="input-group has-validation">
                <form:input type="number" path="page" id="age" class="form-control" min="0" max="100"/>&nbsp살
                 <form:errors path="page" cssClass="error" style="color: red;" />
              </div>
            </div>
            
            <div class="col-6">
              <label class="form-label">보호 동물 성별</label>
              <div class="input-group has-validation">
              	<div class="col-4">
              	<form:radiobutton path="pgender" value="암컷" label="암컷" checked="checked"/>
              	</div>
              	<div class="col-4 justify-content-end">
              	<form:radiobutton path="pgender" value="수컷" label="수컷"/>
              	<form:errors path="pgender" cssClass="error" style="color: red;" />
              	</div>
              </div>
            </div>
            
            <div class="col-12">
              <label class="form-label">특이사항</label>
              <div class="input-group has-validation">
                <form:textarea path="petc" cols="50" rows="2" class="form-control"/>
                <form:errors path="petc" cssClass="error"  style="color: red;"/>
              </div>
            </div>
            <div class="col-12">
              <label class="form-label">사진</label>
              <div class="input-group has-validation">
              	<div class="col-6">
                <form:input path="image" type="file" id="photo" class="form-control" required="required"/>
              	</div>
              	&nbsp&nbsp
              	<div class="col-4">
              	<form:errors path="pimage" scsClass="error" style="color: red;" />
              	<form:errors path="image" scsClass="error" style="color: red;" />
              	</div>
              </div>
            </div>

 
		  </div>
          <hr class="my-4"> 
          <button class="w-100 btn btn-outline-warning flex-shrink-0" 
          		  type="button" onclick="javascript:checkFunction();">등록</button>
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
	var regex = /\.(gif|jpg|jpeg|png)$/; // gif|jpg|jpeg|png 확장자만 가능
	
	if(!txtPtn.test( $('#name').val().trim() ) ){
		alert('[이름]\n영문 또는 한글만 입력해 주세요');
		$('#name').focus();
	} else if ( !numPtn.test( $('#age').val().trim() ) ){
		alert('[나이]\n숫자만 입력해 주세요');
		$('#age').focus();
	} else if(!regex.test($('#photo').val().trim())){
		alert('[사진]\ngif, jpg, png 확장자만 첨부해 주세요');
		$('#photo').focus();
	} else {
		$('#protectionForm').submit();
	}
}

</script>
</body>
</html>
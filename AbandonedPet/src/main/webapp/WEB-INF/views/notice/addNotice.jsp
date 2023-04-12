<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<!DOCTYPE html>
<html>

<head>

<style>
	.error {
		font-size:12px;
		color:red;
	}
</style>  
  
  
</head>


<!-- Main content -->
<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-lg-9">
      <div class="card">
        <div class="card-body">
          <form:form modelAttribute="notice" action="./addNotice?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" method="post">
            <fieldset>
            <sec:authentication property="principal" var="user" />
	 			<form:input path="nwriter" type="hidden" value="${user.username}" class="form-control"/>
              <div class="form-group">
                <label for="inputName">제목</label>
                <form:errors path="ntitle" cssClass="error" />
                <form:input path="ntitle" class="form-control" placeholder="제목을 입력해주세요." />
              </div>
              <div class="form-group">
                <label for="inputDescription">내용</label>
                <form:errors path="ncontent" cssClass="error" />
                <form:textarea path="ncontent" class="form-control" id="summernote" />
              </div>

              <div class="row">
                <div class="col d-flex justify-content-end">
                  <a href="/notice/noticeList" class="btn btn-secondary m-1">취소</a>
                  <input type="submit" value="등록" class="btn btn-warning m-1">
                </div>
              </div>
            </fieldset>
          </form:form>
        </div>
      </div>
    </div>
  </div>
</div>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
      $('#summernote').summernote({
        placeholder: '내용을 작성해주세요.',
        tabsize: 2,
        height: 200,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['insert', ['picture']]
        ]
      });
</script>

</html>
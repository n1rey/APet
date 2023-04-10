<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">

  
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
          <form:form modelAttribute="freeBoard" action="./freeBoardModify?${_csrf.parameterName}=${_csrf.token}"
            class="form-horizontal" method="post">
            <fieldset>
            	<form:input path="bid" type="hidden" value="${freeBoard.bid }"/>
              <div class="form-group">
                <label for="inputName">제목</label>
                <form:errors path="btitle" cssClass="error" />
                <form:input path="btitle" class="form-control" value="${freeBoard.btitle }" placeholder="제목을 작성해주세요." />
              </div>
              <div class="form-group">
                <label for="inputDescription">내용</label>
                <form:errors path="bcontent" cssClass="error" />
                <form:textarea path="bcontent" class="form-control" id="summernote" value="${freeBoard.bcontent }" />
              </div>

              <div class="row">
                <div class="col d-flex justify-content-end">
                  <a href="/freeBoard/freeBoardDetail?bid=${freeBoard.bid }" class="btn btn-secondary m-1">취소</a>
                  <input type="submit" value="등록" class="btn btn-success m-1">
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
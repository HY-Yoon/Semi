<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="june">
<head>
<meta charset="UTF-8">
<title>TRIPSUDA</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		 width : 1500,
		  height: 600,                 
		  minHeight: 600,             
		  maxHeight: 600,             
		  focus: true                  
		});
	});
</script>

<!-- css적용...? -->

<div id="header">
 	<jsp:include page="../default/default_header.jsp"/>
</div>

<div id="main">

<form method="post" action ="${cp}/board_expert/add" enctype="multipart/form-data">

<div id="main_keyword">
말머리
<select name="keyword">
	<option value="잡담">잡담</option>
	<option value="질문">질문</option>
</select>
</div>

<div id="main_location">
지역선택
<input type="radio" name="location" value="서울">서울
<input type="radio" name="location" value="강원도">강원도
<input type="radio" name="location" value="제주도">제주도
<input type="radio" name="location" value="부산">부산
<input type="radio" name="location" value="경기도">경기도
<input type="radio" name="location" value="충청도">충청도
<input type="radio" name="location" value="경상도">경상도
<input type="radio" name="location" value="전라도">전라도
</div>

<input type="text" id ="title" name="title" style="width: 1500px;">
<textarea id="summernote" name="content">test</textarea>
<input type="hidden" name="mnum" value="${mnum }">
<input type="hidden" name="nick" value="${nick }">
파일첨부	<input type= "file" name="file1"><br>
해시태그  
<input type="text" id ="hashtag" name="hashtag" style="width: 1500px;"><br>
<input type="submit" value="등록">
</form>
</div>

<div id="footer">
	<jsp:include page="../default/default_footer.jsp"/>
</div>
</body>
</html>
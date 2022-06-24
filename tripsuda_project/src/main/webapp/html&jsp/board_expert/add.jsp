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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_expert/add.css?after">

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		  minHeight: 600,             
		  maxHeight: 600,
		  width:1150,
		  placeholder:"내용을 입력하세요.",
		  focus: true                  
		});
	});
	
	function goList() {
		window.location.href="${pageContext.request.contextPath}/html&jsp/board_expert/list.jsp";
	}
</script>
<header>
 	<jsp:include page="../default/default_header.jsp"/>
</header>

<div id="main">
<div class ="img">
<img alt="배경" src="${pageContext.request.contextPath}/images/board_expert/bg.jpg">
</div>

<div class ="content1">
<form method="post" action ="${cp}/board_expert/add" enctype="multipart/form-data">


<div id="main_location">

<span>지역 선택</span>
<input type="radio" name="location" value="서울" id="서울"><label for="서울">서울</label>
<input type="radio" name="location" value="인천" id="인천"><label for="인천">인천</label>
<input type="radio" name="location" value="강원도" id="강원도"><label for="강원도">강원도</label>
<input type="radio" name="location" value="제주도" id="제주도"><label for="제주도">제주도</label>
<input type="radio" name="location" value="부산" id="부산"><label for="부산">부산</label>
<input type="radio" name="location" value="경기도" id="경기도"><label for="경기도">경기도</label>
<input type="radio" name="location" value="충청도" id="충청도"><label for="충청도">충청도</label>
<input type="radio" name="location" value="경상도" id="경상도"><label for="경상도">경상도</label>
<input type="radio" name="location" value="전라도" id="전라도"><label for="전라도">전라도</label>
</div>
<input type="text" id ="title" name="title" placeholder="제목을 입력해주세요">
<textarea id="summernote" name="content" ></textarea>
<input type="hidden" name="mnum" value="${mnum }">
<input type="hidden" name="nick" value="${nick }">
<div class="fileloc">
	<input type= "file" name="file1">
</div>

<div id="main_keyword">
<label>말머리</label>
<select name="keyword">
	<option value="잡담">잡담</option>
	<option value="질문">질문</option>
</select>
</div>

<input type="text" id ="hashtag" name="hashtag" placeholder="태그를 입력해주세요"><br>

<div class="btn">
<input type="button" value="취소" class="can" onclick="goList()">
<input type="submit" value="등록" class="sub">
</div>
</form>
</div>
</div>

<div id="footer">
	<jsp:include page="../default/default_footer.jsp"/>
</div>

</body>
	<script src="${pageContext.request.contextPath}/js/board_expert/default.js"></script>
</html>
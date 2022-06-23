<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/board_qa/qaInsert.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<body>

<form action="${pageContext.request.contextPath }/html&jsp/board_qa/insert_qa" method="post">
	<div id="main">
	<input type="hidden" name="mnum" value="1">
	<input type="hidden" name="nick" value="송2">
	<div id="loc">
		<input type="radio" value="수도권" name="location" id="center">
		<label for="center">수도권</label>
		<input type="radio" value="인천" name="location" id="Incheon">
		<label for="Incheon">인천</label>
		<input type="radio" value="대전" name="location" id="Daejeon">
		<label for="Daejeon">대전</label>
		<input type="radio" value="대구" name="location" id="Daegu">
		<label for="Daegu">대구</label>
		<input type="radio" value="광주" name="location" id="Gwangju">
		<label for="Gwangju">광주</label>
		<input type="radio" value="부산" name="location" id="Busan">
		<label for="Busan">부산</label>
		<input type="radio" value="울산" name="location" id="Ulsan">
		<label for="Ulsan">울산</label>
		<input type="radio" value="강원" name="location" id="Gangwon">
		<label for="Gangwon">강원도</label>
		<input type="radio" value="충청" name="location" id="Chungcheong">
		<label for="Chungcheong">충청도</label>
		<input type="radio" value="경상" name="location" id="Gyeongsang">
		<label for="Gyeongsang">경상도</label>
		<input type="radio" value="전라" name="location" id="Jeolla">
		<label for="Jeolla">전라도</label>
		<input type="radio" value="제주" name="location" id="Jeju">
		<label for="Jeju">제주도</label>
	</div>
	<div id="titlearea">
		<label for="title">Q</label>
		<input type="text" id="qtitle" name="qtitle" placeholder="질문글의 제목을 입력하세요"><br>
	</div>
	<div id="textarea">
		<textarea id="summernote" name="content"></textarea><br>
	</div>
  <script>
  		$('#board_content').val("${board_data.BOARD_CONTENT}");
      	$('#summernote').summernote({
        placeholder: '질문을 입력하세요(1000자 이내)',
        tabsize: 2,
        height: 500,
        disableResizeEditor: true,
        callbacks: {
        	onImageUpload: function(files, editor, welEditable) {
        		for(var i = files.length -1; i>=0; i--) {
        			sendFile(files[i], this);
        		}
        	}
        }
      });
    </script>
	<div id="tagarea">
		<input type="text" id="hashtag" name="hashtag" placeholder="태그 입력(띄어쓰기로 구분, 100자 이내)">
	</div>
	<div id="buttonarea">
		<input type="button" value="취소">
		<input type="submit" value="완료">
	</div>
</div>
</form>
</body>
</html>
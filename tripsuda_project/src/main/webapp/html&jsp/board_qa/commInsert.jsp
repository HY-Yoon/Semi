<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/board_qa/qainsert.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<body>
	<div id="main">
	<div id="boardArea" class="boardArea">
		<div id="titleArea" class="titleArea">
			<img src="${pageContext.request.contextPath}/images/common/icon/question.svg"/>
			<p>${bvo.title }</p>
		</div>
		<div id="contentArea" class="contentArea">
			${bvo.content }
		</div>
		<div id="regdate" class="regdate">
			${bvo.regdate }
		</div>
	</div>
	<div id="commArea" class="commArea">
	<form action="${pageContext.request.contextPath }/html&jsp/board_qa/comminsert_qa" method="post">
		<input type="hidden" name="anum" value="${bvo.anum }">
		<div id="textArea">
			<textarea id="summernote" name="content"></textarea><br>
		</div>
		<script>
		  		$('#board_content').val("${board_data.BOARD_CONTENT}");
		      	$('#summernote').summernote({
		        placeholder: '내용을 입력하세요(100자 이내)',
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
		<div id="buttonarea">
			<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/html&jsp/board_qa/content?anum=${bvo.anum}'">
			<input type="submit" value="완료">
		</div>
	</form>
	</div>
</div>

</body>
</html>
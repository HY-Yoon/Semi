<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function closeme(){
		self.close();
	}
</script>
</head>
<body>
<div>
답변을 채택하고 난 뒤에는 변경할 수 없습니다. 
채택하시겠습니까? 
</div>
<button onclick="closeme()">취소</button><button class="gopage" onclick="opener.parent.location.href='${pageContext.request.contextPath}/html&jsp/board_qa/commselect?cnum=${param.cnum}&anum=${param.anum }'">채택하기</button>

</body>
</html>
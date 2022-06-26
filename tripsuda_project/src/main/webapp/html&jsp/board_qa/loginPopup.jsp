<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	funtion close(){
		self.close();
	}
</script>
</head>
<body>
<div>
로그인이 필요합니다.
로그인하시겠습니까?
</div>
<button onclick="close()">취소</button><button class="gologin" onclick="opener.parent.location.href='${pageContext.request.contextPath}/html&jsp/member/LoginForm.jsp'">로그인하기</button>
</body>
</html>
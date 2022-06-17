<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath", "<%=request.getContextPath() %>");
</script>
</head>
<body>

<h1>로그인</h1>
<form action="login" method="post">
	아이디 <input type="text" name="id"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<input type="submit" value="접속">
</form>

</body>
</html>
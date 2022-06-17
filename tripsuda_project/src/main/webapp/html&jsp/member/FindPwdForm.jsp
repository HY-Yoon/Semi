<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<h1>비밀번호 찾기</h1>
<p>아이디와 이름,핸드폰 번호를 입력하세요</p>
  <form name="findPwd" method="POST" action="${pageContext.request.contextPath}/FindPwdForm">
    <label> 아이디 : <input type="text" name="id" maxlength="50" placeholder="ID을 입력하세요"></label><br>
    <label> 이름 : <input type="text" name="name" maxlength="50" placeholder="이름을 입력하세요"></label><br>
    <label> 핸드폰 번호 : <input type="text" name="phone" maxlength="50" placeholder="핸드폰 번호를 입력하세요"></label>
    <input type="submit" value="찾기">
  </form>
</body>
</html>
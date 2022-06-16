<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<script type="text/javascript">
   function checkValue(){
	  if(!document.deleteform.pwd.value){
		alert("비밀번호를 입력하지 않았습니다.");
		return false;
	 }
   }
   function goMain(){
		  location.href="${pageContext.request.contextPath}/html&jsp/Menu.jsp";  //메인 화면으로 
	   }
</script>
<body>
	<form name="deleteform" method="post" action="${pageContext.request.contextPath}/memberDelete" onsubmit="return checkValue()">

		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type="pwd" name="pwd" maxlength="50"></td>
			</tr>
		</table>

		<br> <input type="button" value="취소" onclick="goMain()"> 
		<input type="submit" value="탈퇴">
	</form>
</body>
</html>
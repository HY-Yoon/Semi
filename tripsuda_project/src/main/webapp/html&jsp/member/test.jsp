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
	  if(!confirm("탈퇴하시면 작성한 글과 댓글은 자동으로 지워지지 않습니다. 탈퇴하시겠습니까?")){
		  alert("비밀번호를 확인하세요");
	  }else{
		  alert("탈퇴되셨습니다.");
	  }
   }
   

   function goMain(){
		  location.href="${pageContext.request.contextPath}/community";  //메인 화면으로 
	   }
</script>
<body>
<h1>회원 탈퇴</h1>
	<form name="deleteform" method="post" action="${pageContext.request.contextPath}/memberDelete." onsubmit="return checkValue()">

		<div class="input-box">
				<label for="pwd">비밀번호</label>
				<input type="pwd" name="pwd" maxlength="50"></td>
		</div>
        <div class="input-box"> 
            <input type="button" value="취소" onclick="goMain()"> 
		    <input type="submit" value="탈퇴">
		</div>    
	</form>
</body>
</html>
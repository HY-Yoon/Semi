<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board_free/login.css">
<script type="text/javascript">
   function checkValue(){
	   var form = document.loginForm;
	   var id=form.id.value;
       var pwd=form.pwd.value;
       
       if(id==""){
  		 alert("아이디를 입력하세요"); 
           return false;
  	   }
       
       if(pwd==""){
  		 alert("비밀번호를 입력하세요");
  		 return false;
       }
   }
   
   function goFirstForm() {
		location.href="${pageContext.request.contextPath}/community";
	}
   
   function FindId(){
	   window.open("${pageContext.request.contextPath}/html&jsp/member/FindIdForm.jsp","FindIdForm","width=500, height=250, resizable=no, scrollbars=no");
   }
   
   function FindPwd(){
	   window.open("${pageContext.request.contextPath}/html&jsp/member/FindPwdForm.jsp","FindPwdForm","width=500, height=250, resizable=no, scrollbars=no");
   }
   
</script>
</head>
<body>
<header><h2>Login</h2></header>
<form name="loginForm" method="post" action="${pageContext.request.contextPath}/LoginForm" 
onsubmit="return checkValue()"  content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
  <div class="input-box">
    <label for="id">아이디</label> 
    <input type="text" name="id" id="id" maxlength="50" placeholder="ID를 입력하세요"></label><br>
  </div>
  <div class="input-box">
    <label for="pwd">비밀번호</label> 
    <input type="password" name="pwd" id="pwd" size="20" maxlength="50"  placeholder="비밀번호를 입력하세요"></label>
  </div>
  <br>
  <div id="err">${errMsg }</div>
    <input type="button" value="아이디찾기" onclick="FindId()">
    <input type="button" value="비번찾기" onclick="FindPwd()">
  
   <input type="submit" value="로그인"/>
  <div id="back"> 
   <input type="button" value="돌아가기" onclick="goFirstForm()">
   </div>
</form>
</body>
</html>
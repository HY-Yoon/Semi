<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">

function aaaaaaa(){
	   var xhr=null;
	   console.log(1);
	   let id = document.getElementById("id").value;
	   let name = document.getElementById("name").value;
	   let phone = document.getElementById("phone").value;
	   console.log(id);
	   xhr=new XMLHttpRequest();
	   xhr.onreadystatechange=function(){
		   if(xhr.readyState==4 && xhr.status==200){
			   let data=xhr.responseXML;
			   let code=data.getElementsByTagName("code")[0].firstChild.nodeValue;
			   var div=document.getElementById("result");
			   console.log(result);
			   if(code=='success'){
				   var pwd=data.getElementsByTagName("pwd")[0].firstChild.nodeValue;
				   div.innerHTML="비밀번호:"+pwd;
			   }else{
				   div.innerHTML="해당정보가 존재하지 않습니다";
				   
			   }
		   }
	   };
	   xhr.open('get','FindPwd.jsp?id='+ id + '&name='+name + '&phone=' + phone,true); //
	   xhr.send();
	  
}
</script>
</head>
<body>
<h1>비밀번호 찾기</h1>
<p>아이디와 이름,핸드폰 번호를 입력하세요</p>
  <form name="findPwd" method="get">
    <label> 아이디 : <input type="text" id="id" name="id" maxlength="50" placeholder="ID을 입력하세요"></label><br>
    <label> 이름 : <input type="text" id="name" name="name" maxlength="50" placeholder="이름을 입력하세요"></label><br>
    <label> 핸드폰 번호 : <input type="text" id="phone" name="phone" maxlength="50" placeholder="핸드폰 번호를 입력하세요"></label>
    <input type="button" value="찾기" onclick="aaaaaaa()">
    <div id="result"></div>
  </form>
</body>
</html>
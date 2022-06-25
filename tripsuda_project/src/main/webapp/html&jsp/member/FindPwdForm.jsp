<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_free/FindPwd.css">
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
<span>아이디와 이름,핸드폰 번호를 입력하세요</span>
  <form name="findPwd" method="get" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
    <div class="input-box">
       <label for="id"> 아이디 </label> 
       <input type="text" id="id" name="id" maxlength="50" placeholder="ID을 입력하세요"></label><br>
    </div>
    <div class="input-box">
       <label for="name"> 이름 </label> 
       <input type="text" id="name" name="name" maxlength="50" placeholder="이름을 입력하세요"></label><br>
    </div>
    <div class="input-box">
       <label for="phone"> 핸드폰 번호 </label> 
       <input type="text" id="phone" name="phone" maxlength="50" placeholder="핸드폰 번호를 입력하세요"></label>
       </div>
       <div class="input-box">
    <input type="button" value="찾기" onclick="aaaaaaa()">
    </div>
    <div id="result"></div>
 
  </form>

</body>
</html>
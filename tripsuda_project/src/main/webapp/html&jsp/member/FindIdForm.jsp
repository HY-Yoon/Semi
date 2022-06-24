<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_free/FindId.css">
<script type="text/javascript">
function aa(){
	   var xhr=null;
	   let name = document.getElementById("name").value;
	   let phone = document.getElementById("phone").value;
	   xhr=new XMLHttpRequest();
	   xhr.onreadystatechange=function(){
		   if(xhr.readyState==4 && xhr.status==200){
			   let data=xhr.responseXML;
			   let code=data.getElementsByTagName("code")[0].firstChild.nodeValue;
			   var div=document.getElementById("result");
			   console.log(result);
			   if(code=='success'){
				   var id=data.getElementsByTagName("id")[0].firstChild.nodeValue;
				   div.innerHTML="아이디:"+id;
			   }else{
				   div.innerHTML="해당정보가 존재하지 않습니다";
				   
			   }
		   }
	   };
	   xhr.open('get','FindId.jsp?name='+name + '&phone=' + phone,true); //
	   xhr.send();  
}
</script>
</head>
<body>
<header><h1>아이디 찾기</h1></header>
<span >이름과 핸드폰 번호를 입력하세요</span>
  <form name="findId" method="get" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
    <div class="input-box">
       <label for="name"> 이름 </label> 
       <input type="text" id="name" name="name" maxlength="50" placeholder="이름을 입력하세요"></label><br>
    </div>
    <div class="input-box">
       <label for="pwd"> 핸드폰 번호</label>
       <input type="text" id="phone" name="phone" maxlength="50" placeholder="핸드폰 번호를 입력하세요"></label>
    </div>
    <input type="button" value="찾기"  onclick="aa()">
    <span>
    <div id="result"></div>
    </span>
  </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
<h1>아이디 찾기</h1>
<p>이름과 핸드폰 번호를 입력하세요</p>
  <form name="findId" method="get">
    <label> 이름 : <input type="text" id="name" name="name" maxlength="50" placeholder="이름을 입력하세요"></label><br>
    <label> 핸드폰 번호 : <input type="text" id="phone" name="phone" maxlength="50" placeholder="핸드폰 번호를 입력하세요"></label>
    <input type="button" value="찾기"  onclick="aa()">
    <div id="result"></div>
  </form>
</body>
</html>
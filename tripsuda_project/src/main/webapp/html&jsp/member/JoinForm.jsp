<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>

</style>
<script type="text/javascript">

  //submit 제출 시 입력값들을 검사한다.
  function checkValue(){
	  var form = document.joinform;
	  var id=form.id.value;
	  var pwd=form.pwd.value;
	  var pwd2=form.pwd2.value;
	  var name=form.name.value;
	  var nickname=form.nickname.value;
	  var phone=form.phone.value;
	  var favorite=form.favorite;
	  
	  if(id==""){
		 alert("아이디를 입력하세요"); //css처리, <p>위치에 처리
		 //document. INNERHtml 이용
		 return false; //포커스 id.focus(); >회원가입 실패
	  }
	  
	  if((id <"0" || id > "9") && (id <"A" || id >"Z") && (id<"a" || id>"z")){
		  alert("아이디는 영문자와 숫자 조합으로만 가능합니다.");
		  return false;
	  }
	  
	  if(id.length < 4 || id.length > 12){
		  alert("아이디는 4자~12자 사이만 가능합니다");
		  return false;
	  }
	  if(joinform.idDuplication.value!="idCheck"){
		  alert("아이디 중복 체크를 해주세요");
	  }
	  
	  if(pwd==""){
		 alert("비밀번호를 입력하세요");
		 return false;
      }
	  
	  if((pwd <"0" || pwd > "9") && (pwd <"A" || pwd >"Z") && (pwd <"a" || pwd >"z")){
		  alert("비밀번호는 영문자와 숫자 조합으로만 가능합니다.");
		  return false;
	  }
	  
	  if(pwd.length < 8 || pwd.length > 20){
		  alert("비밀번호는 8자~20자 사이만 가능합니다");
		  return false;
	  }
	  if(pwd2==""){
		 alert("비밀번호 확인란을 입력하세요");
		 return false;
	  }
	  
	  if(pwd!=pwd2){
	     alert("비밀번호를 같아야합니다");
	     return false;
	  }
	  
	  if(name==""){
		 alert("이름을 입력하세요");
		 return false;
	  }
		  
	  if(nickname==""){
		 alert("닉네임을 입력하세요");
		 return false;
      }
	  
	  //닉네임 중복체크를 꼭 눌러야함
	  
	  if(phone==""){
	     alert("전화번호를 입력하세요");
	     return false;
      }
	  
	  if(isNaN(phone)){
	     alert("전화번호는 - 제외한 숫자만 입력하세요");
	     return false;
      }
		  
	  if(favorite.selectedIndex==0){
		  alert("관심지역을 선택하세요");
		  return false;
	  }	  
	
   }
   function goMain(){
	  location.href="${pageContext.request.contextPath}/html&jsp/Menu.jsp";  //메인 화면으로 
   }
	
   function checkId(){
	  
	   let id = document.getElementById("id").value;
	   console.log(id);
	   let xhr=new XMLHttpRequest();
	   xhr.onreadystatechange=function(){
		   if(xhr.readyState==4 && xhr.status==200){
			   let data=xhr.responseText;
			   let result=JSON.parse(data);
			   console.log(result);
			   if(result.exist==true){
				   document.getElementById("u_id_check").innerHTML="사용중인 아이디입니다.";
				   
			   }else{
				   document.getElementById("u_id_check").innerHTML="사용가능한 아이디입니다.";
				   
			   }
		   }
	   };
	   xhr.open('get','CheckIdForm.jsp?id=' + id,true); //
	   xhr.send();
	  
   }
   
</script>
</head>
<body>
<form name="joinform" action="${pageContext.request.contextPath}/JoinForm" method="post" onsubmit="return checkValue()">
 <fieldset>
   <legend>회원 가입</legend>
    <label>아이디 : <input type="text" name="id" id="id" placeholder="ID를 입력하세요"  autofocus></label>
    <input type="button" id="id_check" value="아이디중복확인" onclick="checkId()">
    <p id="u_id_check"></p>
    <input type="hidden" name="idDuplication" value="idUncheck"/>
    <label>비밀 번호 : <input type="text" name="pwd" id="pwd" size="20" placeholder="영문숫자 조합 8자리 이상이어야 합니다."></label><br>
    비밀 번호 확인 : <input type="text" name="pwd2" id=pwd2 size="20" placeholder="위와 똑같이 입력하세요."><br>
    <label>이름 : <input type="text" name="name" id="name"></label><br> 
    <label>닉네임 : <input type="text" name="nickname" id=nickname"></label>
    <input type="button" value="닉네임중복확인" onclick="checkNick"><br>
    <label>핸드폰 번호 : <input type="text" name="phone" id="phone" placeholder="하이픈(-)없이 입력하세요"></label><br> 
    <label>관심 지역</label>
     <select name="favorite" id="favorite">
       <option value="선택하기" selected>선택하기</option> <!-- 선택하기 -->
       <option value="서울">서울</option>
       <option value="경기도">경기도</option>
       <option value="강원도">강원도</option>
       <option value="제주도">제주도</option>
       <option value="부산">부산</option>
       <option value="충청도">충청도</option>
       <option value="경상도">경상도</option>
       <option value="전라도">전라도</option>
     </select><br>
    <input type="submit" value="가입하기">
    <input type="reset" value="취소" onclick="goMain()">
 </fieldset>
</form>
</body>
</html>